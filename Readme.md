# HTWebRemoteHost
#### Simple remote control of your home theater devices and HTPC from any web browser

HTWebRemoteHost is the companion app to [HTWebRemote](https://github.com/nicko88/HTWebRemote).

HTWebRemoteHost is a headless service, and you must use the [HTWebRemote](https://github.com/nicko88/HTWebRemote) Windows app to create and modify your remote controls, and then "Sync" them to this HTWebRemoteHost service on your RasPi / Linux PC.

### Raspberry Pi / Linux Installation

This install script is intended to install HTWebRemoteHost on RasPi or standard Linux running a Debian-based distribution using systemd.  It may work on other distributions but it has not been tested.  You can also download the Linux release and install it manually onto your particular Linux machine.

This script will ask to install HTWebRemoteHost and will also install ADB (Android Debug Bridge) which is needed to control an Nvidia Shield over the network.
#### Install
    sudo wget https://raw.githubusercontent.com/nicko88/HTWebRemoteHost/master/install/install.sh && sudo bash install.sh
#### Update
The primary method for updating the HTWebRemoteHost app is to use the update button located inside HTWebRemote's "Manage Remote Host" screen. Or if you like, you can run the update script manually here:

    sudo wget https://raw.githubusercontent.com/nicko88/HTWebRemoteHost/master/install/update.sh && sudo bash update.sh
#### Uninstall
    sudo wget https://raw.githubusercontent.com/nicko88/HTWebRemoteHost/master/install/uninstall.sh && sudo bash uninstall.sh

#### Note about controlling an Nvidia Shield

In order to control an Nvidia Shield from HTWebRemoteHost, you *may* need to first control it via remote buttons on Windows with [HTWebRemote](https://github.com/nicko88/HTWebRemote).  Then use the "Transfer NVShield Authorization" option found in the "Tools" menu in the "Manage Remote Host" screen inside the HTWebRemote Windows app.

## Run as Container
You can build and run this project in a container

### Building Project and Container

```shell
docker build . -t remote
```

### Running project in foreground
```shell
docker run -it -p 5000:5000 -v "$(pwd)/htwebremote/:/app/htwebremote" remote
```

### Run project in background

```shell
docker run -d -p 5000:5000 -v "$(pwd)/htwebremote/:/app/htwebremote" remote
```