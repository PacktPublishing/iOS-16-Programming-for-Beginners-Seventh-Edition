//
//  Device.swift
//  LetsEat
//
//  Created by iOS16Programming on 03/10/2022.
//

import UIKit

enum Device {
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
