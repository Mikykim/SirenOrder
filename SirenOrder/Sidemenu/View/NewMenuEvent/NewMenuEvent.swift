// this has to be dynamic page
// can be modified later on


import SwiftUI
struct NewMenuEvent: View {
    @AppStorage("currentPage") var currentPage = 1
    var totalPages = 3
    var body: some View {
        Text("welcome page")
        //directs to the Home() after the event
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
            .fontWeight(.heavy)
        
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                .padding()
        
        ZStack{
            
            if currentPage == 1 {
                ScreenView(image: "event1", title: "Soda", detail: "", bgColor: Color("eventColor1"))
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "event2", title: "Wine", detail: "", bgColor: Color("eventColor2"))
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "event3", title: "Lemon Tea", detail: "", bgColor: Color("eventColor3"))
                    .transition(.scale)
            }
        }
        .overlay(
             //button
            Button(action: {
                //changing views
                withAnimation(.easeInOut){
                    // checking
                    if currentPage <= totalPages{
                        currentPage += 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size:20,weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width:60, height: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15.5, style: .continuous))
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-25)
                    )
            })
            .padding(.bottom, 20)
            ,alignment: .bottom
        )
    
    }
}

