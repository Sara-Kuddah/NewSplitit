//
//  Created by Artem Novichkov on 20.05.2021.
//

import SwiftUI

struct NamePopupView: View {
    
    @Binding var isPresented: Bool
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack {
                Text("Please Confirm who have payed you ")
                    .font(.system(size: 16, weight: .bold, design: .default))
                Spacer()
                Button(action: {
                    isPresented = false
                }, label: {
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 32, height: 32)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(16)
                        .foregroundColor(.black)
                })
            }
            Text("This step will help us sending reminders for those who didn’t pay yet .")
                .font(.system(size: 13))
                .fontWeight(.light)
                
//            TextField("", text: $text)
//                .frame(height: 36)
//                .padding([.leading, .trailing], 10)
//                .background(Color.gray.opacity(0.3))
//                .cornerRadius(10)
            VStack{
                HStack{
                    Text ("Reem")
                        .padding(.trailing, 90.0)
                    Text ("38 SR")
                        .padding(.trailing, 50.0)
                    Check1()
                }
                HStack{
                    Text ("Sarah")
                        .padding(.trailing, 90.0)
                    Text ("38 SR")
                        .padding(.trailing, 50.0)
                    Check1()
                }
                HStack{
                    Text ("Noura")
                        .padding(.trailing, 90.0)
                    Text ("38 SR")
                        .padding(.trailing, 50.0)
                    Check1()
                }
                HStack{
                    Text ("Nada")
                        .padding(.trailing, 90.0)
                    Text ("38 SR")
                        .padding(.trailing, 50.0)
                    Check1()
                }
                
            }
            Divider()
           // .padding()
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("Done")
                })
                .bold()
                .foregroundColor(.black)
                .frame(width: 200)
                .frame(height: 50)
                .background(Color("Mycolor"))
                .cornerRadius(10)
            }
            .padding()
            
        }
        .padding()
    }
}

struct NamePopupView_Previews: PreviewProvider {
    static var previews: some View {
        NamePopupView(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
