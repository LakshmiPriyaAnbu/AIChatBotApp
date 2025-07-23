//
//  ChatViewModel.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//

import Foundation
import SwiftUI

@MainActor
class ChatViewModel: ObservableObject {
    @Published var inputText = ""
    @Published var messages: [ChatMessage] = []
    @Published var isLoading = false
    
    let aiService = MultiAIService()
    
    var currentProvider: MultiAIService.APIProvider {
        get { aiService.currentProvider }
        set { aiService.currentProvider = newValue }
    }
    
    var canSendMessage: Bool {
        !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !isLoading
    }
    
    func sendMessage() {
        guard canSendMessage else { return }
        
        let userMessage = ChatMessage(text: inputText.trimmingCharacters(in: .whitespacesAndNewlines), isUser: true)
        messages.append(userMessage)

        let userInput = inputText
        inputText = ""
        isLoading = true

        aiService.sendMessage(userInput) { [weak self] response in
            Task { @MainActor in
                self?.isLoading = false
                let botMessage = ChatMessage(text: response, isUser: false)
                self?.messages.append(botMessage)
            }
        }
    }
    
    func clearMessages() {
        messages.removeAll()
    }
} 