//
//  ContentView.swift
//  HTMLRender
//
//  Created by Fahim Rahman on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var responseModel: PostResponseModel?
    
    var body: some View {
        VStack {
            
            Text("\(self.responseModel?.id ?? 0)")
                .padding()
            
            Button {
                // MARK: - POST Request
                
                // url
                guard let postURL = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
                
                // post data
                let postData: [String: Any] = ["title": "This is a post request",
                                               "body": "Fahim",
                                               "userId": "69"]
                
                // Api post request
                APIService().postRequest(url: postURL, params: postData, type: PostResponseModel.self) { response in
                    self.responseModel = response
                    print(self.responseModel!) // USE POSTMAN TO VERIFY
                } errorHandler: { error in
                    print(error)
                }
            } label: {
                Text("Click here to post").bold()
                    .padding()
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
