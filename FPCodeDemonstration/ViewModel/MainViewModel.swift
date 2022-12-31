import Foundation
import SwiftUI


class MainViewModel: ObservableObject {

  var isCameraPickerDisplay = false
  var showCropper: Bool = false
  var bottomAppear: Bool = false
  let firstHeaderText: String = "Add a photo of yourself"
  let secondHeaderText: String = "You need a photo to finish setting up."
  let firstBodyText: String = "Show people on Fourplay which teammate you are."
  let secondBodyText: String = "Allow Fourplay to access your camera and photos in your phone's settings"

  
}
