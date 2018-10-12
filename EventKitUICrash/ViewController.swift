//
//  ViewController.swift
//  EventKitUICrash
//
//  Created by Kyosuke Takayama on 2018/10/12.
//  Copyright © 2018年 Kyosuke Takayama. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // You should set different timezone from your system timezone.
        NSTimeZone.default = NSTimeZone(name: "Europe/Vienna") as! TimeZone

        let store = EKEventStore()
        store.requestAccess(to: .event) { _, _ in
            let event = EKEvent(eventStore: store)
            event.startDate = Date()
            event.endDate = Date()
            event.timeZone = NSTimeZone.default
            event.isAllDay = true
            let viewController = EKEventEditViewController()
            viewController.event = event
            viewController.eventStore = store
            self.present(viewController, animated: true)
        }
    }


}

