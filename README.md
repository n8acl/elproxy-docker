# ELProxy Docker Container
ElProxy is a docker container that will spin up an Echolink Proxy server for the Echolink Amateur Radio VOIP network.

If you are behind a network firewall where you are not able to forward the ports needed for Echolink to work (say like a work firewall or a hotel firewallO) the Echolink Proxy Server allows you to connect out of that network on one port versus the 2 or 3 needed. You can run the Proxy at home and get access to Echolink that way.

Echolink is designed and maintained by Jonathan Taylor, K1RFD. He also designed the proxy, I just spun it into a Docker Container to make deployment easier for me. Find out more about Echolink at [https://www.echolink.org/](https://www.echolink.org/).

---

## Prerequisites

In order to run this container you need to do the following:

* Make sure you have Docker and Docker Compose installed

* Create directory to hold the config file for the proxy

```bash
mkdir elproxy
```
Next dowload the ElProxy.conf file from [https://github.com/n8acl/elproxy-docker/blob/master/ELProxy.conf](https://github.com/n8acl/elproxy-docker/blob/master/ELProxy.conf) and put it in this directory you just created.

Modify the password field to a password that you will remember. 

Save the file.

Now we are ready to get it running in docker.

---

## Running with Docker Compose
Copy the following into a docker-compose.yml file:

```yaml
version: '3.2'

services:
  elproxy:
    image: n8acl/elproxy:<tag>
    container_name: elproxy
    restart: unless-stopped
    ports:
        - '8200:8200'
        - '5198:5198'
        - '5199:5199'
        - '5200:5200'
    volumes:
        - /<path-to>/elproxy/ELProxy.conf:/usr/app/ELProxy.conf
```
Replace < tag > with the tag for your platform. Tags are:
* rpi: for running on a Raspberry Pi
* amd64: for running on a regular linux computer

Replace < path-to > with the full path to the config file you just created.

Save the file and then type:

```bash
docker-compose up -d
```

Check to make sure the container is running:

```bash
docker container ls --all
```

Now try to connect to your Echolink Proxy and the rest of the network.

---

## Contact
If you have questions, please feel free to reach out to me. You can reach me in one of the following ways:

- Discord: Ravendos
- Mastodon: @n8acl@mastodon.radio
- E-mail: n8acl@qsl.net

If you reach out to me and have an error, please include what error you are getting and what you were doing. I may also ask you to send me certain files to look at. Otherwise just reach out to me :).

---

## Change Log

* 03/29/2022 - Updated Contact Information on README.md

* 08/29/2020 - Initial Release
