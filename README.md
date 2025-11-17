# MyPass - Password Managment



## 🧭 Project Description


### Why These Technologies

## ⚙️ Installation

## Prerequisites

- Docker (>= 24.0)
- Docker Compose (>= 2.21)

---

### 1️⃣ Clone the Repository

```shell
$> git clone git@github.com:fdietzsch/mypass.git
$> cd mypass
```

### 2️⃣ Store SSL certificate

Put the SSL certificate under `./secrets/nginx/certs`
> [!NOTE]  
For **development** environments only, you may use `localhost` as your trusted root CA
```shell
$> sudo port install mkcert
$> mkcert -install
$> mkcert 127.0.0.1 localhost

Created a new certificate valid for the following names 📜
 - "127.0.0.1"
 - "localhost"

The certificate is at "./127.0.0.1+1.pem" and the key at "./127.0.0.1+1-key.pem" ✅

It will expire on 17 February 2028 🗓
```

### 3️⃣ Prepare environment files

## 🚀 Usage

0. Run `docker compose up -d` 
1. Open the app in your browser → https:/<SERVER_URL>:9443