import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.webView)
        if let url = URL(string: "http://localhost:8888/vueTest.html") {
            
            let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
            self.webView.load(urlRequest)
            
        }
        
    }
    
    lazy var webView:WKWebView = {
        
        let config = WKWebViewConfiguration()
        config.preferences = WKPreferences()
        config.preferences.minimumFontSize = 30

        config.userContentController.add(self, name: "prepareDataFromNative")
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), configuration: config)
        webView.navigationDelegate = self
        
        return webView
        
    }()

}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "prepareDataFromNative" {
            let js = "window.prepareDataFromNative('nihao')"
            self.webView.evaluateJavaScript(js) { (response, error) in
                print(response , error)
            }           
        }
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "window.prepareDataFromNative('nihao')"
        self.webView.evaluateJavaScript(js) { (response, error) in
            print(response , error)
        }
    }
}
