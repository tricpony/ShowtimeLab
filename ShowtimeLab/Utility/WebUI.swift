//
//  WebUI.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import SwiftUI
import WebKit

typealias WebLoadCompletion = (Bool) -> ()
struct WebUI: UIViewRepresentable {
    let urlString: String
    var action: WebLoadCompletion?
    var observer: WebLoadingObserver
    private let webView = WKWebView()

    init(urlString: String, action: @escaping WebLoadCompletion) {
        self.urlString = urlString
        self.action = action
        self.observer = WebLoadingObserver(action: action)
    }

    func makeUIView(context: Context) -> WKWebView  {
        webView.navigationDelegate = observer
        return webView
    }
      
    func updateUIView(_ webView: WKWebView, context: UIViewRepresentableContext<WebUI>) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData)
        webView.load(request)
    }
}

class WebLoadingObserver: NSObject, WKNavigationDelegate {
    var action: WebLoadCompletion

    init(action: @escaping WebLoadCompletion) {
        self.action = action
    }
    
    // MARK: WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        action(true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        action(false)
    }
}

#if DEBUG
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebUI(urlString: "https://www.apple.com", action: { _ in })
    }
}
#endif
