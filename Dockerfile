#Base image
FROM ubuntu
LABEL version="latest" maintainer="Sharath <sharathsharu123kp@gmail.com>"

#update the image
RUN apt-get update

#install python
RUN apt install -y python3.8
RUN apt install -y python3-pip

#install robotframework and seleniumlibrary
RUN pip3 install robotframework
RUN pip3 install robotframework-seleniumlibrary

#The followig are needed for Chrome and Chromedriver installation
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y xvfb
RUN apt-get install -y zip
RUN apt-get install -y wget
RUN apt-get install ca-certificates
RUN apt-get install -y libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN apt-get -y update
RUN apt-get install -y libcurl4
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get -y install libgbm1
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN apt-get -f install
RUN wget -N http://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN cp /chromedriver /usr/local/bin
RUN rm chromedriver_linux64.zip

#Robot Specific
RUN mkdir /robot
RUN mkdir /results
ENTRYPOINT ["robot"]
