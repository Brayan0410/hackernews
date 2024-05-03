//
//  ArticleView.swift
//  hackernews
//
//  Created by Luis Gutierrez on 29/04/24.
//
import SwiftUI
import WebKit

struct ArticleItem: Identifiable {
    
    
    let id: String
    let title: String
    let author: String
    let content: String
}

struct ArticleView: View {
    let articleItemURL: String
    
    var body: some View {
        VStack{
            viewModel(url: articleItemURL)
        }
        .padding()
        .navigationTitle("Articles")
    }
}



struct WebView: UIViewRepresentable {
    let url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView( _ uiView: WKWebView, context: Context) {}
    
}



struct viewModel: View {
    var url : String
    var body : some View {
        WebView(url: URL(string: url)!)
            .edgesIgnoringSafeArea(.all)
    }
}
