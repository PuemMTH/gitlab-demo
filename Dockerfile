# Use an official Node.js LTS (Long Term Support) image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the project files to the working directory
COPY . .

# Build your project (tsc & vite build)
RUN npm run build

# Expose the port your Vite application will run on (default: 3000)
EXPOSE 3000

# Define the command to start your application
CMD ["npm", "run", "dev"]