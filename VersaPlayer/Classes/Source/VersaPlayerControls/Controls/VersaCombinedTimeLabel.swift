//
//  VersaCombinedTimeLabel.swift
//  Pods-VersaPlayerTest_iOS
//
//  Created by Kayvan on 2/16/20.
//

import UIKit

open class VersaCombinedTimeLabel: UILabel {
    
    open func update(toTime: TimeInterval, totalTime: TimeInterval) {
        var timeFormat: String = "HH:mm:ss"
        if toTime <= 3599{
            timeFormat = "mm:ss"
        }
        let date = Date(timeIntervalSince1970: toTime)
        let totalDate = Date(timeIntervalSince1970: totalTime)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        formatter.dateFormat = timeFormat
        
        
        text = "\(formatter.string(from: date)) / \(formatter.string(from: totalDate))"
    }
}
