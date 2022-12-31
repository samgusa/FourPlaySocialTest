//
//  PhotoPicker.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {

  @Binding var selectedItem: PhotosPickerItem?
  var onChangeAction: ((PhotosPickerItem?)) -> Void
  var vm = MainViewModel()


    var body: some View {
      PhotosPicker(selection: $selectedItem) {
        HStack {
          Text("Photo")
            .foregroundColor(Color.FPBackground)
            .font(.custom(FontConstants.Inter.regular, fixedSize: FontConstants.Size.FPHeading))
        }
      }
      .onChange(of: selectedItem) { newValue in
        onChangeAction(newValue)
      }
    }
}
