# HealPoint 🩺

HealPoint is a SwiftUI-based iOS healthcare application designed to simplify doctor discovery and appointment booking. The app connects patients with verified medical professionals through a clean, modern, and user-friendly interface.

---

## 🚀 Overview

HealPoint focuses on solving a common real-world problem:

> Finding nearby verified doctors and booking appointments seamlessly.

The application includes structured onboarding, location-based discovery, doctor verification flow, and role-based navigation.

---

## ✨ Key Features

### 👤 Patient Module

* Secure login flow
* Location permission handling (native iOS authorization)
* Nearby doctor listing
* Real-time search functionality
* Appointment booking with:

  * Patient name
  * Age
  * Date selection
  * Time selection

### 🧑‍⚕️ Doctor Module

* Profile onboarding with:

  * Profile photo upload
  * Specialization input
  * Medical license number
  * Certificate upload
* Verification flow:

  * Pending review state
  * Automatic approval simulation
* Profile screen displaying submitted details
* Logout functionality

### 🔐 Verification System

* Doctors are initially marked as **Pending**
* After review simulation, status updates to **Approved**
* Auto-redirect to Doctor Dashboard

### 🎨 UI Highlights

* Liquid glass styled app icon
* Modern rounded UI components
* Clean navigation transitions
* Structured MVVM architecture

---

## 🏗 Architecture

HealPoint follows the **MVVM (Model-View-ViewModel)** architecture.

### Structure:

* **Models** → Doctor, User, VerificationStatus
* **Views** → Onboarding, Login, Home, Profile, Booking
* **ViewModels** → Business logic & state management

This ensures:

* Clean separation of concerns
* Scalable design
* Easy testing

---

## 📱 Navigation Flow

### Patient Flow

Onboarding → Login → Location Permission → Patient Home → Book Appointment

### Doctor Flow

Onboarding → Submit for Verification → Pending Screen → Approved → Doctor Dashboard

Logout resets the app state to Onboarding.

---

## 🧪 Testing

The project includes:

* Model initialization tests
* ViewModel validation tests
* Basic UI existence tests
* Launch performance measurement

Testing ensures stability and structural correctness.

---

## 🛠 Technologies Used

* Swift
* SwiftUI
* MVVM Architecture
* XCTest
* iOS Location Services (CoreLocation)

---

## 📌 Design Philosophy

HealPoint is built with:

* Clarity
* Simplicity
* Scalability
* User-first approach

The goal is to provide a lightweight yet structured healthcare interaction experience.

---

## 🔮 Future Improvements

* Backend integration for real doctor verification
* Real-time appointment syncing
* Push notifications
* Map-based doctor discovery
* Secure authentication integration


---

## 🙌 Acknowledgment

Built using SwiftUI with a focus on modern iOS design patterns and clean state-driven navigation.

---

**HealPoint — Connecting Patients with Verified Care.**
