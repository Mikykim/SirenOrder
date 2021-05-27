// Tab Button value referrence supporting the SideMenu
// The Structure 

import SwiftUI

struct TabButton: View {
    var image : String
    var title : String
    //for selected Tab
    @Binding var selectedTab: String
    
    var animation : Namespace.ID //hero animation Slide
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){selectedTab = title}
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color("blue") : .white)
            .padding(.vertical,12)
            .padding(.horizontal,10)
        // Max Frame
            .frame(maxWidth: getRect().width - 170, alignment: .leading)
            .background(
                // hero Animation
                
                ZStack{
                    if selectedTab == title {
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorner(corners: [.topRight, .bottomRight], radius: 12))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
             )
          })
        }
      }
 

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
