# Network Assignment - 01

#### Shiva Raama Krishna.K
#### Mepco Schlenk Engineering College
#### Dept. of Computer Science and Engineering

## Question - 01

### Capture and analyze ARP packets using Wireshark. Inspect the ARP request and reply frames when your device attempts to find the router's MAC address. Discuss the importance of ARP in packet forwarding

First create multiple files 

```Bash

PS C:\Users\Shiva rama krishna> Test-Connection www.google.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
EURLTP-597    www.google.com  142.250.189.196                                           32       354
EURLTP-597    www.google.com  142.250.189.196                                           32       227
EURLTP-597    www.google.com  142.250.189.196                                           32       330
EURLTP-597    www.google.com  142.250.189.196                                           32       216


PS C:\Users\Shiva rama krishna> Test-Connection www.facebook.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
EURLTP-597    www.facebook... 157.240.22.35                                             32       256
EURLTP-597    www.facebook... 157.240.22.35                                             32       264
EURLTP-597    www.facebook... 157.240.22.35                                             32       255
EURLTP-597    www.facebook... 157.240.22.35                                             32       256


PS C:\Users\Shiva rama krishna>  Test-Connection www.github.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
EURLTP-597    www.github.com  140.82.116.4                                              32       284
EURLTP-597    www.github.com  140.82.116.4                                              32       283
EURLTP-597    www.github.com  140.82.116.4                                              32       247
EURLTP-597    www.github.com  140.82.116.4                                              32       254


PS C:\Users\Shiva rama krishna> Test-Connection www.cisco.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
EURLTP-597    www.cisco.com   23.37.18.125                                              32       288
EURLTP-597    www.cisco.com   23.37.18.125                                              32       274
EURLTP-597    www.cisco.com   23.37.18.125                                              32       283
EURLTP-597    www.cisco.com   23.37.18.125                                              32       392


PS C:\Users\Shiva rama krishna> nslookup www.google.com
Server:  eur-dc2.embedur.local
Address:  192.168.16.4

Non-authoritative answer:
Name:    www.google.com
Addresses:  2607:f8b0:4005:80d::2004
          142.250.189.228

PS C:\Users\Shiva rama krishna> nslookup www.facebook.com
Server:  eur-dc2.embedur.local
Address:  192.168.16.4

Non-authoritative answer:
Name:    star-mini.c10r.facebook.com
Addresses:  2a03:2880:f131:83:face:b00c:0:25de
          157.240.22.35
Aliases:  www.facebook.com

PS C:\Users\Shiva rama krishna>  nslookup www.amazon.com
Server:  eur-dc2.embedur.local
Address:  192.168.16.4

Non-authoritative answer:
Name:    d3ag4hukkh62yn.cloudfront.net
Addresses:  2600:9000:2163:200:7:49a5:5fd4:b121
          2600:9000:2163:ea00:7:49a5:5fd4:b121
          2600:9000:2163:8a00:7:49a5:5fd4:b121
          2600:9000:2163:3200:7:49a5:5fd4:b121
          2600:9000:2163:f200:7:49a5:5fd4:b121
          2600:9000:2163:800:7:49a5:5fd4:b121
          2600:9000:2163:1000:7:49a5:5fd4:b121
          2600:9000:2163:cc00:7:49a5:5fd4:b121
          99.84.64.60
Aliases:  www.amazon.com
          tp.47cf2c8c9-frontier.amazon.com

PS C:\Users\Shiva rama krishna> nslookup www.github.com
Server:  eur-dc2.embedur.local
Address:  192.168.16.4

Non-authoritative answer:
Name:    github.com
Address:  140.82.116.4
Aliases:  www.github.com

PS C:\Users\Shiva rama krishna>  nslookup www.cisco.com
Server:  eur-dc2.embedur.local
Address:  192.168.16.4

Non-authoritative answer:
Name:    e2867.dsca.akamaiedge.net
Addresses:  2600:1406:3a00:78b::b33
          2600:1406:3a00:783::b33
          23.37.18.125
Aliases:  www.cisco.com
          www.cisco.com.akadns.net
          wwwds.cisco.com.edgekey.net
          wwwds.cisco.com.edgekey.net.globalredir.akadns.net

PS C:\Users\Shiva rama krishna>

```

![all](arp.png)