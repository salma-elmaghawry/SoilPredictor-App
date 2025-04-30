# SoilPredictor 🌱🖼️

**AI-powered App** to determine whether soil is suitable for planting based on real-time image analysis of soil health🌱

🌱SoilPredictor uses deep learning to classify soil types and analyze key soil nutrients directly from your camera input or image uploads, helping farmers, gardeners, and soil enthusiasts determine whether the soil conditions are right for planting.

---

## 📱 What is SoilPredictor?

🌱SoilPredictor is an **AI-powered mobile app** that:
- **Analyzes soil health** by predicting soil type and estimating important soil nutrients from images.
- **Tells you if the soil is suitable for planting** based on key parameters such as:
  - Soil type (Alluvial, Black, Clay, Red, etc.)
  - ## Key Soil Nutrients
- **Nitrogen (NH₄)**, **Phosphorus (P)**, **Potassium (K)**, **pH (Soil Acidity)**, **Electrical Conductivity (EC)**, **Sulfur (S)**, **Zinc (Zn)**, **Iron (Fe)**, **Copper (Cu)**, **Manganese (Mn)**, **Boron (B)**


- The app will analyze whether these nutrients and factors are in optimal ranges for planting, providing a clear response of whether the soil is **suitable** or **not suitable** for planting.
  
**Key Feature:**  
The **Soil Suitability for Planting** is the app's **main functionality**, which provides an answer based on AI predictions:  
- `"This soil is suitable for planting."`
- `"This soil is not suitable for planting."`

---

## 🎯 Key Features

- 📸 **Capture or upload soil images** from your gallery or camera.
- 🌍 **AI Soil Prediction**: Classifies soil types and predicts important soil nutrients (Nitrogen, Phosphorus, Potassium, etc.).
- 🌱 **Soil Suitability for Planting**: Main functionality that evaluates if the soil is suitable for planting based on nutrient levels and soil type.
- 📊 **Visualizations**: User-friendly UI that shows the prediction results and explains whether the soil is good for planting.
- 🔄 Communication with the **AI-powered Flask server** via RESTful API.

---
## 📸 Screens
![screens](https://github.com/user-attachments/assets/f91463ee-97d6-4713-9d63-4d0639b865a5)


---

## 🧠 About the AI Model

The core of **SoilPredictor** lies in its **AI model**, which is trained on soil images to **classify soil type** and estimate nutrient levels. The AI model processes the images and outputs a **soil suitability message** based on the predicted values.

### **Model Details**:
- **Dataset**: A comprehensive dataset of soil images, categorized into different types and enriched with key soil nutrients.
- **Architecture**: Convolutional Neural Network (CNN), optimized for image classification and nutrient prediction.
- **Prediction**: The model predicts both the **soil type** (e.g., Alluvial, Clay) and the **soil nutrient levels**, which are crucial in determining the soil's suitability for planting.

The model's repository can be found here:  
👉 [Soil Model Repository](https://github.com/Zyaddhossam/Soil_Model)

---

## 🌍 Supported Soil Types
- Alluvial Soil
- Black Soil
- Clay Soil
- Red Soil

---

## 🌱 Soil Suitability for Planting

This is the **main feature** of the app. After receiving the image and analyzing its soil type and nutrient levels, the app will evaluate the soil's suitability for planting.

### **How it Works:**
1. The user uploads an image of soil via the app.
2. The app sends this image to the AI server for prediction.
3. The AI model classifies the soil type and predicts nutrient levels (e.g., Nitrogen, Potassium, Phosphorus).
4. The app checks the nutrient levels (such as **pH**, **EC**, and **NH₄**) against agricultural standards.
5. The app displays the result:
   - **If the soil is suitable for planting**, the message will be:
     - `"This soil is suitable for planting."`
   - **If the soil is not suitable**, the message will be:
     - `"This soil is not suitable for planting."`

This evaluation is based on essential soil health parameters like **pH**, **Electrical Conductivity (EC)**, and nutrient content, making it easy for users to determine if their soil is ready for planting.

---

## ⚡ Quick Start Guide

### Prerequisites
- Flutter SDK
- Dart SDK
- Python 3.8+ (for API server)
- pip (Python package installer)

---

### Clone and Run the Flutter App
```bash
# Clone the repository
git clone https://github.com/your-username/SoilPredictor.git
cd SoilPredictor

# Get Flutter packages
flutter pub get

# Run the app
flutter run
