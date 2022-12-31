//
//  ImageView.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI

struct ImageView: View {

  var croppedImage: Image?
  var selectedImage: UIImage?
  let btnAction: () -> Void

    var body: some View {
      ZStack {
        if croppedImage != nil {
          croppedImage?
            .resizable()
            .cornerRadius(10)

        } else {

          if selectedImage != nil {
            if let image = selectedImage {
              Image(uiImage: image)
                .resizable()
                .frame(width: 315, height: 392)
                .cornerRadius(10)
            }

          } else {
            Color(hex: "#5482FF")
              .ignoresSafeArea()
              .cornerRadius(10)

            Button {
              btnAction()
            } label: {
              Image(systemName: "plus")
                .foregroundColor(Color.FPAccent)
                .font(.custom(FontConstants.Inter.bold, fixedSize: 50))
            }
          }
        }
      }

    }

}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
      ImageView {
        print("OK")
      }
    }
}
