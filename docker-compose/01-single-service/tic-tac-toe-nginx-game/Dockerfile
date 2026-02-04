# Use official nodejs image
FROM node:alpine

#Set the work dir
WORKDIR /app

# Copy game files and server.js to nodejs container
COPY server.js /app/
COPY tic-tac-toe-app/ /app/tic-tac-toe-app/

# Expose port 8080
EXPOSE 8080

#Serve the app
CMD ["node","server.js"]
