
import SwiftUI

struct CardView: View {
    @ObservedObject var tabData = TableviewModel()
    var animation: Namespace.ID
    var item: Item
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(item.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text(item.price)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        tabData.selectedItem = item
                        tabData.isdetail.toggle()
                        }
                }) {
                    
                    Text("Order")
                        .fontWeight(.heavy)
                        .foregroundColor(Color(item.image))
                        .padding(.vertical)
                        .padding(.horizontal,25)
                        .background(Color.white)
                        .cornerRadius(15)
                    
                }
                .padding()
            }
            
            .padding(.leading,10)
            .offset(y: 27)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: item.image, in: animation)
                .frame(height: UIScreen.main.bounds.height / 3 )
        }
        .padding()
        .background(Color(item.image))
        .cornerRadius(25)
        
    }
}

