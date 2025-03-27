# Stage 1: Build stage
FROM node:14 AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application source code to the container
COPY . .

# Build the application (assuming a build script is present in package.json)
RUN npm run build

# Stage 2: Production stage
FROM node:14-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files from the build stage (compiled files)
COPY --from=build /app/dist /app/dist
COPY --from=build /app/package*.json /app/

# Install only the production dependencies (excluding dev dependencies)
RUN npm install --production

# Expose the port on which the app will run
EXPOSE 3000

# Start the app
CMD ["node", "dist/index.js"]
