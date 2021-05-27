// New Menu SreenView 
import SwiftUI
import Foundation
struct ScreenView: View {
    var totalPages = 3
    var image : String
    var title : String
    var detail: String
    var bgColor: Color
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        VStack(spacing: 20){
            HStack {
                 
                //showing it only for the first page.....
                if currentPage == 1{
                    Text("new drink on our menu")
                        .font(.title)
                        .fontWeight(.semibold)
                    // for the letter spacing
                        .kerning(1.5)
                }
                else{
                    //back button
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "cheron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                        
                    })
                }
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            // changing the text of the new item or drink : please pay attention to this
            Text("The new menu on out menu")
                .fontWeight(.semibold)
                .kerning(1.4)
                .multilineTextAlignment(.center)
            //minimum Spacing when phone is reducing
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

