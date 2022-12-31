//
//  CameraVectorBtns.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI

struct CameraVectorBtns: View {

  var selectedImage: UIImage? = nil
  @Binding var croppedImage: Image?
  @Binding var showCropper: Bool

  var cameraBtnAction: () -> Void
  var vectorBtnAction: () -> Void


    var body: some View {
      if selectedImage != nil || croppedImage != nil {
        VStack {
          HStack {
            Button {
              cameraBtnAction()
            } label: {
              Image(systemName: "camera")
                .foregroundColor(.white)
                .font(.custom(FontConstants.Inter.bold, fixedSize: 30))
                .shadow(color: .black, radius: 2)
                .padding()

            }
            
            Spacer()
            Button {
              vectorBtnAction()
            } label: {
              Image("Vector")
                .foregroundColor(.white)
                .font(.custom(FontConstants.Inter.bold, fixedSize: 30))
                .shadow(color: .black, radius: 2)
                .padding()
            }
          }
          Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $showCropper) {
          if let image = selectedImage {
            ImageCroppingView(shown: $showCropper, image: image, croppedImage: $croppedImage)
          }

        }
      }
    }
}
