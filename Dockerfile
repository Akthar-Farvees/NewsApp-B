# Use Node.js 20 base image
FROM node:20

# Set environment
ENV NODE_ENV=production

# Set working directory
WORKDIR /app

# Copy package files
COPY ["package.json", "package-lock.json*", "./"]

# Install only production dependencies
RUN npm install --production

# Copy all source code
COPY . .

# Expose the port your app runs on
EXPOSE 5101

# Run your app (ensure it listens on 0.0.0.0)
CMD ["node", "index.js"]
