//
//  Managers.swift
//  FPCodeDemonstration
//
//  Created by Sam Greenhill on 12/30/22.
//

import Foundation
import PhotosUI

class CameraManager : ObservableObject {
  @Published var permissionGranted = false

  func requestPermission() {
    AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
      DispatchQueue.main.async {
        self.permissionGranted = accessGranted
      }
    })
  }
}

class PhotoManager: ObservableObject {
  @Published var permissionGranted = false
  @Published var photos = PHPhotoLibrary.authorizationStatus()
  func requestPermission() {

    PHPhotoLibrary.requestAuthorization({ status in
      DispatchQueue.main.async {
        if status == .authorized {
          self.permissionGranted = true
        } else {
          self.permissionGranted = false
        }
      }
    })

  }
}
