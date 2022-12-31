//
//  NewView.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI
import PhotosUI

struct NewView: View {
  @StateObject var cameraManager = CameraManager()
  @StateObject var photoManager = PhotoManager()
  @ObservedObject var vm = MainViewModel()
  @State var croppedImage: Image? = nil
  @State private var selectedImage: UIImage?
  @State private var selectedItem: PhotosPickerItem?


  var body: some View {
    ZStack {
      Color.FPBackground
        .ignoresSafeArea()

      VStack(alignment: .leading) {

        TopTextView(photoManager: photoManager, vm: vm)

        mainImageView
          .frame(width: 315, height: 392)
          .padding(.bottom)
          .onReceive(cameraManager.$permissionGranted) { granted in
            cameraManager.requestPermission()
          }
          .onReceive(photoManager.$permissionGranted) { granted in
            photoManager.requestPermission()
          }

        RoundView(croppedImage: croppedImage, selectedImage: selectedImage)
      }
      .multilineTextAlignment(.leading)
      .frame(width: 285)
      .sheet(isPresented: self.$vm.bottomAppear) {

        BottomView(cameraBtnAction: {
          self.vm.isCameraPickerDisplay.toggle()
          self.vm.bottomAppear.toggle()
        },
        photoBtnAction: { newValue in

          self.vm.bottomAppear.toggle()
          Task {
            if let imageData = try? await newValue?.loadTransferable(type: Data.self), let libImage = UIImage(data: imageData) {
              if croppedImage == nil {
                self.selectedImage = libImage
              } else {
                self.croppedImage = Image(uiImage: libImage)
              }


            }
          }
        },
         selectedItem: $selectedItem)
      }
      .sheet(isPresented: self.$vm.isCameraPickerDisplay) {
        ImagePickerView(selectedImage: self.$selectedImage, croppedImage: self.$croppedImage)

      }
    }
  }

  private var mainImageView: some View {
    ZStack {
      ImageView(
        croppedImage: self.croppedImage,
        selectedImage: selectedImage) {
          withAnimation {
            if photoManager.photos != .denied {
              self.vm.bottomAppear.toggle()
            }
          }
        }

      CameraVectorBtns(selectedImage: selectedImage, croppedImage: $croppedImage, showCropper: $vm.showCropper) {
        self.vm.bottomAppear.toggle()
      } vectorBtnAction: {
        self.vm.showCropper.toggle()
      }

    }
  }
}

struct NewView_Previews: PreviewProvider {
  static var previews: some View {
    NewView()
  }
}
