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

### 3️⃣ Prepare environment file

For a template see the [.env.template](https://github.com/dani-garcia/vaultwarden/blob/main/.env.template) file

1. Generate an `ADMIN_TOKEN`, e.g.
   ```shell
   $> echo -n "MySecretPassword" | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4
   $argon2id$v=19$m=65540,t=3,p=4$bEtYUkR3b0o0NnN1MnAwbUFGRWVlSVQwdWpZRk1lV3J5N0RUK01DbUprZz0$IyrN3Dx+JEciLn5H/H1IUXrkcBd/YcuT9PpcLCK9BL4
   ```
2. Disable signups by setting `SIGNUPS_ALLOWED=false`
3. Disable invitations by setting `INVITATIONS_ALLOWED=false`

### 4️⃣ Set up users

If you followed the above recommendations, e.g. `SIGNUPS_ALLOWD=false` and `INVITATIONS_ALLOWED=false`, users have to be explicitly invited by the admin via `https://vaultwarden.example.tld/admin`. If mailing has been disabled, invited users can use `https://vaultwarden.example.tld/#/signup` to signup. Otherwise they use the link sent via mail.

## 🚀 Usage

0. Run `docker compose up -d` 
1. Open the app in your browser → https:/<SERVER_URL>:9443