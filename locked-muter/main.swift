//
//  main.swift
//  locked-muter
//
//  Created by Yosef Fertel on 12/9/20.
//

import Foundation
import CoreAudioKit

NSLog("Starting locked-muter V2")

let notifcationCenter = DistributedNotificationCenter.default()

// Used to track whether we have done the mutation
var mutedTheVolume: Bool = false

notifcationCenter.addObserver(
    forName: .init("com.apple.screenIsLocked"),
    object: nil,
    queue: .main,
    using: { not in
        if (!NSSound.getVolumeIsMuted(deviceId: NSSound.findOutputDeviceByName(name: "MacBook Pro Speakers"))) {
            NSSound.deviceVolumeSetMuted(deviceId: NSSound.findOutputDeviceByName(name: "MacBook Pro Speakers"), m: true)
            mutedTheVolume = true
            NSLog("Muted")
        }
    }
)

notifcationCenter.addObserver(
    forName: .init("com.apple.screenIsUnlocked"),
    object: nil,
    queue: .main,
    using: { not in
        if (mutedTheVolume && NSSound.getVolumeIsMuted(deviceId: NSSound.findOutputDeviceByName(name: "MacBook Pro Speakers"))) {
            NSSound.deviceVolumeSetMuted(deviceId: NSSound.findOutputDeviceByName(name: "MacBook Pro Speakers"), m: false)
            mutedTheVolume = false
            NSLog("UnMuted")
        }
    }
)

CFRunLoopRun()
