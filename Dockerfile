# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Copy all files from the current directory to the working directory
COPY . .

# Build the Angular app in production mode
RUN npm run build --prod

# Expose port 80 to the outside world
EXPOSE 8080

# Define environment variable
ENV NODE_ENV=production

# Run ng serve when the container launches
CMD ["npm", "start"]
