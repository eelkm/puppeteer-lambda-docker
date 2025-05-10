FROM public.ecr.aws/lambda/nodejs:20

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy function code
COPY index.js ./

# Set the CMD to your handler
CMD [ "index.handler" ] 