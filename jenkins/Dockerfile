FROM jenkinsci/jenkins:2.73.2
USER root
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install apt-transport-https
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update
RUN apt-get install cf-cli
USER jenkins
