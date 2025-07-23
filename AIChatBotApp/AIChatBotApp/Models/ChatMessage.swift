//
//  ChatMessage.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
} 