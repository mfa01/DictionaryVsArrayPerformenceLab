//
//  ParkBenchTimer.swift
//  ArrayVSDisctionaryPerformenceLab
//
//  Created by Mohammad Alabed on 01/06/2022.
//

import Foundation
import CoreFoundation

class ParkBenchTimer {
    var startTime: CFAbsoluteTime
    var endTime: CFAbsoluteTime?

    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }

    func stop() -> Double {
        endTime = CFAbsoluteTimeGetCurrent()
        return endTime! - startTime
    }
}
