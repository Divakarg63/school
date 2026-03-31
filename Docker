
# Use official Node image
FROM node:18

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Build (if needed)
RUN npm run build || true

# Expose port
EXPOSE 3000

# Start app
CMD ["npm", "start"]
