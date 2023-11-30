# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app for production
RUN npm run build

# Expose the port that Nginx will run on
EXPOSE 80

# Command to run Nginx and serve the built React app
CMD ["npx", "serve", "-s", "build", "-l", "80"]

