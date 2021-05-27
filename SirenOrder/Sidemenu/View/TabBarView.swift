

import SwiftUI

struct TabBarView: View {
    @StateObject var tabData = TableviewModel()
    @Namespace var animation
    var body: some View {
        
        ZStack {
        TabView {
            
            Home(tabData: tabData, animation: animation)
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Pay")
                .tabItem {
                    Image(systemName: "creditcard")
                }
            Text("Order")
                .tabItem {
                    Image(systemName: "archivebox.circle.fill")
                }
            Text("Gifts")
                .tabItem {
                    Image(systemName: "gift.fill")
                }
            Text("Settings")
                .tabItem {
                    Image(systemName: "gear")
                }
            
        }
        .accentColor(.black)
            /// detail view model
            if tabData.isdetail {
                Detail(tabData: tabData, animation: animation)
            }
    }
  }
}
