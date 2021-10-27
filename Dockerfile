FROM jlesage/baseimage-gui:ubuntu-18.04
USER root
RUN whoami
RUN apt-get update && apt-get install -y wget libnss3 libgtk-3-0 libxss1 libasound2 gnupg2 sudo \
curl git-core nodejs python3 net-tools openssh-client python3-dev python3-pip python3-setuptools \
rsync ruby unzip vim zip
ENV GOPATH=/usr/local/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
RUN curl -O -L "https://golang.org/dl/go1.17.2.linux-amd64.tar.gz"
RUN tar -xf "go1.17.2.linux-amd64.tar.gz" && chown -R root:root ./go
RUN mv -v go /usr/local
RUN mkdir /app 
RUN useradd --shell /bin/bash --home /app --uid 1000  -G users appuser
RUN npm install -g @angular/cli
RUN echo 'root:jr' | chpasswd
RUN echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" >/etc/apt/sources.list.d/vscode.list && \
     wget -q -O - "http://packages.microsoft.com/keys/microsoft.asc" | apt-key add - && \
     apt-get update && apt-get install -y code
RUN whoami
ENV APP_NAME="Visual Studio Code"
RUN echo '%app ALL=(ALL:ALL)ALL' >> /etc/sudoers
ADD startapp.sh /startapp.sh
RUN echo "root:root" | chpasswd
