FROM alpine:3.17.3

ENV CROND_SCHEDULE '* * * * *'
ENV DYNUDDNS_HOSTNAME ''
ENV DYNUDDNS_ALIAS ''
ENV DYNUDDNS_LOCATION ''
ENV DYNUDDNS_USERNAME ''
ENV DYNUDDNS_PASSWORD_SHA256 ''

RUN echo -en "#!/bin/sh\nwget -q -O - \"http://api.dynu.com/nic/update?hostname=\$DYNUDDNS_HOSTNAME&alias=\$DYNUDDNS_ALIAS&username=\$DYNUDDNS_USERNAME&password=\$DYNUDDNS_PASSWORD_SHA256\"" > /opt/dynu.sh \
    && chmod +x /opt/dynu.sh \
    && echo "\$CROND_SCHEDULE /opt/dynu.sh" > /etc/crontabs/root

CMD sed -i "s/\$CROND_SCHEDULE/$CROND_SCHEDULE/g" /etc/crontabs/root \
    && sed -i "s/\$DYNUDDNS_HOSTNAME/$DYNUDDNS_HOSTNAME/g" /opt/dynu.sh \
    && sed -i "s/\$DYNUDDNS_ALIAS/$DYNUDDNS_ALIAS/g" /opt/dynu.sh \
    && sed -i "s/\$DYNUDDNS_LOCATION/$DYNUDDNS_LOCATION/g" /opt/dynu.sh \
    && sed -i "s/\$DYNUDDNS_USERNAME/$DYNUDDNS_USERNAME/g" /opt/dynu.sh \
    && sed -i "s/\$DYNUDDNS_PASSWORD_SHA256/$DYNUDDNS_PASSWORD_SHA256/g" /opt/dynu.sh \
    && crond -f -L /dev/stdout