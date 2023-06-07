//
//  Privacy and Policy .swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 06/06/2023.
//

import SwiftUI

struct Privacy_and_Policy_: View {
    var body: some View {
        VStack {
            Text("Privacy policy")
                .font(.system(size: 15, weight: .semibold, design: .default))
            
            Text ("We respect your privacy and are committed to protecting it through our compliance with this privacy policy (“Policy”). This Policy describes the types of information we may collect from you or that you may provide (“Personal Information”) in the “Split it” mobile application (“Mobile Application” or “Service”) and any of its related products and services (collectively, “Services”), and our practices for collecting, using, maintaining, protecting, and disclosing that Personal Information. It also describes the choices available to you regarding our use of your Personal Information and how you can access and update it.")
                .font(.system(size: 10, weight: .regular, design: .default))
            Text("Collection of personal information")
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text ("You can access and use the Mobile Application and Services without telling us who you are or revealing any information by which someone could identify you as a specific, identifiable individual. If, however, you wish to use some of the features offered in the Mobile Application, you may be asked to provide certain Personal Information (for example, your name and e-mail address).")
                .font(.system(size: 10, weight: .regular, design: .default))
            
            Text("Privacy of children ")
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text ("We do not knowingly collect any Personal Information from children under the age of 18. If you are under the age of 18, please do not submit any Personal Information through the Mobile Application and Services. If you have reason to believe that a child under the age of 18 has provided Personal Information to us through the Mobile Application and Services, please contact us to request that we delete that child’s Personal Information from our Services.")
                .font(.system(size: 10, weight: .regular, design: .default))
            
            Text("Data analytics ")
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text ("Our Mobile Application and Services may use third-party analytics tools that use cookies, web beacons, or other similar information- gathering technologies to collect standard internet activity and usage information. The information gathered is used to compile statistical reports on User activity such as how often Users visit our Mobile Application and Services, what pages they visit and for how long, etc. We use the information obtained from these analytics tools to monitor the performance and improve our Mobile Application and Services. We do not use third-party analytics tools to track or to collect any personally identifiable information of our Users and we will not associate any information gathered from the statistical reports with any individual User. ")
                .font(.system(size: 10, weight: .regular, design: .default))
            
            Text("Push notifications")
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text ("We offer push notifications to which you may voluntarily subscribe at any time. To make sure push notifications reach the correct devices, we rely on a device token unique to your device which is issued by the operating system of your device. While it is possible to access a list of device tokens, they will not reveal your identity, your unique device ID, or your contact information to us. We will maintain the information sent via e-mail in accordance with applicable laws and regulations. If, at any time, you wish to stop receiving push notifications, simply adjust your device settings accordingly. ")
                .font(.system(size: 10, weight: .regular, design: .default))
            
            
            

            
            
            
        }
    }
}
struct Privacy_and_Policy__Previews: PreviewProvider {
    static var previews: some View {
        Privacy_and_Policy_()
    }
}
