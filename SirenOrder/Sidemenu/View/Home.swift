// compounding the elements
// reusing the components


import SwiftUI

struct Home: View {
    
    @State var items = [
        
        Item(title: "Americano", price: "W2.500", image:"americano"),
        Item(title: "Latte", price: "W2.500", image:"latte"),
        Item(title: "Cappucino", price: "W2.500", image:"cappucino"),
        Item(title: "Vanilla latte", price: "W3.500", image:"vanilla" )
     
     
     
     ]
    
    @ObservedObject var tabData = TableviewModel()
    var animation : Namespace.ID
    //Hiding the tab bar
    init(selectedTab: Binding<String>){
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        // tabView with tabs
        TabView(selection: $selectedTab){
            
            // Views
            Home()
                .tag("Home")
            
            Order()
                .tag("Order")
            Event() // create the structs
                .tag("Event")
            Reciept()
                .tag("Receipt")
        }
        
        
        
        
        VStack {
            
            ZStack{
                
            
            HStack {
                Button(action: {}) {
                  Image(systemName: "line.horizontal.3")
                    .font(.system(size: 24, weight: .heavy))
                    .foregroundColor(.primary)
                }
                
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    
                  Image(systemName: "bell")
                    .font(.system(size: 24, weight: .heavy))
                    .foregroundColor(.primary)
                
            }
            
        }
             Text("SleepWalk")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
        
            }
            .padding()
            
            ScrollView( .vertical, showsIndicators: false) {
                
                VStack(spacing: 20){
                    
                    ForEach(items){ item in
                       // Card View....
                        CardView(tabData: tabData, animation: animation, item: item)
                    }
                }
                .padding()
            }
            
        
     }
   }
}
// Modeling Data and Model itself 
