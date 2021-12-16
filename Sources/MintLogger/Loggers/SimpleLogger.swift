//
//  SimpleLogger.swift
//  
//
//  Created by Vladimir Golovkin on 16.12.2021.
//

import UIKit

public final class SimpleLogger: LoggerType {
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter
    }()
    
    private var timestamp: String {
        return self.dateFormatter.string(from: Date())
    }
    
    init() {}
    
    public func log(_ level: LogLevel, tag: LogTag, className: String, _ message: String) {
        #if DEBUG
        switch level {
        case .debug:
            print("\(self.timestamp) 💚 DEBUG: \n[\(tag.rawValue)][\(className)] \n -> \(message) \n")
        case .error:
            print("\(self.timestamp) ❤️ ERROR: \n[\(tag.rawValue)][\(className)] \n -> \(message) \n")
        case .info:
            print("\(self.timestamp) 💙 INFO: \n[\(tag.rawValue)][\(className)] \n -> \(message) \n")
        case .warning:
            print("\(self.timestamp) 💛 WARNING: \n[\(tag.rawValue)][\(className)] \n -> \(message) \n)")
        default:
            print("\(self.timestamp) 💜 VERBOSE: \n [\(tag.rawValue)][\(className)] \n -> \(message) \n")
        }
        #endif
    }
}
