// Login Page: Including Kakao login API and Apple login Api
// The design is modifiable


/*
   The concept of the the page:
 The user will the see login page first.
 If they have account already, they sign in, if they don`t have they are prompted to create an account navigated to register page,
 if they have acccount already, they are promted to landing page or home page
 
 */


import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password  = ""
    @Namespace var animation
    @State var show  = false
    var body: some View {
      
        VStack{
            Spacer(minLength: 0)
            
            HStack{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                    Text("Login")
                        .font(.system(size: 40, weight: .heavy))
                    // this code for Dark mode Adoption
                        .foregroundColor(.primary)
                    Text("Please sign in to continue")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                          
                           
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .padding(.leading)
            
            CustomTextField(image: "envelope", title: "Email", value: $email, animation: animation)
            
            CustomTextField(image: "lock", title: "Password", value: $password, animation: animation)
                .padding(.top,5)
            
        
        
        HStack{
             
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            VStack(alignment: .trailing, spacing: 20) {
                
                Button (action: {}) {
                    
                    Text ("Forgot the the password")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("yellow"))
                }
                Button(action: {}){
                    HStack(spacing: 10) {
                        Text("LOGIN")
                            .fontWeight(.heavy)
                        Image (systemName: "arrow.right")
                            .font(.title2)
                    }
                    .modifier(CustomButtonModifier())
                }
              }
            
           }
        .padding()
        .padding(.top, 10)
        .padding(.trailing)
            
            Spacer(minLength: 0)
            HStack(spacing: 8) {
                Text("Don`t have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: Register(show: $show), isActive: $show) {
                    Text("sign up")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("yellow"))
                }
            }
            .padding()
        }
    }
}


