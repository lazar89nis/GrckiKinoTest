//
//  LiveDrawView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import WebKit

struct LiveDrawView: View {
    var body: some View {
        WebView()
    }
}

struct WebView: UIViewRepresentable {
    
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
        webView.backgroundColor = UIColor(named: R.color.background.name)!
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: Config.drawAnimationUrl)!))
    }
}

#Preview {
    LiveDrawView()
}
