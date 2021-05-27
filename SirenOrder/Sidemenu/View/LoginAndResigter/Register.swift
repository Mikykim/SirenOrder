// Register page
// will be modified depending on the reqirements


import SwiftUI

struct Register: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var number = ""
    @Binding var show : Bool
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                HStack{
                    Button(action: {show.toggle()}) {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                .padding(.leading)
                
                HStack{
                    Text("Create Account")
                        .font(.system(size: 40))
                        .foregroundColor(.primary)
                        .fontWeight(.heavy)
                   
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .padding(.leading)
                CustomTextField(image: "person", title: "FULL NAME", value: $name, animation: animation)
                
                CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                    .padding(.top,5)
                CustomTextField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                    .padding(.top,5)
                CustomTextField(image: "phone.fill", title: "PHONE NUMBER", value: $number, animation: animation)
                    .padding(.top,5)
                
                HStack{
                    Spacer()
                    Button(action: {}) {
                        HStack (spacing: 10) {
                            Text ("SIGN UP")
                                .fontWeight(.heavy)
                            Image(systemName: "arrow.left")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                        }
                    }
                .padding()
                .padding(.top)
                .padding(.trailing)
                HStack{
                    
                    Text("Already have an account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    Button(action: {show.toggle()}) {
                        Text("Sign in")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("yellow"))
                        }
                      }
                .padding()
                .padding(.top,10)
                     }
            })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
       
     }
    }



