# Network Tools
Set of small command line tools that goal is to make life a little bit easier for Developers, SysAdmins and DevOps.
- - -

## Features
* nmap, traceroute and openssl without installing a lot of libraries
* IP Address listing - Easily list all IP addresses

`$ wf wf-ip-list`
```
127.0.0.1
192.168.0.192
172.19.0.1
172.21.0.1
(...)
```
* Network Interface listing - Easily list all network interface

`$ wf wf-if-list`
```
lo
enp3s0
wlp2s0
br-e119649a1cf8
docker0
veth18358a3@if214
(...)
```
* Simple network data table ( easier to understand than `ip` command )

`$ wf wf-net-list`
```
==========================================
|  # |         interface |            ip |
==========================================
|  1 |                lo |     127.0.0.1 |
|  2 |            enp3s0 |               |
|  3 |            wlp2s0 | 192.168.0.192 |
|  6 |           docker0 |    172.17.0.1 |
|  7 |   br-8f6a7b6131e7 |    172.22.0.1 |
| 17 | veth7564460@if193 |               |
| 18 | veth18358a3@if214 |               |
==========================================
```
* Quickly scan all your local network interfaces with `nmap`

`$ wf wf-scanme`
```
Starting Nmap 7.60 ( https://nmap.org ) at 2018-06-15 16:00 UTC
Nmap scan report for 192.168.0.192
Host is up (0.000092s latency).
Not shown: 995 closed ports
PORT     STATE    SERVICE    VERSION
22/tcp   open     ssh        OpenSSH (...)
| ssh-hostkey: 
(...)
80/tcp   filtered http
443/tcp  filtered https
(...)
```
* Basic mail server check

`$ wf wf-mail-ssl-check --mx smtp-relay.gmail.com -t 2 -s2 -v --mta-port 26`
```
[test #1][command]: timeout -t 2 openssl s_client -starttls smtp -crlf -connect smtp-relay.gmail.com:26 < /tmp/sslquit 2>&1
[test #1][result]: Failed. Timeout.
[test #2][command]: timeout -t 2 openssl s_client -showcerts -connect smtp-relay.gmail.com:465 < /tmp/sslquit 2>&1
[test #2] Skipped
[test #3][command]: timeout -t 2 openssl s_client -starttls smtp -crlf -connect smtp-relay.gmail.com:587 < /tmp/sslquit 2>&1
[test #3][result]: Ok.
```
* For more see TODO.md
- - -

## Running

Easy way: 
`docker run -it --rm --network=host webfront/net-tools wf-info`

Better way: 
Get the source code `git clone git@github.com:webfront-io/net-tools.git`
Find latest release `git tags`
Checkout to it / make it active `git checkout <tag>`
make docker image `make build`

Now either enter the container `make run` or run some commands `$(make echo-run) wf-info`
For the latter I also recommend making an alias `alias wf="$(make -f $(pwd)/Makefile echo-run)"`
Which will allow you to use those tools anywheere `wf wf-info`, `wf nmap` or `wf traceroute` ( Don't forget to save that alias to your ~/.profile, ~/.bashrc or ~/.bash_profile )
