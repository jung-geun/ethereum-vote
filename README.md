# Vote Project - Setup Guide

## Prerequisites

- Node Version Manager (nvm)
- Node.js and npm

## Installation & Setup

### 1. Install Node.js v18 using NVM

```bash
# Install Node.js v18
nvm install 18

# Use Node.js v18
nvm use 18

# Verify installation
node -v  # Should display v18.x.x
```

### 2. Install Truffle Framework

```bash
# Install Truffle globally
npm install -g truffle

# Verify installation
truffle version
```

### 3. Compile and Deploy Smart Contracts

```bash
# Compile smart contracts
truffle compile

# Deploy contracts to the blockchain
truffle migrate
```

## Additional Commands

```bash
# Run tests
truffle test

# Deploy to a specific network
truffle migrate --network [network_name]

# Reset deployment and migrate again
truffle migrate --reset
```