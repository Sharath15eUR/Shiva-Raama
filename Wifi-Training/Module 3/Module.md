# WiFi Training Program — Module 3 Assignment

### 1. Different 802.11 PHY Layer Standards
The IEEE 802.11 standard has several PHY layer standards including 802.11a, b, g, n, ac, ax, and be. Each one offers different data rates, frequencies, and modulation techniques. For instance, 802.11b uses DSSS in the 2.4 GHz band with speeds up to 11 Mbps, while 802.11ac uses OFDM in the 5 GHz band and supports Gbps data rates. 802.11ax (Wi-Fi 6) adds OFDMA and MU-MIMO for better spectral efficiency and capacity in dense environments.

### 2. DSSS and FHSS
DSSS (Direct Sequence Spread Spectrum) spreads data over a wide frequency band using a pseudo-random code, improving resistance to interference. FHSS (Frequency Hopping Spread Spectrum) rapidly switches frequencies during transmission based on a sequence, making it harder to intercept. Both techniques are used to enhance reliability and minimize interference in wireless communication.

### 3. Modulation Schemes in the PHY Layer
Modulation schemes like BPSK, QPSK, 16-QAM, and 64-QAM convert digital signals into analog waveforms for wireless transmission. Higher-order modulations (like 64-QAM) carry more bits per symbol but are more sensitive to noise. Standards like 802.11n and 802.11ac use adaptive modulation to dynamically switch based on signal quality, balancing performance and reliability.

### 4. Significance of OFDM in WLAN
OFDM (Orthogonal Frequency Division Multiplexing) divides a channel into multiple narrow subcarriers, each carrying part of the data. This reduces interference and improves spectral efficiency. It also combats multipath fading, making it ideal for high-speed WLANs like 802.11a/g/n/ac/ax, where reliable performance in complex environments is required.

### 5. Frequency Bands and Wi-Fi Channels
Wi-Fi operates in the 2.4 GHz, 5 GHz, and 6 GHz bands. The 2.4 GHz band has 14 channels (only 3 non-overlapping), making it prone to interference. The 5 GHz band offers more non-overlapping channels, leading to better performance. The 6 GHz band, introduced with Wi-Fi 6E, provides wider channels and less congestion, supporting high-throughput applications.

### 6. Guard Intervals in WLAN
Guard Intervals are small time gaps inserted between symbols to prevent inter-symbol interference caused by multipath propagation. A typical GI is 800ns, but a shorter 400ns GI improves efficiency by allowing more symbols per second. Short GIs are used when environments support minimal reflection, boosting data rates without affecting reliability.

### 7. Structure of an 802.11 PHY Layer Frame
An 802.11 PHY frame includes the Preamble, Header, and Payload. The Preamble synchronizes the receiver, the Header carries control info like rate and length, and the Payload carries the actual data. Newer standards like 802.11ax introduce extended preambles for improved device identification and efficiency in dense networks.

### 8. OFDM vs OFDMA
OFDM uses multiple subcarriers to transmit data for one user at a time, which is efficient but not ideal for multiple users. OFDMA, introduced in 802.11ax, assigns subsets of subcarriers (Resource Units) to different users simultaneously, enabling multi-user parallel access. This improves efficiency and reduces latency, especially in crowded networks.

### 9. MIMO vs MU-MIMO
MIMO (Multiple Input, Multiple Output) uses multiple antennas to send multiple data streams to a single user, improving speed and reliability. MU-MIMO (Multi-User MIMO), on the other hand, serves multiple users simultaneously using spatial streams. Introduced in 802.11ac and improved in 802.11ax, MU-MIMO enhances capacity and reduces congestion in high-density environments.

### 10. PPDU, PLCP, and PMD
PPDU (Physical Protocol Data Unit) is the complete data unit sent over the PHY layer. It contains the PLCP (Physical Layer Convergence Protocol), which prepares MAC data for transmission, and the PMD (Physical Medium Dependent) sublayer, which handles modulation and signal transmission over the medium. Together, they ensure reliable delivery from MAC to physical transmission.

### 11. Types of PPDU and Formats
There are different PPDU formats: Legacy (used in 802.11a/g), HT (802.11n), VHT (802.11ac), and HE (High Efficiency, for 802.11ax). Each format includes a preamble, header, and data portion suited to the respective standard’s features, like MIMO, channel width, or OFDMA. The HE PPDU adds features for spatial reuse and uplink/downlink multi-user communication.

### 12. Data Rate Calculation
Wi-Fi data rate depends on multiple factors: modulation scheme, coding rate, number of spatial streams, channel bandwidth, and guard interval. For example, in 802.11n, a 20 MHz channel using 64-QAM with a 5/6 coding rate and 2 spatial streams can reach 130 Mbps. Standards like 802.11ac and ax use wider channels and more streams to exceed 1 Gbps.
