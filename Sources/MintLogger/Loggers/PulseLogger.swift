//
//  PulseLogger.swift
//  
//
//  Created by Vladimir Golovkin on 16.12.2021.
//

import Logging
import Foundation
import UIKit
import PulseUI
import Pulse

public typealias UIEventSubtype = UIEvent.EventSubtype

public final class UIPulseWindow: UIWindow {
        
    override public func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        #if DEBUG
        guard let rootVC = self.rootViewController else { return }

        if (event!.type == .motion && event!.subtype == .motionShake),
           !(rootVC is PulseUI.MainViewController) {
            let vc = PulseUI.MainViewController()
            vc.modalPresentationStyle = .pageSheet
            rootVC.present(vc, animated: true)
        } else {
            super.motionEnded(motion, with: event)
        }
        #endif
    }
}


public final class PulseLogger: LoggerType {
    
    private let logger: Logging.Logger = Logging.Logger(label: "pulse_logger")
    
    public init() {

    }
    
    public func log(_ level: LogLevel, tag: LogTag, className: String, _ message: String) {
        print("🍕")
        switch level {
        case .debug:
            logger.debug("🟢 DEBUG: \n[\(className)]\n\t -> \(message)")
        case .info:
            logger.info("🔵 INFO: \n[\(className)]\n\t -> \(message)")
        case .warning:
            logger.warning("🟡 WARNING: \n[\(className)]\n\t -> \(message)")
        case .error:
            logger.error("🔴 ERROR: \n[\(className)]\n\t -> \(message)")
        default:
            logger.notice("🟣 VERBOSE: \n[\(className)]\n\t -> \(message)")
        }
    }
}
