#/bin/bash

# Check rancid.types.base
if [ ! -f /home/rancid/etc/rancid.types.base ]; then
    cp /root/rancid-3.1/etc/rancid.types.base /home/rancid/etc/rancid.types.base
fi

# Check rancid.conf
if [ ! -f /home/rancid/etc/rancid.conf ]; then
    cp /root/rancid-3.1/etc/rancid.conf.sample /home/rancid/etc/rancid.conf
fi

# Check lg.conf
if [ ! -f /home/rancid/etc/lg.conf ]; then
    cp /root/rancid-3.1/etc/lg.conf.sample /home/rancid/etc/lg.conf
fi

# Check .cloginrc
if [ ! -f /home/rancid/etc/cloginrc ]; then
    cp /root/rancid-3.1/cloginrc.sample /home/rancid/etc/cloginrc \
        && cp /home/rancid/etc/cloginrc /home/rancid/.cloginrc \
        && chmod 0640 /home/rancid/.cloginrc \
        && chmod 0640 /home/rancid/etc/cloginrc
else
    cp /home/rancid/etc/cloginrc /home/rancid/.cloginrc \
        && chmod 0640 /home/rancid/.cloginrc
fi
chown rancid:netadm -R /home/rancid/var/
chown rancid:netadm -R /home/rancid/etc/
chown rancid:netadm /home/rancid/.cloginrc
#su rancid -c /bin/bash -l
su rancid -c /home/rancid/bin/rancid-run
