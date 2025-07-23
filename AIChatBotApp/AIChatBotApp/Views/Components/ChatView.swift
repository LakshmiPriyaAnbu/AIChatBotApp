//
//  ChatView.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var showingAPISelector = false

    var body: some View {
        VStack(spacing: 0) {
            messagesArea
            inputArea
        }
        .navigationTitle("AI Chat")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAPISelector = true }) {
                    Image(systemName: "info.circle")
                        .foregroundColor(.blue)
                }
            }
        }
        .sheet(isPresented: $showingAPISelector) {
            APISelectorView(aiService: viewModel.aiService)
        }
    }
    
    @ViewBuilder
    private var messagesArea: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageBubble(message: message)
                            .id(message.id)
                    }
                    
                    if viewModel.isLoading {
                        loadingView
                            .id("loading")
                    }
                }
                .padding(.vertical, 8)
            }
            .onChange(of: viewModel.messages.count) { _, _ in
                if let lastMessage = viewModel.messages.last {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                }
            }
            .onChange(of: viewModel.isLoading) { _, newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("loading", anchor: .bottom)
                    }
                }
            }
        }
        .background(Color(.systemGroupedBackground))
    }
    
    @ViewBuilder
    private var loadingView: some View {
        HStack {
            ProgressView()
                .scaleEffect(0.8)
            Text("AI is thinking...")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var inputArea: some View {
        VStack(spacing: 0) {
            Divider()
            
            // AI Provider Picker
            HStack {
                Text("AI Provider:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Picker("AI Provider", selection: $viewModel.currentProvider) {
                    ForEach(MultiAIService.APIProvider.allCases, id: \.self) { provider in
                        Text(provider.displayName)
                            .tag(provider)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .accentColor(.blue)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            // Message Input
            HStack(spacing: 12) {
                TextField("Type your message", text: $viewModel.inputText, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(1...4)
                    .disabled(viewModel.isLoading)
                    .onSubmit {
                        viewModel.sendMessage()
                    }
                    .submitLabel(.send)

                sendButton
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
        }
    }
    
    @ViewBuilder
    private var sendButton: some View {
        Button(action: { viewModel.sendMessage() }) {
            Image(systemName: "arrow.up.circle.fill")
                .font(.title2)
                .foregroundColor(viewModel.canSendMessage ? .blue : .gray)
        }
        .disabled(!viewModel.canSendMessage)
    }
    


} 