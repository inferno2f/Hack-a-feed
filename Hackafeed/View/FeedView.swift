//
//  ContentView.swift
//  Hackafeed
//
//  Created by Vladislav Nikitin on 5/25/20.
//  Copyright © 2020 Vladislav Nikitin. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
    
    @ObservedObject var networkManager = NetworkManager()
    //observe the observable object!
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
            .font(.system(.headline, design: .monospaced))
        }
        .lineLimit(2)
        .onAppear {
            self.networkManager.fetchData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}



