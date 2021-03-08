//
//  QRCodeViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/02/2021.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

class QRCodeViewModel: BaseViewModel {
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
