# 🔑 API Key Setup Guide

## ⚠️ Security Notice
**NEVER commit your actual API keys to version control!** This guide shows you how to set up your API keys securely.

## 🚀 Quick Setup

### Step 1: Get Your API Keys

#### Groq API Key
1. Visit [Groq Console](https://console.groq.com/)
2. Sign up for a free account
3. Create a new API key
4. Copy the key (starts with `gsk_`)

#### Google Gemini API Key
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Create a new API key
4. Copy the key (starts with `AIza`)

### Step 2: Configure Your API Keys

1. **Copy the template file**:
   ```bash
   cp AIChatBotApp/Services/APIConstants.template.swift AIChatBotApp/Services/APIConstants.swift
   ```

2. **Edit the file** and replace the placeholder values:
   ```swift
   // Replace these placeholder values with your actual API keys
   static let groqAPIKey = "gsk_your_actual_groq_key_here"
   static let geminiAPIKey = "AIza_your_actual_gemini_key_here"
   ```

### Step 3: Verify Setup

1. **Check that APIConstants.swift is in .gitignore**:
   ```bash
   git status
   ```
   You should NOT see `APIConstants.swift` in the output.

2. **Test the app**:
   - Build and run the app in Xcode
   - Try sending a message
   - Verify you get responses from the AI

## 🔒 Security Best Practices

### ✅ Do's
- ✅ Use the template file as a starting point
- ✅ Keep your API keys private and secure
- ✅ Use environment variables in production
- ✅ Rotate API keys regularly
- ✅ Monitor API usage for unexpected charges

### ❌ Don'ts
- ❌ Never commit API keys to version control
- ❌ Don't share API keys in public repositories
- ❌ Don't hardcode keys in production apps
- ❌ Don't use the same key across multiple projects

## 🛠️ Alternative Setup Methods

### Method 1: Environment Variables (Recommended for Production)
```swift
// In APIConstants.swift
static let groqAPIKey = ProcessInfo.processInfo.environment["GROQ_API_KEY"] ?? ""
static let geminiAPIKey = ProcessInfo.processInfo.environment["GEMINI_API_KEY"] ?? ""
```

### Method 2: Configuration Files
```swift
// Create a Config.plist file (add to .gitignore)
// Load keys from the plist file
```

### Method 3: Keychain Storage (Most Secure)
```swift
// Store keys in iOS Keychain
// Load them securely at runtime
```

## 🚨 Troubleshooting

### "API Key Not Configured" Error
- Ensure you've copied the template file to `APIConstants.swift`
- Verify your API keys are correctly pasted
- Check that the keys start with the correct prefixes

### "Invalid API Key" Error
- Verify your API keys are valid and active
- Check your account status and billing
- Ensure you're using the correct API endpoints

### Build Errors
- Make sure `APIConstants.swift` is added to your Xcode project
- Clean build folder: `Cmd+Shift+K` in Xcode
- Rebuild the project

## 📞 Support

If you encounter issues:
1. Check the [README.md](../README.md) for general troubleshooting
2. Verify your API keys are working in the provider's console
3. Check your internet connection and firewall settings

---

**Remember: Security first! Never expose your API keys publicly.** 