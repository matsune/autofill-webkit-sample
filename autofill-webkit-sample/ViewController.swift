//
//  ViewController.swift
//  autofill-webkit-sample
//
//  Created by Yuma Matsune on 2022/04/04.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// please uncomment one of them

		/// When using `NSSecureTextField` we can see AutoFill extensions
		/// dropdown below the field.
//		 useNSSecureTextField()

		/// However, input HTML element doesn't show dropdown
		/// even it has autocomplete attribute in macOS WebKit.
//		useWKWebView()
	}

	func useNSSecureTextField() {
		let textField = NSSecureTextField(frame: .zero)
		textField.contentType = .password
		view.addSubview(textField)
		textField.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			view.centerXAnchor.constraint(equalTo: textField.centerXAnchor),
			view.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
			textField.heightAnchor.constraint(equalToConstant: 20),
			textField.widthAnchor.constraint(equalToConstant: 200),
		])
	}

	func useWKWebView() {
		let webView = WKWebView()
		view.addSubview(webView)
		webView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			webView.topAnchor.constraint(equalTo: view.topAnchor),
			webView.rightAnchor.constraint(equalTo: view.rightAnchor),
			webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			webView.leftAnchor.constraint(equalTo: view.leftAnchor),
		])

		let url = Bundle.main.url(forResource: "index", withExtension: "html")!
		webView.loadFileURL(url, allowingReadAccessTo: url)
	}
}
