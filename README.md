# Puppeteer Lambda Docker

This repository contains a Docker-based setup for running Puppeteer on AWS Lambda in 2025.

## Prerequisites

- AWS Account
- AWS CLI configured with appropriate credentials
- Docker installed locally

## Deployment Steps

### 1. Clone the Repository

### 2. Configure AWS ECR Repository

1. Open `build.sh` and update the following:
   - `ECR_REPOSITORY`: Your ECR repository name
   - Change AWS Region

### 3. Build and Deploy

1. Make the build script executable:
```bash
chmod +x build.sh
```

2. Run the build script:
```bash
./build.sh
```

This will:
- Build the Docker image
- Push it to your ECR repository

### 4. Create AWS Lambda Function

1. Go to AWS Lambda Console
2. Click "Create function"
3. Select "Container image" as the source
4. Choose "Browse images" and select your ECR repository and corresponding container
5. Configure the function:
   - Function name: Choose a name
   - Runtime: Node.js 20.x | IMPORTANT
   - Architecture: x86_64  | IMPORTANT
   - Memory: Recommended minimum 2048MB
   - Timeout: Adjust based on your needs (default: 30 seconds)

## Configuration

- The Docker image includes all necessary dependencies for running Puppeteer in a headless environment
- Chrome is pre-installed in the container
- The container is optimized for AWS Lambda's execution environment

## Troubleshooting

If you encounter any issues:
1. Check AWS CloudWatch logs for detailed error messages
2. Verify your AWS credentials and permissions
3. Ensure your Lambda function has sufficient memory and timeout settings
4. Check if your VPC settings (if used) allow proper internet access

## License

MIT 