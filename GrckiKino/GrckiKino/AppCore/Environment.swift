//
//  Environment.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 13.8.24..
//

import Foundation

public enum EnvironmentValues {
    enum Keys {
        static let serverURL = "server_url"
        static let appName = "CFBundleName"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let serverURL: String = {
        guard let serverURLString = EnvironmentValues.infoDictionary[Keys.serverURL] as? String else {
            fatalError("Key '\(Keys.serverURL)' not found in plist")
        }
        return serverURLString
    }()
    
    static let appName: String = {
       guard let appName = EnvironmentValues.infoDictionary[Keys.appName] as? String else {
           fatalError("Key '\(Keys.appName)' not found in plist")
       }
       return appName
    }()
}
