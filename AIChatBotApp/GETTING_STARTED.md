# 🚀 Getting Started with AI ChatBot App

## 📋 What You'll Get When You Clone This Repository

When you clone this repository, you'll receive:
- ✅ Complete SwiftUI project structure
- ✅ MVVM architecture implementation
- ✅ Multi-AI provider support (Groq & Gemini)
- ✅ Modern chat interface
- ✅ Template API configuration (safe to commit)
- ✅ Comprehensive documentation

## 🔑 API Key Setup (Required)

### Step 1: Get Your API Keys

#### Option A: Groq (Recommended - Fast & Free)
1. Visit [Groq Console](https://console.groq.com/)
2. Sign up for a free account
3. Create a new API key
4. Copy the key (starts with `gsk_`)

#### Option B: Google Gemini (Alternative - Also Free)
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Create a new API key
4. Copy the key (starts with `AIza`)

### Step 2: Configure Your API Keys

1. **Open the project** in Xcode
2. **Navigate to** `AIChatBotApp/Services/APIConstants.swift`
3. **Replace the placeholder values**:
   ```swift
   // Replace these with your actual API keys
   static let groqAPIKey = "gsk_your_actual_groq_key_here"
   static let geminiAPIKey = "AIza_your_actual_gemini_key_here"
   ```

### Step 3: Test Your Setup

1. **Build and run** the app in Xcode
2. **Send a test message** like "Hello, how are you?"
3. **Verify you get a response** from the AI

## 🛠️ Development Workflow

### For Personal Use
1. Clone the repository
2. Add your API keys to `APIConstants.swift`
3. Build and run - you're ready to go!

### For Public Sharing
1. **Before pushing to GitHub**:
   - Replace your actual API keys with placeholders
   - Or use environment variables
   - Or create a separate config file

2. **Security best practices**:
   - Never commit real API keys
   - Use placeholder values in public repos
   - Document the setup process (like this guide)

## 🔒 Security Considerations

### ✅ Safe to Commit
- Template files with placeholder keys
- Documentation and guides
- Project structure and code
- Configuration templates

### ❌ Never Commit
- Actual API keys
- Personal access tokens
- Production credentials
- Sensitive configuration data

## 🚨 Troubleshooting

### "API Key Not Configured" Error
- Ensure you've replaced the placeholder values
- Verify your API keys are correctly formatted
- Check that the keys start with the correct prefixes

### Build Errors
- Clean build folder: `Cmd+Shift+K` in Xcode
- Ensure all files are added to the project
- Check Xcode version compatibility

### No AI Responses
- Verify your API keys are valid and active
- Check your internet connection
- Ensure you haven't exceeded API limits

## 📱 App Features

### Current Features
- **Multi-AI Provider Support**: Switch between Groq and Gemini
- **Modern SwiftUI Interface**: Clean, responsive design
- **Real-time Chat**: Instant messaging with AI
- **Keyboard Integration**: Send with Enter key or button
- **Auto-scroll**: Automatically scrolls to latest messages
- **Error Handling**: Graceful error messages

### How to Use
1. **Select AI Provider**: Use the picker at the bottom of the input area
2. **Type Your Message**: Enter text in the input field
3. **Send Message**: Press Enter, Done, or tap the send button
4. **Receive Response**: AI processes and responds
5. **Continue Chat**: Messages are preserved in the conversation

## 🔄 Development Workflow

### Making Changes
1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** and test thoroughly

3. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Add your feature description"
   ```

4. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

### Before Sharing
1. **Remove sensitive data**:
   - Replace API keys with placeholders
   - Remove any personal information
   - Check for hardcoded credentials

2. **Update documentation**:
   - Update README if needed
   - Add setup instructions for new features
   - Document any breaking changes

## 📚 Additional Resources

### Documentation
- [README.md](../README.md) - Main project documentation
- [BUILDING_FROM_SCRATCH.md](../BUILDING_FROM_SCRATCH.md) - Complete development guide
- [ARCHITECTURE_FLOW.md](../ARCHITECTURE_FLOW.md) - System architecture
- [SETUP_API_KEYS.md](../SETUP_API_KEYS.md) - Detailed API setup

### Learning Resources
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Groq API Documentation](https://console.groq.com/docs)
- [Google Gemini API Documentation](https://ai.google.dev/docs)

## 🤝 Contributing

### How to Contribute
1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Test thoroughly**
5. **Submit a pull request**

### Contribution Guidelines
- Follow SwiftUI best practices
- Maintain MVVM architecture
- Add proper error handling
- Include documentation for new features
- Test on multiple devices/simulators

## 🎯 Next Steps

### For Users
1. Set up your API keys
2. Test the basic functionality
3. Explore the different AI providers
4. Customize the interface if desired

### For Developers
1. Study the architecture documentation
2. Understand the MVVM pattern
3. Explore the API integration
4. Consider adding new features

---

**Happy coding! 🚀**

This app provides a solid foundation for building AI-powered chat applications. Feel free to customize, extend, and improve it for your specific needs. 