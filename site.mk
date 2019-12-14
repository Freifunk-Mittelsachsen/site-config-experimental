##	gluon site.mk makefile example

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#		The gluon-mesh-batman-adv-* package must come first because of the dependency resolution

GLUON_FEATURES := \
    authorized-keys \
    autoupdater \
		config-mode-contact-info \
		config-mode-mesh-vpn \
		config-mode-outdoor \
    config-mode-domain-select \
    config-mode-geo-location-osm \
    ebtables-filter-multicast \
    ebtables-filter-ra-dhcp \
    ebtables-limit-arp \
    mesh-batman-adv-15 \
    mesh-vpn-fastd \
    radvd \
    respondd \
    status-page \
    web-advanced \
    web-node-role \
    web-wizard \
    web-osm \
    web-autoupdater \
    setup-mode \



GLUON_SITE_PACKAGES := \
	haveged \
	iptables \
	iwinfo

FLASH_4MB := false

ifeq ($(GLUON_TARGET),ar71xx-tiny)
    FLASH_4MB := true
endif
ifeq ($(GLUON_TARGET),ramips-rt305x)
    FLASH_4MB := true
endif

ifeq ($(FLASH_4MB),false)
GLUON_SITE_PACKAGES += \
    respondd-module-airtime
endif

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := 0.7+exp$(shell date '+%Y%m%d')


##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)-multi

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= de en

GLUON_MULTIDOMAIN = 1
