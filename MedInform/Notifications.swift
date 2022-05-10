//
//  Notifications.swift
//  MedInform
//
//  Created by Student on 5/10/22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBAction func button(_ sender: Any) {
     
        let notificationParameters = UNMutableNotificationContent()
        notificationParameters.title = "Some title"
        notificationParameters.subtitle = "This is a subtitle"
        notificationParameters.body = "This is the body"
        notificationParameters.badge = 1
        
        let timer = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timerDone", content: notificationParameters, trigger: timer)
    
        UNUserNotificationCenter.current().add(request) { (nil) in
            
        }
  
        
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {didAllow, error) in
        }

    }
        
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
        
        

}
