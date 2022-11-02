//
//  ContentView.swift
//  NetworkingAPI
//
//  Created by Arman Akash on 29/10/22.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @State private var loginResponse: LoginResponseModel?
    
    var body: some View {
        VStack {
            Button {
                // post todo
                self.postTODO(url: URLs().postDataUrl(), text: "Go to school")
            } label: {
                Text("Press to Post Todo").bold()
            }

            Text(self.loginResponse?.refreshToken ?? "")
        }
        .padding()
        .onAppear {
            self.loginRequest(url: URLs().loginURL(), email: "fahimrahmanbooom@gmail.com", password: "Fahim69")
        }
    }
    
    // MARK: - API POST Request (Login)
    private func loginRequest(url: String, email: String, password: String) {
        
        let loginRequestModel = LoginRequestModel(email: email, password: password)
        
        AF.request(url, method: .post, parameters: loginRequestModel, encoder: .json).validate().responseDecodable(of: LoginResponseModel.self) { response in
            self.loginResponse = response.value
            if self.loginResponse?.status == "Successfully logged in" {
                UserDefaults.standard.set(self.loginResponse?.accessToken, forKey: "accessToken")
                UserDefaults.standard.set(self.loginResponse?.refreshToken, forKey: "refreshToken")
            }
            else {
                print("Login not successful")
            }
        }
    }
    
    
    // MARK: - API POST Request (todo post)
    private func postTODO(url: String, text: String) {
        
        let postTodoDataModel = PostDataModel(text: text)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.string(forKey: "accessToken") ?? ""),
            "Accept": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: postTodoDataModel, encoder: .json, headers: headers).validate().responseDecodable(of: PostDataResponseModel.self) { response in
            print(response.value)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
