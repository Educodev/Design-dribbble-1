//
//  ContentView.swift
//  Design dribbble 1
//
//  Created by Eduardo Herrera on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var selection = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            if !selection {
                RegisterView(selection: $selection)
                SignInView(selection: $selection)
            } else {
                SignInView(selection: $selection)
                RegisterView(selection: $selection)
            }
            
            SwitchButton(selection: $selection)
                .padding(.bottom, 50)
        }
        .ignoresSafeArea()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct RegisterView: View {
    @Environment(\.colorScheme) private var scheme
    @Binding var selection: Bool
    @State var usernameText = ""
    @State var passwordText = ""
    @State var checkPassword = ""
    @State var showPassword = false

    
    var body: some View {
        ZStack {
            BlurView().ignoresSafeArea()
            VStack {
                //Form
                VStack(spacing: 16) {
                    TextField("Nombre de usuario", text: $usernameText)
                        .padding(.horizontal)
                        .textContentType(.username)
                        .frame(height: 60)
                        .background(scheme == .dark ? .black : .white)
                        .cornerRadius(10)
                    
                    TextField("Correo electronico", text: $usernameText)
                        .padding(.horizontal)
                        .textContentType(.emailAddress)
                        .frame(height: 60)
                        .background(scheme == .dark ? .black : .white)
                        .cornerRadius(10)
                    
                    //password
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            SecureField("Contraseña", text: $passwordText)
                                .textContentType(.password)
                        } else {
                            TextField("Contraseña", text: $passwordText)
                                .textContentType(.password)
                        }

                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: !showPassword ? "eye.slash" : "eye")
                        }
                        .foregroundColor(.secondary)
                        .buttonStyle(.borderless)
                        
                    }
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(scheme == .dark ? .black : .white)
                    .cornerRadius(10)
                    
                    //check password
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            SecureField("Verificar contraseña", text: $checkPassword)
                                .textContentType(.password)
                        } else {
                            TextField("Verificar contraseña", text: $checkPassword)
                                .textContentType(.password)
                        }

                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: !showPassword ? "eye.slash" : "eye")
                        }
                        .foregroundColor(.secondary)
                        .buttonStyle(.borderless)
                        
                    }
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(scheme == .dark ? .black : .white)
                    .cornerRadius(10)

                }
                .frame(height: UIScreen.main.bounds.height/2)
                
                //Register button
                Button {
                    
                } label: {
                    Text("Registro")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 24)
                        .background(.indigo)
                        .cornerRadius(10)
                        .foregroundColor(.primary)
                        .bold()
                }

                
                
                Spacer()
                VStack(spacing: 24) {
                    Text("Unete y forma parte\nde nuestra comunidad")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Text("Aprovecha las ventajas que obtienes al unirte, a que esperas.")
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .padding(.horizontal, 24)
                }
                
                Spacer()
                
                Spacer()
                
                
            }
            .padding(.horizontal, 32)
            
        }
    }
}


struct SignInView: View {
    @Environment(\.colorScheme) private var scheme
    @Binding var selection: Bool
    @State var usernameText = ""
    @State var passwordText = ""
    @State var showPassword = false
    
    var body: some View {
        ZStack {
            
            BlurView().ignoresSafeArea()
            
            VStack(spacing: 50) {
                Spacer()
                //Form
                VStack(spacing: 16) {
                    Text("¡Hola de nuevo!")
                        .font(.title)
                        .bold()
                    
                    Text("¡Bienvenido! te hemos \nechado de menos!")
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                }
                
                //Auth box
                VStack(alignment: .trailing, spacing: 16) {
                    TextField("Correo o nombre de usuario", text: $usernameText)
                        .padding(.horizontal)
                        .textContentType(.emailAddress)
                        .frame(height: 60)
                        .background(scheme == .dark ? .black : .white)
                        .cornerRadius(10)
                    
                    ZStack(alignment: .trailing) {
                        if !showPassword {
                            SecureField("Contraseña", text: $passwordText)
                                .textContentType(.password)
                        } else {
                            TextField("Contraseña", text: $passwordText)
                                .textContentType(.password)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: !showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(scheme == .dark ? .black : .white)
                    .cornerRadius(10)
                    
                    
                    Button("Recuperar contraseña") {
                        
                    }
                    .foregroundColor(.secondary)
                }
                .bold()
                
                Button {
                    
                } label: {
                    Text("Iniciar sesión")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 24)
                        .background(.indigo)
                        .cornerRadius(10)
                        .foregroundColor(.primary)
                        .bold()
                }
                
                
                HStack(spacing: 24) {
                    LinearGradient(colors: [.black, .clear], startPoint: .trailing, endPoint: .leading)
                        .frame(width: 70,height: 2)
                    
                    Text("O continuar cón")
                        .lineLimit(1)
                    
                    LinearGradient(colors: [.black, .clear], startPoint: .leading, endPoint: .trailing)
                        .frame(width: 70,height: 2)
                    
                }
                
                HStack {
                    let imageNames = ["google", "apple", "facebook"]
                    ForEach(imageNames, id: \.self) { imageName in
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 32)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2))
                        }
                        Spacer()
                    }
                    
                }
                Spacer(minLength: 80)
            }
            .padding(.horizontal, 32)
            
            
        }
        
    }
}

struct SwitchButton: View {
    @Binding var selection: Bool
    
    var body: some View {
        HStack {
            //Sign In
            Button(action: {
                selection.toggle()
            }, label: {
                Text("Iniciar sesión")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
            })
            .background(!selection ? .white : .clear)
            .cornerRadius(10)
            
            
            //Register
            Button(action: {
                selection.toggle()
            }, label: {
                Text("Registrarse")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                
            })
            .background(selection ? .white : .clear)
            .cornerRadius(10)
            
        }
        .frame(maxWidth: .infinity)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2))
        .padding(.horizontal, 32)
        .foregroundColor(.black)
        
    }
}
