//
//  FileManagerExtension.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 25/6/2566 BE.
//

import Foundation

extension FileManager {
    
    var documentDirectory: URL? {
        self.urls(for: SearchPathDirectory.documentDirectory, in: SearchPathDomainMask.userDomainMask).first
    }
    
    func copyItemToDocumentDirectory(from sourceURL: URL) -> URL? {
        guard let documentDirectory = documentDirectory else { return nil}
        
        let fileName = sourceURL.lastPathComponent
        let destinationURL = documentDirectory.appendingPathComponent(fileName)
        
        if self.fileExists(atPath: destinationURL.path()) {
            return destinationURL
        } else {
            do {
                try self.copyItem(at: sourceURL, to: destinationURL)
                return destinationURL
            } catch let error {
                print("Unable to copy file: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    func removeItemFromDocumentDirectory(url:URL) {
        guard let documentDirectory = documentDirectory else { return }
        
        let fileName = documentDirectory.lastPathComponent
        let destinationURL = documentDirectory.appendingPathComponent(fileName)
        
        if self.fileExists(atPath: destinationURL.path()) {
            do {
                try self.removeItem(at: url)
            } catch let error {
                print("Unable to Remove file: \(error.localizedDescription)")
            }
        }
    }
    
    func getContentsOfDirectory(_ url: URL) -> [URL] {
        var isDirectory: ObjCBool = false
        
        guard FileManager.default.fileExists(atPath: url.path(), isDirectory: &isDirectory), isDirectory.boolValue else { return [] }
        
        do {
            return try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
        } catch let error {
            print("Unable to get conents from Directory: \(error.localizedDescription)")
        }
        return []
    }
        
    	
    
    
}
