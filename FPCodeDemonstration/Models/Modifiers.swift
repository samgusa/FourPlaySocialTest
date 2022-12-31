//
//  Modifier.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import Foundation
import SwiftUI


struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .underline()
      .foregroundColor(Color.FPText)
      .font(.custom(FontConstants.Inter.regular, size: FontConstants.Size.FPRegular))
      .onTapGesture {
        if let urlString = UIApplication.openSettingsURLString as? String {
          let url = URL(string: urlString)
          if let url = url {
            UIApplication.shared.open(url)
          }
        }
      }

  }
}

extension Text {
  func customText() -> some View {

    self.modifier(TitleModifier())
  }
}
