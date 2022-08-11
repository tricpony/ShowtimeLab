//
//  WebUI.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import SwiftUI
import WebKit

struct WebUI: UIViewRepresentable {
    let urlString: String
    private let webView = WKWebView()

    init(urlString: String) {
        self.urlString = urlString
    }

    func makeUIView(context: Context) -> WKWebView  {
        return webView
    }
      
    func updateUIView(_ webView: WKWebView, context: UIViewRepresentableContext<WebUI>) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData)
        webView.load(request)
    }
}

#if DEBUG
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebUI(urlString: "https://www.apple.com")
    }
}
#endif
