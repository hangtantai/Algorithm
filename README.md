# CI/CD pipeline
Trong project này mình tìm hiểu về CI/CD pipeline.

## Tại sao lại cần CI/CD pipeline
Lý do:
- Dễ dàng thực hiện nhiều thao tác
- Tự động thao tác


## Hướng dẫn
### Tạo Secrets variable trên github:
- Vào `settings` của github repo -> `Security/Secrets and variables` -> `Actions` -> `New repository secrets` button
- Name của secrets là tên biến mà bạn sẽ sử dụng trong file
- Value của secrets là giá trị của biến
- Ví dụ: Name: VM_IP -> Value: <VM_IP_VALUE> (for example: 127.0.0.1: localhost)

### Push lên docker hub
- Set secrets như hướng dẫn cho DOCKER_USERNAME và DOCKER_PASSWORD_KEY: đây không phải password mà là tạo 1 token đăng nhập trên docker hub
``` bash
name: CI/CD Pipeline

on:
  push:
    branches:
      - <YOUR_BRANCH>

jobs:
  build:
    runs-on: <YOUR_RUNNERS> 

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2

    - name: Log in to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_HUB_USERNAME }}
        password: ${{ secrets.DOCKER_HUB_PASSWORD }}

    - name: Build and push backend image
      run: |
        docker build -t <YOUR_FILE>:latest -f <PATH_TO_DOCKERFILE> . 
        docker tag <YOUR_FILE>:latest <USERNAME_DOCKER_HUB>/<YOUR_FILE>:latest 
        docker push <USERNAME_DOCKER_HUB>/<YOUR_FILE>:latest
```
