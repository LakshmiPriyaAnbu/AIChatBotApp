//
//  APIConstants.template.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//
//  IMPORTANT: This is a template file. Copy this content to AIChatBotApp/Services/APIConstants.swift
//  and replace the placeholder values with your actual API keys.
//  DO NOT add this file to your Xcode project - it's just for reference.
//

import Foundation

// MARK: - API Constants
struct APIConstants {
    // Groq Configuration
    static let groqAPIKey = "YOUR_GROQ_API_KEY_HERE" // Get from https://console.groq.com/
    static let groqAPIURL = "https://api.groq.com/openai/v1/chat/completions"
    
    // Google Gemini Configuration
    static let geminiAPIKey = "YOUR_GEMINI_API_KEY_HERE" // Get from https://makersuite.google.com/app/apikey
    static let geminiAPIURL = "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent"
    
    // API Selection (set to "groq" or "gemini")
    static let currentAPI = "groq" // Default to Groq
} 