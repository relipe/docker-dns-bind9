;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	example.com. root.example.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns1.example.com.
@	IN	NS	ns2.example.com.
@	IN	A	127.0.0.1
@	IN	AAAA	::1

ns1			A	192.168.0.1		; Change to the desired NS1 IP
ns2			A	192.168.0.2		; Change to the desired NS2 IP
test		A   192.168.10.10	; Change to desired Test Host IP