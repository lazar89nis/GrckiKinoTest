//
//  WebView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 21.7.24..
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var isLoading: Bool
    let webView: WKWebView
    
    init(isLoading: Binding<Bool>) {
        self._isLoading = isLoading
        self.webView = WKWebView(frame: .zero)
        self.webView.backgroundColor = UIColor(named: R.color.background.name)!
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if uiView.url == nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                uiView.load(URLRequest(url: URL(string: Config.drawAnimationUrl)!))
            }
        }
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            webView.backgroundColor = UIColor(named: R.color.background.name)
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            webView.backgroundColor = UIColor(named: R.color.background.name)
        }
    }
}
