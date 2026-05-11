# Optimax Opticle Billing System

## Overview
A modern, fully responsive web-based billing and invoice management system built specifically for Optimax Opticle. It enables streamlined creation, management, and export of customer invoices while enforcing data integrity through strict form validations.

## Key Features
- **Responsive & Mobile-First UI**: Seamless experience across desktop and mobile devices, featuring off-canvas navigation, responsive data tables, and card-based lists.
- **Invoice Management**: Effortlessly create, view, manage, and print invoices with real-time tax and total calculations.
- **Flexible Export Options**: Generate and export professional invoices in multiple formats, including A4 and A5 PDF layouts, as well as direct print support.
- **Consistent Visual Branding**: System-wide integration of the company logo and visual branding for a professional look and feel.
- **Secure Operations**: Built-in authentication handling and strict validation to ensure data integrity and system security.
- **Automated Deployment**: CI/CD pipeline integrated via GitHub Actions, streamlining deployment to a VPS environment running an Nginx reverse proxy.

## Tech Stack

### Frontend
- **Framework:** React 19 (via Vite)
- **Styling:** Tailwind CSS
- **Routing:** React Router v7
- **HTTP Client:** Axios
- **Print & PDF:** `html2pdf.js` & `react-to-print`
- **Icons:** Lucide React

### Backend
- **Framework:** Node.js & Express.js
- **Database:** PostgreSQL (`pg`)
- **Authentication:** JSON Web Tokens (JWT) & bcryptjs
- **Validation:** Express Validator

## Project Architecture
The project follows a decoupled client-server architecture:
- `/frontend`: Contains the React application that serves as the user interface. It runs its own development server and builds static assets for production.
- `/backend`: The RESTful API built with Express to handle all business logic, database interactions, and secure authentication.

## Local Development Setup

### Prerequisites
- Node.js (v18+ recommended)
- PostgreSQL Database

### 1. Backend Setup
1. Open a terminal and navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Configure your environment variables. Create a `.env` file in the `backend` directory and provide necessary database credentials, JWT secrets, and the port (e.g., `5001`).
4. Start the backend development server:
   ```bash
   npm run dev
   ```

### 2. Frontend Setup
1. Open a new terminal and navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Make sure the Vite development server's proxy (in `vite.config.js`) aligns with your backend port.
4. Start the frontend development server:
   ```bash
   npm run dev
   ```

## Deployment
The application features a fully automated deployment pipeline.
- Push changes to the main branch to trigger **GitHub Actions**.
- The pipeline securely connects to the VPS, pulls the latest code, installs dependencies, builds the frontend, and restarts the backend process using PM2 (`ecosystem.config.js`).
- The VPS uses **Nginx** as a reverse proxy to route traffic between the frontend static files and the backend API.
