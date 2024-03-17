//
//  ContentView.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var publisher: AnyCancellable = {
        let client = APIClient()
        let request = PostRequest()
        return client.publisherForRequest(request)
            .sink { result in
                print(result)
            } receiveValue: { newPosts in
                print(newPosts)
            }
    }()
    
    var body: some View {
        Text("Hello world")
            .padding()
    }
    
}



#Preview {
    ContentView()
}
