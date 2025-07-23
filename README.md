# AIChatBotApp 🤖

A modern AI-powered chatbot built with SwiftUI featuring multiple AI providers (Groq and Google Gemini). Features a clean, responsive interface with real-time messaging, loading states, and secure API key management using MVVM architecture.

## ✨ Features

- **Modern SwiftUI Interface**: Clean, responsive design with smooth animations
- **Multi-AI Provider Support**: Switch between Groq (Llama 4 Scout) and Google Gemini
- **MVVM Architecture**: Clean separation of concerns with ViewModels
- **Real-time AI Chat**: Powered by cutting-edge language models
- **Loading States**: Visual feedback during AI processing
- **Secure API Management**: Configuration-based API key storage
- **Auto-scroll**: Automatic scrolling to latest messages
- **Error Handling**: Comprehensive error messages and validation
- **Multi-line Input**: Support for longer messages with expandable text field
- **Keyboard Integration**: Send messages with Enter key or Done button
- **Provider Selection**: Easy switching between AI providers via UI picker

## 🚀 Quick Start

### Prerequisites

- Xcode 16.4 or later
- iOS 18.5+ Simulator or Device
- Groq API Key (free tier available) or Google Gemini API Key (free tier available)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd AIChatBotApp
   ```

2. **Follow the Getting Started Guide**
   - **📖 [Complete Setup Guide](AIChatBotApp/GETTING_STARTED.md)** - Step-by-step instructions for new users
   - **🔑 [API Key Setup](AIChatBotApp/SETUP_API_KEYS.md)** - Detailed API configuration guide

3. **Quick Setup**
   - Open `AIChatBotApp/Services/APIConstants.swift`
   - Replace placeholder values with your actual API keys
   - Build and run the app

3. **Build and Run**
   - Open `AIChatBotApp.xcodeproj` in Xcode
   - Select your target device/simulator
   - Press `Cmd+R` to build and run

## 🔧 Configuration

### API Key Setup

#### Groq API Key
1. Visit [Groq Console](https://console.groq.com/)
2. Sign up for a free account
3. Create a new API key
4. Copy the key and replace in `APIConstants.swift`

#### Google Gemini API Key
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Create a new API key
4. Copy the key and replace in `APIConstants.swift`

### Default Configuration
- **Default Provider**: Groq (Llama 4 Scout model)
- **Fallback**: Google Gemini (gemini-1.5-flash model)
- **Request Timeout**: 30 seconds
- **Max Tokens**: 1000 per response

## 🏗️ Architecture

### MVVM Pattern
```
Views/           # UI Components
├── ContentView.swift
└── Components/
    ├── ChatView.swift
    ├── MessageBubble.swift
    └── APISelectorView.swift

ViewModels/      # Business Logic
└── ChatViewModel.swift

Services/        # API Services
├── APIConstants.swift
└── MultiAIService.swift

Models/          # Data Models
└── ChatMessage.swift
```

### Key Components

#### ChatViewModel
- Manages chat state and business logic
- Handles message sending and API calls
- Provides computed properties for UI state
- Implements `@MainActor` for thread safety

#### MultiAIService
- Supports multiple AI providers
- Handles API authentication and requests
- Provides error handling and fallbacks
- Manages provider switching

#### ChatView
- Main chat interface
- Integrates with ChatViewModel
- Handles keyboard events and auto-scroll
- Provides provider selection UI

## 🛠️ Troubleshooting

### Common Issues

#### 1. API Key Errors
If you see API key errors:
```
⚠️ Error: Groq API key not configured
⚠️ Error: Gemini API key not configured
```

**Solution**: 
- Ensure API keys are correctly set in `APIConstants.swift`
- Verify keys are valid and have proper permissions
- Check for typos or extra spaces

#### 2. Model Not Found Errors
If you see model errors:
```
geminiAPIError: models/gemini-pro is not found
```

**Solution**: The app uses the latest model names:
- Groq: `meta-llama/llama-4-scout-17b-16e-instruct`
- Gemini: `gemini-1.5-flash`

#### 3. Build Errors
If you encounter build errors:

1. **Clean Build Folder**: `Cmd+Shift+K` in Xcode
2. **Reset Simulator**: 
   ```bash
   xcrun simctl erase all
   ```
3. **Update Xcode**: Ensure you're using the latest version

#### 4. Simulator Warnings
These warnings are normal and harmless:
```
load_eligibility_plist: Failed to open
Unable to simultaneously satisfy constraints
```

**Solution**: These are system-level simulator warnings and don't affect functionality.

### Performance Optimization

- **Memory Management**: Uses `LazyVStack` for efficient message rendering
- **Network Timeouts**: 30-second timeout for API requests
- **Error Recovery**: Graceful handling of network failures
- **UI Responsiveness**: `@MainActor` ensures smooth UI updates

## 📱 App Structure

```
AIChatBotApp/
├── AIChatBotApp/
│   ├── Views/
│   │   ├── ContentView.swift          # Main app container
│   │   └── Components/
│   │       ├── ChatView.swift         # Main chat interface
│   │       ├── MessageBubble.swift    # Individual message display
│   │       └── APISelectorView.swift  # API provider selection
│   ├── ViewModels/
│   │   └── ChatViewModel.swift        # Chat business logic
│   ├── Services/
│   │   ├── APIConstants.swift         # API configuration
│   │   └── MultiAIService.swift       # Multi-provider API service
│   ├── Models/
│   │   └── ChatMessage.swift          # Message data model
│   ├── Resources/
│   │   └── Assets.xcassets           # App assets
│   └── Notes/                        # Documentation and resources
├── Config.xcconfig                   # Build configuration
└── AIChatBotApp.xcodeproj           # Xcode project file
```

## 🔄 Usage Flow

1. **Launch App**: Opens to chat interface with provider selector
2. **Select Provider**: Choose between Groq or Gemini via picker
3. **Type Message**: Enter text in the input field
4. **Send Message**: Press Enter, Done, or tap send button
5. **Receive Response**: AI processes and returns response
6. **Continue Chat**: Messages are preserved in conversation history

## 🎯 Key Features Explained

### Multi-Provider Support
- **Groq**: Fast inference with Llama 4 Scout model
- **Gemini**: Google's latest AI model with generous free tier
- **Easy Switching**: Toggle between providers via UI picker
- **Fallback Handling**: Graceful error handling for each provider

### MVVM Benefits
- **Separation of Concerns**: UI logic separate from business logic
- **Testability**: ViewModels can be unit tested independently
- **Maintainability**: Clear structure makes code easier to maintain
- **Reusability**: Components can be reused across different views

### User Experience
- **Responsive Design**: Adapts to different screen sizes
- **Smooth Animations**: Professional feel with SwiftUI animations
- **Accessibility**: Built-in accessibility support
- **Keyboard Integration**: Full keyboard support for efficient typing

## 📚 Additional Resources

### Documentation
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Groq API Documentation](https://console.groq.com/docs)
- [Google Gemini API Documentation](https://ai.google.dev/docs)

### Learning Resources
- [MVVM Pattern in SwiftUI](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app)
- [Async/Await in Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
- [SwiftUI Best Practices](https://developer.apple.com/documentation/swiftui/views-and-controls)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Built with ❤️ using SwiftUI and modern AI APIs**