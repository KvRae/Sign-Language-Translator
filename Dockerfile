# Use a Node.js LTS (Long-Term Support) version
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first for caching purposes
COPY package*.json ./

# Install dependencies
RUN npm install

# Install budo (make it a dev dependency if needed)
RUN npm install budo --save-dev

# Copy the rest of the application files
COPY . .

# Expose the port your app will run on (adjust if needed)
EXPOSE 9966

# Start the application and bind to 0.0.0.0 to allow external access
CMD ["npm", "start", "--host", "0.0.0.0"]
