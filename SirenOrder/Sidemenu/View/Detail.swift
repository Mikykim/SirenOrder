// animated detail View
import SwiftUI

struct Detail: View {
    @ObservedObject var tabData : TableviewModel
    // this is for animation
    var animation : Namespace.ID
     @State var cart = 1
     @State var start  = false
     @State var isSmall = UIScreen.main.bounds.height < 800
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                ZStack {
                
                
                    HStack {
                        Button(action: {
                            withAnimation(Animation.easeIn(duration: 0.5)){
                                start.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                withAnimation(.spring()) {
                                    tabData.isdetail.toggle()
                                }
                            }
                        }) {
                          Image(systemName: "arrow.left")
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(.white)
                        }
                        
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            
                          Image(systemName: "bag")
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(.white)
                        
                    }
                    
                }
                     Text("SleepWalk")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                
                    }
                    .padding()
                
                
                ZStack{
                    //------------------------------------------
                    //rotating the view  after all view happens
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)// fixing the aspectRatio
                        .rotationEffect(.init(degrees: start ? -25 : 0), anchor: .bottom)
                    //animated and adjusting the View
                        .offset(x:start ? 15 : 0, y: start ? -15 : 0)
                    // showing the items after animation starts
                        .opacity(start ? 1 : 0)
                    //---------------------------------------------
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.init(degrees: start ? 25 : 0), anchor: .bottom)
                        .offset (x: start ? -15 : 0, y: start ? -15 : 0 )
                        .opacity(start ? 1: 0)
                    //---------------------------------------------------
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)// fixing the aspectRatio
                        .matchedGeometryEffect(id: tabData.selectedItem.image, in: animation)
                }
                    .frame(height: UIScreen.main.bounds.height / 2.8)
                    .padding(.vertical,25)
            }
            
                 
            .background(Color(tabData.selectedItem.image))
            
            HStack(spacing : 15) {
                Button(action : {
                    if cart != 1{cart -= 1}
                    
                }){
                    Image(systemName: "minus")
                        .font(.system(size: 22, weight : .bold))
                        .foregroundColor(.white)
                }
                   
                 Text("\(cart)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                Button(action: {cart += 1}) {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight : .bold))
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical)
            .padding(.horizontal,25)
            .background(Color(tabData.selectedItem.image))
            .cornerRadius(15)
            .background (
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 1)
            )
                .offset(y: -35)
                .padding(.bottom,-35)
            
            ScrollView(isSmall ? .vertical : .init(), showsIndicators: false) {
                 
                VStack{
                  
                    HStack{
                        Text (tabData.selectedItem.title)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                      Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        
                        HStack(spacing: 10) {
                            ForEach(1...5,id: \.self) {i in
                                Image(systemName: "star.fill")
                                    .font(.title3)
                                    .foregroundColor(i<=4 ? Color.yellow : Color.black.opacity(0.5))
                            }
                          }
                        }
                    .padding()
                    
                    HStack{
                        
                        Text("SleepWalk Americano is one the most amazing coffee in Gachon University")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black.opacity(0.8))
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                    
                    HStack{
                         Text("Components")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("See all")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.pink)
                        }
                    }
                    .padding()
                    
                    HStack {
                        ForEach(1...4, id: \.self) {i in
                            Image("r\(i)")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width : 55, height: 55)
                                .cornerRadius(10)
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        }
                        
                        Button(action: {}) {
                           
                            Image(systemName: "plus")
                                .foregroundColor(.pink)
                                .frame(width: 55, height: 55)
                            
                            .background(
                                  RoundedRectangle(cornerRadius: 10)
                                   .stroke(Color.pink,style: StrokeStyle(lineWidth: 0, lineCap: .round, lineJoin: .round,  dash: [10,10]))
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    Spacer(minLength: 0)
                    
                    HStack{
                        Text(tabData.selectedItem.price)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Buy Now")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.horizontal,25)
                                .background(Color(tabData.selectedItem.image))
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, isSmall ? 15 : 0)
                }
                
            }
        }
                  
                .background(
                    ZStack {

                        Color(tabData.selectedItem.image)
                            .ignoresSafeArea(.all, edges: .top)

                        Color.white
                            .ignoresSafeArea(.all, edges: .bottom)
                    }
                )
                .onAppear{
                    withAnimation(Animation.easeIn.delay(0.5)){

                        start.toggle()
                    }
                }
             }
           

            
            
        
    



}
