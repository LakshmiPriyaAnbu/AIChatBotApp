//
//  MultiAIService.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//

import Foundation

class MultiAIService: ObservableObject {
    
    enum APIProvider: String, CaseIterable {
        case groq = "Groq"
        case gemini = "Google Gemini"
        
        var displayName: String {
            return self.rawValue
        }
    }
    
    @Published var currentProvider: APIProvider = .groq // Default to Groq
    
    func sendMessage(_ message: String, completion: @escaping (String) -> Void) {
        switch currentProvider {
        case .groq:
            sendGroqMessage(message, completion: completion)
        case .gemini:
            sendGeminiMessage(message, completion: completion)
        }
    }
    
    // MARK: - Groq Implementation
    private func sendGroqMessage(_ message: String, completion: @escaping (String) -> Void) {
        guard !APIConstants.groqAPIKey.isEmpty else {
            completion("⚠️ Error: Groq API key not configured")
            return
        }
        
        let url = URL(string: APIConstants.groqAPIURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(APIConstants.groqAPIKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "model": "meta-llama/llama-4-scout-17b-16e-instruct",
            "messages": [["role": "user", "content": message]],
            "max_tokens": 1000,
            "temperature": 0.7
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion("⚠️ Network Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    completion("⚠️ Error: No data received")
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                    
                    if let error = json?["error"] as? [String: Any],
                       let message = error["message"] as? String {
                        completion("⚠️ Groq API Error: \(message)")
                        return
                    }
                    
                    guard let choices = json?["choices"] as? [[String: Any]],
                          let message = choices.first?["message"] as? [String: Any],
                          let content = message["content"] as? String else {
                        completion("⚠️ Error: Invalid Groq response format")
                        return
                    }
                    
                    completion(content.trimmingCharacters(in: .whitespacesAndNewlines))
                } catch {
                    completion("⚠️ Error: Failed to parse Groq response")
                }
            }
        }.resume()
    }
    

    
    // MARK: - Google Gemini Implementation
    private func sendGeminiMessage(_ message: String, completion: @escaping (String) -> Void) {
        guard !APIConstants.geminiAPIKey.isEmpty else {
            completion("⚠️ Error: Gemini API key not configured")
            return
        }
        
        let urlString = "\(APIConstants.geminiAPIURL)?key=\(APIConstants.geminiAPIKey)"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": message]
                    ]
                ]
            ],
            "generationConfig": [
                "maxOutputTokens": 1000,
                "temperature": 0.7
            ]
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion("⚠️ Network Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    completion("⚠️ Error: No data received")
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                    
                    if let error = json?["error"] as? [String: Any],
                       let message = error["message"] as? String {
                        completion("⚠️ Gemini API Error: \(message)")
                        return
                    }
                    
                    guard let candidates = json?["candidates"] as? [[String: Any]],
                          let content = candidates.first?["content"] as? [String: Any],
                          let parts = content["parts"] as? [[String: Any]],
                          let text = parts.first?["text"] as? String else {
                        completion("⚠️ Error: Invalid Gemini response format")
                        return
                    }
                    
                    completion(text.trimmingCharacters(in: .whitespacesAndNewlines))
                } catch {
                    completion("⚠️ Error: Failed to parse Gemini response")
                }
            }
        }.resume()
    }
    

} 