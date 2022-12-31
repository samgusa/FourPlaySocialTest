//
//  TopTextView.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import SwiftUI

struct TopTextView: View {

    var photoManager = PhotoManager()
    var vm = MainViewModel()

    var body: some View {
      Text(photoManager.photos != .denied ? vm.firstHeaderText : vm.secondHeaderText)
        .foregroundColor(Color.FPText)
        .font(.custom(FontConstants.Inter.semiBold, fixedSize: FontConstants.Size.FPTitle))
        .padding(.bottom)


      Text(photoManager.photos != .denied ? vm.firstBodyText : vm.secondBodyText)
        .foregroundColor(Color.FPText)
        .font(.custom(FontConstants.Inter.regular, fixedSize: FontConstants.Size.FPRegular))
        .padding(.bottom)


      if photoManager.photos == .denied {
        Text("Settings")
          .customText()

      }
    }
}

struct TopTextView_Previews: PreviewProvider {
  var vm = MainViewModel()
    static var previews: some View {
      TopTextView()
    }
}
