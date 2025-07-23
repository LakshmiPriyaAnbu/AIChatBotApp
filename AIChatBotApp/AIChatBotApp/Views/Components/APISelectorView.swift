//
//  APISelectorView.swift
//  AIChatBotApp
//
//  Created by Lakshmi Priya on 23/07/25.
//

import SwiftUI

struct APISelectorView: View {
    @ObservedObject var aiService: MultiAIService
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Select AI Provider")) {
                    ForEach(MultiAIService.APIProvider.allCases, id: \.self) { provider in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(provider.displayName)
                                    .font(.headline)
                                
                                Text(providerDescription(for: provider))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            if aiService.currentProvider == provider {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            aiService.currentProvider = provider
                            dismiss()
                        }
                    }
                }
                
                Section(header: Text("Setup Instructions"), footer: Text("API keys are already configured in the app")) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Groq (Currently Active)")
                            .font(.headline)
                        Text("✅ API key is already configured\n✅ Using Llama 4 Scout model\n✅ Fast inference speed")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Google Gemini")
                            .font(.headline)
                        Text("✅ API key is already configured\n✅ Free tier with generous limits\n✅ Good for general tasks")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("AI Provider")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func providerDescription(for provider: MultiAIService.APIProvider) -> String {
        switch provider {
        case .groq:
            return "Fast Llama 4 Scout model"
        case .gemini:
            return "Google's AI, generous free tier"
        }
    }
} 