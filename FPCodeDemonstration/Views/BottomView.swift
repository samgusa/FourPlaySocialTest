//
//  BottomView.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI
import PhotosUI

struct BottomView: View {

  var cameraBtnAction: () -> Void
  var photoBtnAction: (PhotosPickerItem?) -> Void
  @Binding var selectedItem: PhotosPickerItem?


    var body: some View {
      VStack {
        Button {
          cameraBtnAction()

        } label: {
          VStack {
            Spacer()
            HStack {
              Text("Camera")
                .foregroundColor(Color.FPBackground)
                .font(.custom(FontConstants.Inter.regular, fixedSize: FontConstants.Size.FPHeading))
            }
            .padding()
            .frame(alignment: .leading)

            PhotoPicker(selectedItem: $selectedItem) { newValue in
              photoBtnAction(newValue)
            }
            .padding()
            .frame(alignment: .leading)
            Spacer()
          }
        }
      }
      .presentationDetents([.fraction(0.20)])
    }
}

