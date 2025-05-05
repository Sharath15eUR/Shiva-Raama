### 1) What is the significance of MAC layer and in which position it is placed in the OSI model?

The MAC (Medium Access Control) layer is responsible for managing access to the shared wireless medium. It handles addressing, channel access control, collision avoidance, and error detection. It ensures orderly communication among devices and determines when a device can transmit data. The MAC layer resides within the **Data Link Layer (Layer 2)** of the OSI model, just above the Physical Layer

### 2) Describe the frame format of the 802.11 MAC header and explain the purpose of each field.

The 802.11 MAC header includes several fields:

- **Frame Control:** Specifies the type of frame (management, control, or data), protocol version, and control flags.
- **Duration/ID:** Indicates how long the channel will be reserved.
- **Address Fields (1–4):** Identify the receiver, transmitter, source, destination, and AP.
- **Sequence Control:** Helps in ordering fragmented frames.
- **QoS Control (optional):** Used in QoS-enabled networks for traffic prioritization.
- **Frame Body:** Carries the actual data or management information.
- **FCS (Frame Check Sequence):** Used for error detection.

### 3) Please list all the MAC layer functionalities in all Management, Control, and Data planes.

- **Management Plane:**
  - Scanning (active/passive)
  - Authentication
  - Association/Reassociation
  - Disassociation/Deauthentication
  - Beacon generation

- **Control Plane:**
  - RTS/CTS (collision avoidance)
  - ACK/Block ACK (reliable delivery)
  - PS-Poll (power saving)
  - BAR/BA (block acknowledgment)

- **Data Plane:**
  - Data frame transmission
  - Aggregation (A-MSDU, A-MPDU)
  - Fragmentation
  - Retransmissions
  - Acknowledgment handling

### 4) Explain the scanning process and its types in detail.

Scanning is used by a station (STA) to discover nearby access points (APs):

- **Passive Scanning:** STA listens for beacon frames on each channel. It consumes less power but takes longer.
- **Active Scanning:** STA sends probe request frames and waits for probe responses. Faster but consumes more power.

This process helps the STA collect network information like SSID, supported rates, and security features before associating

### 5) Brief about the client association process.

The association process allows a STA to join a wireless network:

1. After scanning and (if required) authentication, the STA sends an **Association Request** frame
2. The AP processes the request and sends back an **Association Response** with an AID (Association ID)
3. Once associated, the STA can communicate through the AP

### 6) Explain each step involved in EAPOL 4-way handshake and the purpose of each key derived from the process.

The EAPOL 4-Way Handshake secures communication between the STA and AP:

1. **Message 1:** AP sends ANonce to the STA.
2. **Message 2:** STA generates SNonce, derives PTK using PMK, ANonce, SNonce, and MACs; sends SNonce to AP.
3. **Message 3:** AP also derives PTK, encrypts and sends GTK to STA.
4. **Message 4:** STA confirms the handshake with an ACK.

**Keys derived:**
- **PTK (Pairwise Transient Key):** Used for unicast encryption.
- **GTK (Group Temporal Key):** Used for multicast/broadcast encryption.
- **PMK (Pairwise Master Key):** Basis for PTK derivation.

### 7) Describe the power saving scheme in MAC layer and explore the types of power saving mechanisms.

The MAC layer implements power-saving techniques:

- **Basic Power Save Mode:** STA sets a Power Management bit and sleeps; it periodically wakes to check TIMs in beacons.
- **U-APSD (Unscheduled Automatic Power Save Delivery):** Triggered by STA to receive buffered data.
- **TWT (Target Wake Time):** In 802.11ax, STA and AP agree on specific wake intervals to reduce contention and save power.

These mechanisms help reduce energy usage, especially in battery-powered devices.

### 8) Describe the Medium Access Control methodologies.

The MAC layer uses these methods:

- **CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance):** STA senses the medium; transmits if idle, else waits a backoff period.
- **RTS/CTS:** Prevents hidden node collisions.
- **TXOP (Transmission Opportunity):** Allows a device to reserve the medium for a period to transmit multiple frames.

These methods ensure efficient, fair access to the wireless medium.

### 9) Brief about the Block ACK mechanism and its advantages.

Block ACK (BA) allows batch acknowledgment of multiple frames:

- Sender aggregates several MPDUs.
- Receiver responds with a BA frame, using a bitmap to indicate received MPDUs.
- Reduces ACK overhead and improves throughput, especially with frame aggregation.

**Advantages:**
- Lower control overhead
- Improved efficiency in high-throughput environments
- Better performance in poor channel conditions

### 10) Explain about A-MSDU, A-MPDU and A-MSDU in A-MPDU.

- **A-MSDU (Aggregated MSDU):** Combines multiple MSDUs into one MPDU. Lower overhead but limited error recovery.
- **A-MPDU (Aggregated MPDU):** Combines multiple MPDUs into a PPDU. Each MPDU has its own header and FCS.
- **A-MSDU in A-MPDU:** Nested aggregation—MSDUs are aggregated into MPDUs (A-MSDU), and then those MPDUs are combined into an A-MPDU.

This hybrid method improves efficiency while supporting partial retransmissions for failed MPDUs.
