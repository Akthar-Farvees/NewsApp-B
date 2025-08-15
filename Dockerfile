# Use Node.js 20 base image
FROM node:20

# Set environment
ENV NODE_ENV=development

# Set working directory
WORKDIR /app

# Copy package files
COPY ["package.json", "package-lock.json*", "./"]

# Install all dependencies (including dev dependencies for dev)
RUN npm install

# Copy all source code
COPY . .

# Expose the port your app runs on
EXPOSE 5101

# Run your dev script
CMD ["npm", "run", "dev"]
