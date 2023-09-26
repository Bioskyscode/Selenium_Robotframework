FROM ubuntu:latest

ENV SRCDIR="/5G-Simone-Tests"
ENV CHROME_VERSION=114.0.5735.90-1
ENV CHROMEDRIVER_VERSION=116.0.5845.96
WORKDIR $SRCDIR

MAINTAINER Abiodun Ajibade

# Update apt-get and install pip
#RUN echo "Updating apt-get and installing Python ..." \
RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y python3-pip 
    

# Install Python and Robotframework packages
 
RUN echo "Installing Robotframework packages ..."   && \
    pip3 install robotframework && \
    pip3 install selenium==4.11.2  && \
    pip3 install robotframework-autorecorder    && \
    pip3 install robotframework-seleniumlibrary && \
    pip3 install Selenium-Screenshot && \
    pip3 install robotframework-datadriver && \
    pip3 install robotframework-faker && \ 
    pip3 install robotframework-pabot && \
    pip3 install robotframework-requests

# Install chrome browser 

RUN apt-get install -y curl && \
    apt-get install -y xvfb && \
    apt-get install -y zip && \
    apt-get install -y wget && \
    apt-get install -y jq && \
    apt-get install -y ca-certificates && \
    apt-get install -y libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation libgbm1 && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb

# Install latest chromedriver
RUN CHROMEDRIVER_URL=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json | jq -r '.channels.Stable.downloads.chromedriver[] | select(.platform == "linux64") | .url') \
    && curl -sSLf --retry 3 --output /tmp/chromedriver-linux64.zip "$CHROMEDRIVER_URL" \
    && unzip -o /tmp/chromedriver-linux64.zip -d /tmp \
    && rm -rf /tmp/chromedriver-linux64.zip \
    && mv -f /tmp/chromedriver-linux64/chromedriver "/usr/local/bin/chromedriver" \
    && chmod +x "/usr/local/bin/chromedriver"