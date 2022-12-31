//
//  RoundView.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI

struct RoundView: View {

  var croppedImage: Image?
  var selectedImage: UIImage?

    var body: some View {
      ZStack {
        HStack {
          Spacer()
          Button {
            print("Next")
          } label: {
            Image(systemName: "greaterthan")
              .frame(width: 52, height: 52)
              .foregroundColor(.black)
              .background(croppedImage == nil || selectedImage == nil ? Color.FPLiteBlue : .FPAccent)
              .clipShape(Circle())
          }
        }
        .frame(width: 315)
      }
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        RoundView()
    }
}
