//SideMenu

import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14, content: {
              
            //the icon photo
            Image("SleepWalking")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            // padding top for the Top Close button
                .padding(.top, 50)
            VStack(alignment: .leading, spacing: 6, content: {
                Text("SleepWalk")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("view my profile")
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .opacity(0.6)
                })
            })
            
            // For the tab Buttons
            VStack(alignment: .leading, spacing: 10){
                TabButton(image:"house", title:"Home", selectedTab: $selectedTab, animation: animation)
                TabButton(image:"clock.arrow.circlepath", title:"History", selectedTab: $selectedTab, animation: animation)
                TabButton(image:"bell.badge", title:"Notifications", selectedTab: $selectedTab, animation: animation)
                TabButton(image:"gearshape.fill", title:"Settings", selectedTab: $selectedTab, animation: animation)
                TabButton(image:"question.circle", title:"Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading,-15)
            .padding(.top,50)
            Spacer()
            //Log out button
            VStack(alignment: .leading, spacing: 6, content: {
                TabButton(image: "rectangle,righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
                Image("NeverStopDreaming")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(2)
                    .padding(.bottom,30)
            })
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
