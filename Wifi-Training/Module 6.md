### 1) What are the pillars of Wi-Fi security?

Wi-Fi security is based on three core principles:

- **Authentication:** Confirms the identity of devices before granting access.
- **Encryption:** Protects the confidentiality of data by converting it into a secure format.
- **Integrity:** Ensures that transmitted data is not altered during transmission.

These pillars work together to provide a secure and trusted wireless environment.

### 2) Explain the difference between authentication and encryption in WiFi security.

- **Authentication** verifies that the user or device is who it claims to be. In Wi-Fi, this could be via a pre-shared key (PSK) or enterprise authentication using 802.1X.
- **Encryption**, on the other hand, protects the actual data being transmitted so that unauthorized users cannot interpret it, even if intercepted.

In short, authentication is about **access**, and encryption is about **privacy**.

### 3) Explain the differences between WEP, WPA, WPA2, and WPA3.

- **WEP (Wired Equivalent Privacy):** The first Wi-Fi security protocol; uses static keys and weak encryption (RC4). Easily broken.
- **WPA (Wi-Fi Protected Access):** Introduced as a quick fix to WEP; includes TKIP encryption and dynamic key exchange but still has weaknesses.
- **WPA2:** Replaced WPA with stronger AES-based encryption and a robust 4-way handshake.
- **WPA3:** The latest standard; uses Simultaneous Authentication of Equals (SAE), improved protection against brute-force attacks, and better security for open networks.

### 4) Why is WEP considered insecure compared to WPA2 or WPA3?

WEP is vulnerable because it uses:

- Static encryption keys
- A weak RC4 stream cipher
- A short IV (Initialization Vector), making it easy to crack via packet sniffing and replay attacks

These flaws allow attackers to break into WEP-secured networks in minutes, which is why it's now obsolete.

### 5) Why was WPA2 introduced?

WPA2 was introduced to address the shortcomings of WPA and WEP:

- It implemented **AES-based CCMP encryption**, providing stronger confidentiality and integrity.
- It mandated the use of **robust key management** and the **4-way handshake**.
- It became the industry standard for secure wireless communication until WPA3 arrived.
- 
### 6) What is the role of the Pairwise Master Key (PMK) in the 4-way handshake?

The **PMK** is a shared secret derived from the passphrase or 802.1X exchange. During the 4-way handshake:

- The PMK is used to derive the **Pairwise Transient Key (PTK)**.
- The PTK secures unicast communication between the client and AP.

The PMK is never transmitted—only used locally by both parties to create the same PTK.

---

### 7) How does the 4-way handshake ensure mutual authentication between the client and the access point?

Mutual authentication is achieved by:

- **AP sending a random nonce (ANonce) to the client.**
- **Client generating its own nonce (SNonce), deriving PTK, and sending it to the AP.**
- **Both devices use the PMK, nonces, and MAC addresses to independently generate the same PTK.**
- **Message integrity checks** verify that both parties have matching keys, confirming authenticity without revealing the PMK.

### 8) What will happen if we put a wrong passphrase during a 4-Way handshake?

If the passphrase is incorrect:

- The client and AP will derive **different PMKs**, resulting in mismatched PTKs.
- Integrity check in message 4 will **fail**, and the handshake will be aborted.
- As a result, the **client won't be able to join** the network.

This mechanism prevents unauthorized access even if the attacker attempts brute-force attempts.

### 9) What problem does 802.1X solve in a network?

802.1X introduces **port-based network access control**, addressing these issues:

- It ensures **only authenticated devices/users** can connect to the network.
- It separates **authentication** from the AP and delegates it to a RADIUS server.
- It supports **individual credentials** instead of a shared key, ideal for enterprise environments.

### 10) How does 802.1X enhance security over wireless networks?

802.1X enhances wireless security by:

- Using **EAP (Extensible Authentication Protocol)** methods for flexible and strong authentication.
- Allowing integration with **directory services** like LDAP or Active Directory.
- Enabling **per-user dynamic key generation** for unicast and broadcast traffic.

This provides a scalable and secure framework for managing network access.

