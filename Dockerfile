# Use Node.js 20 base image
FROM node:20

# Set working directory
WORKDIR /app

# Copy package files
COPY ["package.json", "package-lock.json*", "./"]

# Install all dependencies (including dev dependencies)
RUN npm install

# Install global dependencies needed for development
RUN npm install -g nodemon tsx

# Copy all source code
COPY . .

# Build TypeScript to JavaScript for production
RUN npm run build

# Expose the port your app runs on
EXPOSE 5101

# Use development script if NODE_ENV=development, else run production
CMD if [ "$NODE_ENV" = "development" ]; \
    then npm run dev; \
    else npm start; \
    fi