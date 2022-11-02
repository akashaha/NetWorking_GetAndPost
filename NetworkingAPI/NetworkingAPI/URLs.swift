//
//  URLs.swift
//  NetworkingAPI
//
//  Created by Arman Akash on 29/10/22.
//

import Foundation

struct URLs {
    
    private let baseURL = "https://todoexpressbackend.herokuapp.com"
    
    func loginURL() -> String {
        baseURL + "/api/v1/login"
    }
    
    //...
}
