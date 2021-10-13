FROM acaranta/docker-vscode:latest
RUN apt update
RUN apt install -y nodejs git-all
RUN npm install -g @angular/cli