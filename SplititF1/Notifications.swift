//
//  Notifications.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 12/06/2023.
//

import SwiftUI

import SwiftUI
import UserNotifications

struct NotificationsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: scheduleNotification) {
                Text("Schedule Notification")
            }
            Button(action: cancelNotification) {
                Text("Cancel Notification")
            }
        }
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Notification authorization granted")
                } else {
                    print("Notification authorization denied")
                }
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Split it"
        content.body = "Hey ! Someone Near you is looking for a buddy to share their order with. "
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["myNotification"])
        print("Notification canceled")
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

