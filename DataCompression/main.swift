//
//  main.swift
//  DataCompression
//
//  Created by Посудин Константин Михайлович on 12.06.2018.
//  Copyright © 2018 tin. All rights reserved.
//

import Foundation
import Cocoa

extension NSImage {

    
    /// Returns a png representation of the current image.
    var PNGRepresentation: Data? {
        if let tiff = self.tiffRepresentation, let tiffData = NSBitmapImageRep(data: tiff) {
            return tiffData.representation(using: .png, properties: [:])
        }
        
        return nil
    }
}


let imageName = "img"
let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(imageName).png"
let imageUrl: URL = URL(fileURLWithPath: imagePath)


print(imageUrl)
print(imagePath)


var image = NSImage(byReferencingFile: "/Users/tin/Documents/img.png")!

func compress(image: NSImage, w: Int, h: Int) -> NSImage {
    let destSize = NSMakeSize(CGFloat(w), CGFloat(h))
    let newImage = NSImage(size: destSize)
    newImage.lockFocus()
    image.draw(in: NSMakeRect(0, 0, destSize.width, destSize.height), from: NSMakeRect(0, 0, image.size.width, image.size.height), operation: NSCompositingOperation.sourceOver, fraction: CGFloat(1))
    newImage.unlockFocus()
    newImage.size = destSize
    return NSImage(data: newImage.tiffRepresentation!)!
}
let new_img = compress(image: image, w: 15, h: 15)
let png = new_img.PNGRepresentation
try png?.write(to: imageUrl)
