#!/bin/bash

# Print OpenWrt build info
make info

# Set profile for armsr
PROFILE="generic"

PACKAGES=""

# Selecting default packages
    PACKAGES+="$PACKAGES -dnsmasq dnsmasq-full cgi-io libiwinfo libiwinfo-data libiwinfo-lua liblua \
    zram-swap adb parted losetup resize2fs luci luci-ssl block-mount htop bash curl wget-ssl \
    tar unzip unrar gzip jq luci-app-ttyd nano httping screen openssh-sftp-server \
    liblucihttp liblucihttp-lua libubus-lua lua luci-app-firewall luci-app-opkg \
    luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full \
    luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp \
    luci-theme-bootstrap px5g-wolfssl rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci \
    rpcd-mod-rrdns uhttpd uhttpd-mod-ubus usbutils \
    kmod-usb-net kmod-usb-net-huawei-cdc-ncm kmod-usb-net-cdc-ether kmod-usb-acm kmod-usb-net-qmi-wwan \
    kmod-usb-net-rndis kmod-usb-serial-qualcomm kmod-usb-net-sierrawireless kmod-usb-ohci kmod-usb-serial \
    kmod-nls-utf8 kmod-usb-serial-option kmod-usb-serial-sierrawireless kmod-usb-uhci kmod-usb2 \
    kmod-usb-net-ipheth kmod-usb-net-cdc-mbim usbmuxd libusbmuxd-utils libimobiledevice-utils \
    mbim-utils qmi-utils uqmi umbim modemmanager modemmanager-rpcd luci-proto-modemmanager libmbim libqmi luci-proto-3g luci-proto-ncm \
    usb-modeswitch picocom minicom libusb-1.0-0 \
    xmm-modem kmod-usb-net-asix kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8150 kmod-usb-net-rtl8152 \
    ca-bundle ca-certificates luci-compat coreutils-sleep fontconfig coreutils-whoami file lolcat \
    zsh kmod-mii kmod-usb-wdm kmod-usb-serial-wwan kmod-usb-ehci kmod-phy-broadcom kmod-phylib-broadcom kmod-tg3 iptables-nft coreutils-stty \
    hostapd wpa-cli wpa-supplicant kmod-cfg80211 kmod-mac80211 wireless-tools iw-full hostapd-utils \
    libqrtr-glib luci-proto-qmi \
    perl perlbase-base perlbase-bytes perlbase-class perlbase-config perlbase-cwd perlbase-dynaloader perlbase-errno perlbase-essential perlbase-fcntl perlbase-file \
    perlbase-filehandle perlbase-i18n perlbase-integer perlbase-io perlbase-list perlbase-locale perlbase-params perlbase-posix \
    perlbase-re perlbase-scalar perlbase-selectsaver perlbase-socket perlbase-symbol perlbase-tie perlbase-time perlbase-unicore perlbase-utf8 perlbase-xsloader \
    ruby ruby-bigdecimal ruby-date ruby-digest ruby-enc ruby-forwardable ruby-pstore ruby-psych ruby-stringio ruby-yaml \
    luci-lua-runtime zoneinfo-asia zoneinfo-core luci-proto-mbim \
    libc coreutils-stat libopenssl-legacy \
    sms-tool luci-app-temp-status cpusage ttyd dmesg kmod-tun luci-lib-ipkg \
    ipset iptables iptables-legacy iptables-mod-iprange iptables-mod-socket iptables-mod-tproxy kmod-ipt-nat \
    coreutils coreutils-base64 coreutils-nohup ip-full libuci-lua microsocks resolveip"
    
    # Openclah
    PACKAGES="$PACKAGES coreutils-nohup bash dnsmasq-full curl ca-certificates ipset ip-full libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip kmod-nft-tproxy luci-compat luci luci-base luci-app-openclash"
    
    # NAS and Hard disk tools
    PACKAGES="$PACKAGES luci-app-diskman kmod-usb-storage kmod-usb-storage-uas ntfs-3g"
    
    # Bandwidth And Network Monitoring
    PACKAGES+=" internet-detector luci-app-internet-detector internet-detector-mod-modem-restart vnstat2 vnstati2 luci-app-vnstat2"
    
    # Speedtest
    PACKAGES="$PACKAGES iperf3"
    
    # Material Theme
    PACKAGES="$PACKAGES luci-theme-material"
    
    # PHP8
    PACKAGES="$PACKAGES php8 php8-cgi php8-fastcgi php8-fpm php8-mod-ctype php8-mod-curl php8-mod-fileinfo php8-mod-iconv php8-mod-mbstring php8-mod-session php8-mod-zip \
        php8-cli php8-mod-bcmath php8-mod-calendar php8-mod-filter php8-mod-gd php8-mod-intl \
        php8-mod-mysqli php8-mod-mysqlnd php8-mod-opcache php8-mod-pdo php8-mod-pdo-mysql php8-mod-phar \
        php8-mod-xml php8-mod-xmlreader php8-mod-xmlwriter"
      
    # misc
    PACKAGES="$PACKAGES luci-app-ramfree luci-app-temp-status  wget"
    
    PACKAGES="$PACKAGES i2c-tools kmod-i2c-core kmod-i2c-gpio"
    
    # No
    PACKAGES="$PACKAGES -procd-ujail -libgd -dnsmasq -automount -libustream-openssl -default-settings-chn -luci-i18n-base-zh-cn -kmod-usb-net-rtl8152-vendor -hostapd -hostapd-common -hostapd-utils"
    
    # amlogic
    PACKAGES="$PACKAGES luci-app-amlogic ath9k-htc-firmware btrfs-progs hostapd hostapd-utils kmod-ath kmod-ath9k kmod-ath9k-common kmod-ath9k-htc kmod-cfg80211 kmod-crypto-acompress kmod-crypto-crc32c kmod kmod-fs-btrfs kmod-mac80211 wireless-tools wpa-cli wpa-supplicant"
    
# Files directory for custom configurations or files
FILES="files"

# Generate the image with specified profile and packages
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES"
