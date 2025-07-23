//
//  MessageBubble.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//

import SwiftUI

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if message.isUser {
                Spacer(minLength: 50)
                messageContent
                    .frame(maxWidth: .infinity, alignment: .trailing)
            } else {
                messageContent
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer(minLength: 50)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    private var messageContent: some View {
        Text(message.text)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .foregroundColor(message.isUser ? .white : .primary)
            .background(message.isUser ? Color.blue : Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .frame(maxWidth: 280, alignment: message.isUser ? .trailing : .leading)
    }
} 