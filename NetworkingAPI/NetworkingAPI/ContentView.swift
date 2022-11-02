//
//  ContentView.swift
//  NetworkingAPI
//
//  Created by Arman Akash on 29/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var loginResponse: LoginResponseModel?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(self.loginResponse?.refreshToken ?? "")
        }
        .padding()
        .onAppear {
            self.loginRequest(url: URLs().loginURL(), email: "fahimrahmanbooom@gmail.com", password: "Fahim69")
        }
    }
    
    // MARK: - API POST Request (Login)
    private func loginRequest(url: String, email: String, password: String) {
        
        let loginRequestModel = [
            "email": email,
            "password": password
        ]
        
        APIService().postRequest(url: URL(string: url) ?? URL(string: "")!, params: loginRequestModel, type: LoginResponseModel.self) { response in
            self.loginResponse = response
            UserDefaults.standard.set(self.loginResponse?.accessToken, forKey: "accessToken")
        } errorHandler: { error in
            print(error)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
