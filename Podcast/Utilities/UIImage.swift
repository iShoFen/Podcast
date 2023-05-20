//
//  UIImage.swift
//  sampleApp
//
//  Created by etudiant on 09/05/2023.
//

import Foundation
import SwiftUI

extension UIImage {
    func getDominantColor() -> UIColor? {
         
        let image = self.resize(to: CGSize(width: 10, height: 10))
        guard let cgImage = image.cgImage else { return nil }
        let colorSpace = cgImage.colorSpace // RGB, grayscale

        // the color space model
        let colorSpaceModel = CGColorSpaceModel(rawValue: (colorSpace?.model.rawValue)!)!
        // check if RGB or grayscale
        let colorspaceRef = colorSpaceModel == .monochrome ? CGColorSpaceCreateDeviceGray() : CGColorSpaceCreateDeviceRGB()
        
        // cerate a a new drawing context
        let contextRef = CGContext(data: nil,
                                    width: Int(image.size.width),
                                    height: Int(image.size.height),
                                    bitsPerComponent: 8,
                                    bytesPerRow: Int(image.size.width) * 4,
                                    space: colorspaceRef,
                                    bitmapInfo: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue)!

        // draw the image on the context
        contextRef.draw(image.cgImage!, in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))

        // get the pixelData (all RGB data from each pixel)
        guard let pixelData = contextRef.data?.assumingMemoryBound(to: UInt8.self) else { return nil }

        var rValues = [CGFloat]()
        var gValues = [CGFloat]()
        var bValues = [CGFloat]()

        for x in 0..<Int(image.size.width) {
            for y in 0..<Int(image.size.height) {
                let pixelIndex = (Int(image.size.width) * y + x) * 4

                if colorSpaceModel == .monochrome {
                    rValues.append(CGFloat(pixelData[pixelIndex + 1]) / 255.0)
                    gValues.append(CGFloat(pixelData[pixelIndex + 1]) / 255.0)
                    bValues.append(CGFloat(pixelData[pixelIndex + 1]) / 255.0)
                } else {
                    rValues.append(CGFloat(pixelData[pixelIndex + 2]) / 255.0)
                    gValues.append(CGFloat(pixelData[pixelIndex + 1]) / 255.0)
                    bValues.append(CGFloat(pixelData[pixelIndex]) / 255.0)
                }
            }
        }

        // create clusters to groups pixels
        var clusters = [(r: CGFloat, g: CGFloat, b: CGFloat)]()
        for _ in 0..<5 {
            clusters.append((rValues.randomElement()!, gValues.randomElement()!, bValues.randomElement()!))
        }

        var clusterCounts = [Int](repeating: 0, count: clusters.count)

        for _ in 0..<10 {
            clusterCounts = [Int](repeating: 0, count: clusters.count)
            
            var newClusters = [(r: CGFloat, g: CGFloat, b: CGFloat)]()
            for _ in clusters {
                newClusters.append((0, 0, 0))
            }

            // improved cluster precision
            for i in 0..<rValues.count {
                var minDistance = CGFloat.greatestFiniteMagnitude
                var minIndex = -1

                for j in 0..<clusters.count {
                    let distance = pow(rValues[i] - clusters[j].r, 2) + pow(gValues[i] - clusters[j].g, 2) + pow(bValues[i] - clusters[j].b, 2)
                    if distance < minDistance {
                        minDistance = distance
                        minIndex = j
                    }
                }

                newClusters[minIndex].r += rValues[i]
                newClusters[minIndex].g += gValues[i]
                newClusters[minIndex].b += bValues[i]
                clusterCounts[minIndex] += 1
            }

            for i in 0..<newClusters.count {
                if clusterCounts[i] > 0 {
                    newClusters[i].r /= CGFloat(clusterCounts[i])
                    newClusters[i].g /= CGFloat(clusterCounts[i])
                    newClusters[i].b /= CGFloat(clusterCounts[i])
                }
            }

            clusters = newClusters
        }

        var maxClusterCount = -1
        var maxClusterIndex = -1
        
        // check the cluster with the most element to find the dominant colors
        for i in 0..<clusterCounts.count {
            if clusterCounts[i] > maxClusterCount {
                maxClusterCount = clusterCounts[i]
                maxClusterIndex = i
            }
        }

        // return the dominant colors
        return UIColor(red: clusters[maxClusterIndex].r,
                       green: clusters[maxClusterIndex].g,
                       blue: clusters[maxClusterIndex].b,
                       alpha: 1.0)
    }
    
    func resize(to targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let ratio = min(widthRatio, heightRatio)

        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? self
    }
}
