# WiFi Training Program  
## Assignment Questions – Module 1  

### 1. In which OSI layer does the Wi-Fi standard/protocol fit?  
Wi-Fi operates in:  
- Layer 1 (Physical Layer): Handles radio signal transmission.  
- Layer 2 (Data Link Layer): Divided into:
  - Logical Link Control (LLC)
  - Media Access Control (MAC) for frame addressing and access control.  

### 2. Wi-Fi Devices and Corresponding Generations  
List your daily-use Wi-Fi devices (laptop, smartphone, tablet) and match their Wi-Fi standard:  
- Wi-Fi 4 (802.11n)  
- Wi-Fi 5 (802.11ac)  
- Wi-Fi 6 (802.11ax)  

Check device Wi-Fi version:  
- Windows: `netsh wlan show interfaces`  
- Mac: System Report -> Network -> Wi-Fi  

### 3. What is BSS and ESS?  
Wi-Fi networks are categorized into Basic Service Set (BSS) and Extended Service Set (ESS):

#### Basic Service Set (BSS)
- A BSS consists of a single access point (AP) and the connected devices.
- Identified by a Basic Service Set Identifier (BSSID), which is the MAC address of the AP.
- Used in small-scale networks like home Wi-Fi.

Example:  
- A home Wi-Fi router with a few connected devices.

#### Extended Service Set (ESS)
- An ESS is a collection of multiple BSSs, allowing seamless roaming between access points.
- Uses a common SSID (network name) to provide a unified connection.
- Typically found in offices, campuses, and large buildings.

Example:  
- A university campus where multiple APs provide Wi-Fi coverage, and users move between them without losing connection.

| Feature | BSS | ESS |
|---------|----|-----|
| Components | Single AP & connected devices | Multiple APs & connected devices |
| SSID | Unique per AP | Common across APs |
| Coverage | Small (single room/house) | Large (campus/office building) |
| Roaming | No seamless roaming | Supports seamless roaming |

Why is ESS important?
- Ensures continuous connectivity in large areas.
- Allows load balancing, where devices switch to less congested APs.
- Enhances network stability and performance.

---

### 4. Basic Functionalities of a Wi-Fi Access Point  
- Provides wireless connectivity.  
- Manages device connections.  
- Supports security protocols (WPA3).  
- Enables multiple SSIDs (guest networks).  

### 5. Difference Between Bridge Mode and Repeater Mode  
| Feature | Bridge Mode | Repeater Mode |
|---------|------------|--------------|
| Purpose | Connects two different networks | Extends Wi-Fi range |
| Use Case | Business/enterprise settings | Home Wi-Fi improvement |

### 6. Differences Between 802.11a and 802.11b  
| Feature | 802.11a | 802.11b |
|---------|--------|--------|
| Frequency | 5 GHz | 2.4 GHz |
| Speed | Up to 54 Mbps | Up to 11 Mbps |
| Range | Shorter | Longer |
| Interference | Less | More |

### 7. Configuring Your Modem/Hotspot to 2.4 GHz and 5 GHz  
#### Steps:  
1. Access router settings via 192.168.1.1.  
2. Navigate to Wireless Settings.  
3. Change frequency to 2.4 GHz and save settings.  
4. Connect a Wi-Fi device (laptop/smartphone) and record:
   - Speed
   - Latency
   - Signal Strength
5. Repeat the process by setting the frequency to 5 GHz.
6. Compare the differences:
   - 2.4 GHz provides better range but lower speed.
   - 5 GHz offers higher speed but shorter range.
7. Document the observed variations in performance.

### 8. Difference Between IEEE and WFA  
| Feature | IEEE | WFA |
|---------|------|-----|
| Full Form | Institute of Electrical and Electronics Engineers | Wi-Fi Alliance |
| Function | Develops networking standards (e.g., IEEE 802.11) | Certifies Wi-Fi devices for compliance |
| Role | Technical standardization | Ensuring interoperability |

- IEEE: Defines technical specifications for Wi-Fi.
- Wi-Fi Alliance (WFA): Ensures devices meet standards, enabling cross-device compatibility.

### 9. Types of Wi-Fi Internet Connectivity Backhaul  
Backhaul: The connection between an AP and the internet.  
Backhaul types include:  
1. Fiber Optic:  
   - High-speed and reliable.
   - Used for ISPs and high-performance networks.
   - Low latency.
2. DSL (Digital Subscriber Line):  
   - Slower than fiber.
   - Uses telephone lines.
   - Common in homes and small businesses.
3. Satellite:  
   - Used in remote areas.
   - High latency due to signal travel distance.
4. Cellular (4G/5G):  
   - Uses mobile network towers.
   - Portable, suitable for mobile hotspots and rural areas.

Example:  
- A university may use fiber optic backhaul for campus-wide Wi-Fi.  
- A rural home might use satellite internet due to lack of fiber infrastructure.  

### 10. Wi-Fi Topologies and Use Cases  
Wi-Fi networks follow different topologies based on their use cases:  

| Topology | Description | Use Case |
|----------|------------|----------|
| Ad-hoc | Devices connect directly without an AP | Temporary networks, file sharing |
| Infrastructure | Uses APs to manage traffic | Home/office networks |
| Mesh | Multiple APs create a seamless network | Large areas, smart homes |

#### Use Cases:  
- Ad-hoc: Used for peer-to-peer file sharing without an AP.  
- Infrastructure: Standard for home and office Wi-Fi networks.  
- Mesh Networks: Used in large buildings, campuses, and smart homes to provide seamless connectivity.  