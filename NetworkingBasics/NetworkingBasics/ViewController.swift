//
//  ViewController.swift
//  NetworkingBasics
//
//  Created by Zülal Nebin on 15.11.2026.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    private let postParameters: [String: Any] = [
        "title": "Networking Basics",
        "body": "CRUD operations example",
        "userId": 1
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - URLSession
    
    // MARK: Request Body
    
    private enum RequestBody {
        case json([String: Any])
        case urlEncoded([String: Any])
        case plainText(String)
        
        var contentType: String {
            switch self {
            case .json:
                return "application/json"
                
            case .urlEncoded:
                return "application/x-www-form-urlencoded"
                
            case .plainText:
                return "text/plain"
            }
        }
    }
    
    
    // MARK: HTTP Request
    
    private func performURLSessionRequest(
        path: String = "",
        method: String,
        body: RequestBody? = nil
    ) {
        
        // Create URL
        guard let url = URL(string: baseURL + path) else {
            print("Invalid URL")
            return
        }
        
        // Configure HTTP Request
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        // MARK: HTTP Headers
        
        // Define the maximum time allowed for the request to complete.
        request.timeoutInterval = 30
        
        // Specify the expected response format.
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )
        
        // Add Authorization header when required.
        // request.setValue("Bearer token", forHTTPHeaderField: "Authorization")
        
        // MARK: Request Body
        
        if let body = body {
            
            // Set Content-Type according to the request body format.
            request.setValue(
                body.contentType,
                forHTTPHeaderField: "Content-Type"
            )
            
            do {
                request.httpBody = try makeRequestBody(from: body)
            } catch {
                print("Request body error:", error.localizedDescription)
                return
            }
        }
        
        // MARK: URLSession Data Task
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            // Handle Network Error
            if let error = error {
                print("Request Error:", error)
                return
            }
            
            // Handle HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            print("Status Code:", httpResponse.statusCode)
            
            // Check HTTP Status Code
            guard (200..<300).contains(httpResponse.statusCode) else {
                
                if let data = data {
                    print(String(data: data, encoding: .utf8) ?? "")
                }
                
                return
            }
            
            // Handle Response Data
            guard let data = data else {
                print("No Data Received")
                return
            }
            
            if data.isEmpty {
                print("Response body is empty.")
                return
            }
            
            // Convert Response Data into String
            print(
                String(data: data, encoding: .utf8)
                ?? "Data not found or not in correct format."
            )
        }
        
        // Start Data Task
        task.resume()
    }
    
    
    // MARK: Request Body Serialization
    
    private func makeRequestBody(from body: RequestBody) throws -> Data {
        
        switch body {
            
        case .json(let parameters):
            
            // Convert Dictionary into JSON Data.
            return try JSONSerialization.data(
                withJSONObject: parameters
            )
            
        case .urlEncoded(let parameters):
            
            // Convert Dictionary into URL-Encoded Data.
            return Data(
                urlEncodedString(from: parameters).utf8
            )
            
        case .plainText(let text):
            
            // Convert String into UTF-8 Data.
            return Data(text.utf8)
        }
    }
    
    
    // MARK: URL-Encoded Parameters
    
    private func urlEncodedString(
        from parameters: [String: Any]
    ) -> String {
        
        let allowedCharacters = CharacterSet(
            charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._*"
        )
        
        return parameters.map { key, value in
            
            let encodedKey = String(describing: key)
                .addingPercentEncoding(
                    withAllowedCharacters: allowedCharacters
                ) ?? ""
            
            let encodedValue = String(describing: value)
                .addingPercentEncoding(
                    withAllowedCharacters: allowedCharacters
                ) ?? ""
            
            return "\(encodedKey)=\(encodedValue)"
            
        }
        .joined(separator: "&")
        .replacingOccurrences(of: "%20", with: "+")
    }
    
    
    // MARK: GET - Fetch Data
    
    func fetchWithURLSession() {
        performURLSessionRequest(method: "GET")
    }
    
    
    // MARK: POST - Create Data
    
    func createWithURLSession() {
        
        performURLSessionRequest(
            method: "POST",
            body: .json(postParameters)
        )
    }
    
    
    // MARK: PUT - Update Data
    
    func updateWithURLSession() {
        
        performURLSessionRequest(
            path: "/1",
            method: "PUT",
            body: .json(postParameters)
        )
    }
    
    
    // MARK: DELETE - Delete Data
    
    func deleteWithURLSession() {
        
        performURLSessionRequest(
            path: "/1",
            method: "DELETE"
        )
    }
    
    // MARK: - Alamofire
    
    // MARK: Request Configuration
    
    private func performAlamofireRequest(
        path: String = "",
        method: HTTPMethod,
        body: [String: Any]? = nil
    ) {
        AF.request(
            baseURL + path,
            method: method,
            parameters: body,
            encoding: JSONEncoding.default
        )
        .validate()
        .responseString { response in
            
            // Handle HTTP Response
            if let statusCode = response.response?.statusCode {
                print("Status Code:", statusCode)
            }
            
            // Handle Response Result
            switch response.result {
            case .success(let value):
                print("Response:", value)
                
            case .failure(let error):
                print("Request Error:", error)
            }
        }
    }
    
    
    // MARK: GET - Fetch Data
    
    func fetchWithAlamofire() {
        performAlamofireRequest(method: .get)
    }
    
    
    // MARK: POST - Create Data
    
    func createWithAlamofire() {
        performAlamofireRequest(
            method: .post,
            body: postParameters
        )
    }
    
    
    // MARK: PUT - Update Data
    
    func updateWithAlamofire() {
        performAlamofireRequest(
            path: "/1",
            method: .put,
            body: postParameters
        )
    }
    
    
    // MARK: DELETE - Delete Data
    
    func deleteWithAlamofire() {
        performAlamofireRequest(
            path: "/1",
            method: .delete
        )
    }
    
    
    // MARK: - IBActions
    
    // MARK: URLSession Actions
    
    @IBAction func fetchWithURLSessionButtonTapped(_ sender: Any) {
        fetchWithURLSession()
    }
    
    @IBAction func createWithURLSessionButtonTapped(_ sender: Any) {
        createWithURLSession()
    }
    
    @IBAction func updateWithURLSessionButtonTapped(_ sender: Any) {
        updateWithURLSession()
    }
    
    @IBAction func deleteWithURLSessionButtonTapped(_ sender: Any) {
        deleteWithURLSession()
    }
    
    
    // MARK: Alamofire Actions
    
    @IBAction func fetchWithAlamofireButtonTapped(_ sender: Any) {
        fetchWithAlamofire()
    }
    
    @IBAction func createWithAlamofireButtonTapped(_ sender: Any) {
        createWithAlamofire()
    }
    
    @IBAction func updateWithAlamofireButtonTapped(_ sender: Any) {
        updateWithAlamofire()
    }
    
    @IBAction func deleteWithAlamofireButtonTapped(_ sender: Any) {
        deleteWithAlamofire()
    }
    
    
}

