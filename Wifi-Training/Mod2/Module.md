# WiFi Training Program  
## Assignment Questions – Module 2

### 1. SplitMAC Architecture and its Benefits for AP Performance
The Split MAC architecture is a design used in wireless networks where the Media Access Control (MAC) functions are divided between the Access Point (AP) and a centralized controller, often referred to as a Wireless LAN Controller (WLC).

#### How Split MAC Architecture Works:

Real-Time MAC Functions: These are handled by the AP and include tasks that require immediate response, such as:

- Beacon generation
- Probe transmission and response
- Control frame processing (e.g., RTS/CTS)
- Retransmissions

Non-Real-Time MAC Functions: These are managed by the WLC and include tasks that can tolerate some delay, such as:

- Authentication and deauthentication
- Association and reassociation
- Bridging between Ethernet and Wireless LAN
- Fragmentation

Benefits of Split MAC Architecture:
- Improved Performance: By offloading non-real-time functions to the WLC, the AP can focus on time-sensitive tasks, reducing latency and improving overall network performance.
- Centralized Management: The WLC provides a single point of control for managing multiple APs, simplifying configuration, monitoring, and troubleshooting.
- Enhanced Security: Centralized authentication and encryption processes help in maintaining robust security protocols across the network.
- Scalability: This architecture allows for easier expansion of the network by adding more APs without significantly increasing management complexity.

### 2. Describe about CAPWAP and explain the flow between AP and controller 

CAPWAP (Control And Provisioning of Wireless Access Points) is a protocol designed to manage and control wireless access points (APs) from a centralized controller, known as a Wireless LAN Controller (WLC). It facilitates the communication between APs and WLCs, ensuring efficient management and provisioning of wireless networks.

#### CAPWAP Protocol Overview:
- Control Plane: Handles management and control messages between the AP and WLC, such as configuration updates, authentication, and association.
- Data Plane: Manages the actual user data traffic, ensuring it is securely tunneled between the AP and WLC

#### CAPWAP Protocol Overview:

- Discovery: The AP sends a discovery request to find the available WLC's. The WLC's responds with Discovery Response
- TLS Setup: Datagram Transport Layer Security (DTLS) session is established to encrypt subsequent messages1.
- Join:The AP sends a Join Request to the WLC.The WLC responds with a Join Response.
- Image Data:The AP checks its firmware version against the WLC. If they differ, the AP downloads the new image from the WLC and reboots1.
- Configuration: The AP sends a Configuration Status Request.The WLC responds with a Configuration Status Response.
- Run:The AP starts normal operation, handling user data and control messages as per the WLC's configuration.

#### Benefits of CAPWAP:
- Centralized Management: Simplifies the management of multiple APs from a single controller2.
- Enhanced Security: Ensures secure communication between APs and WLCs through DTLS encryption1.
- Scalability: Facilitates easy expansion of the network by adding more APs

### 3. Where this CAPWAP fits in OSI model what are the 2 tunnels in capwap and its purpose ?

CAPWAP primarily operates at the Layer 2 (Data Link Layer) and Layer 3 (Network Layer) of the OSI model. It uses UDP for transport, which is a Layer 4 (Transport Layer) protocol, but the main functions of CAPWAP involve managing and controlling wireless access points at the data link and network layers.

CAPWAP defines 2 types of tunnels 

1. Control Tunnel - The tunnel is used for exchanging control and management information between AP and WLC. Its functions are Configuration updates, authentication, association and other management tasks. It uses UDP port 5246.

2. Data tunnel - The tunnel is used for transporting user data between AP and WLC. It Encapsulates and forwards frames between wireless clients and networks. Uses UDP port 5247.

### 4. What is the difference between Lightweight APs and cloud based APs

#### Lightweight AP's
A Lightweight Access Point (LWAP) is an AP that requires a Wireless LAN Controller (WLC) to function. The WLC centrally manages multiple APs, handling configurations, security policies, and client traffic.

Some of the key characteristics include:-
   - Does not operate independently and relies on WLC.
   - Uses CAPWAP tunnels to communicate with WLC.
   - Provides centralized management for large networks.
   - Supports seamless roaming for mobile clients.

#### Cloud Based AP's
A Cloud-Based AP is an AP that is managed remotely via cloud-based controllers rather than an on-premises WLC. Configuration, monitoring, and updates are done through a cloud dashboard.

Some of the key characteristics include:-
   - No need for physical WLC and can operate independently 
   - Suitable for remote management from anywhere.
   - Suitable for distributed networks.

### 5. How the CAPWAP tunnel is maintained between AP and controller 

CAPWAP (Control and Provisioning of Wireless Access Points) tunnel is a secure communication channel between Lightweight APs and wireless LAN Controllers (WLC). It ensures APs remain connected to the controller for configuration, monitering and traffic management.
 
#### How the tunnel is maintained ?

   