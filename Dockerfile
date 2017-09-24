FROM ubuntu:17.04

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

RUN apt-get update && apt-get install -y wget apt-utils
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

# RUN wget https://ftp.mozilla.org/pub/firefox/releases/46.0/linux-x86_64/en-US/firefox-46.0.tar.bz2
# RUN wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2
# RUN wget https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_46.0-0ubuntu1_amd64.deb/download

RUN apt-get update && apt-get install -y xvfb wget google-chrome-stable dbus-x11 packagekit-gtk3-module libcanberra-gtk-module default-jdk

COPY hosts /tmp/
RUN cat /tmp/hosts >> /etc/hosts

RUN apt-get install -y telnet
RUN service dbus start

RUN chmod -R 777 /var/run/dbus && \
    chmod -R 777 /run/dbus

RUN ln -s /run /var/run && \
    ln -s /run/lock /var/lock

RUN chmod 777 /run/dbus/pid && \
    chmod 777 /run/dbus/system_bus_socket && \
    chmod 777 /var/run/dbus/pid && \
    chmod 777 /var/run/dbus/system_bus_socket

RUN echo '#!/bin/sh' > /home/developer/start.sh && \
    echo 'cat /tmp/hosts >> /etc/hosts' >> /home/developer/start.sh && \
    echo '/usr/bin/google-chrome ---lxc-conf --cap-add=CAP_SYS_ADMIN' >> /home/developer/start.sh && \
    chmod +x /home/developer/start.sh

RUN apt-get remove -y firefox && \
    apt-get purge -y firefox

RUN mkdir /selenium
COPY selenium /selenium/

RUN mkdir /firefox
COPY firefox /firefox/

RUN dpkg -i /firefox/firefox-mozilla-build_46.0-0ubuntu1_amd64.deb
# RUN /usr/bin/firefox -install-global-extension /selenium/selenium_builder-3.1.3-fx.xpi

RUN apt-get install -y ruby rubygems ruby-dev build-essential

RUN gem install selenium-webdriver -v 2.53.4
RUN gem install faker

RUN ln -s /firefox/geckodriver /usr/sbin/geckodriver

USER developer
ENV HOME /home/developer

# CMD /usr/bin/google-chrome --cap-add=CAP_SYS_ADMIN

