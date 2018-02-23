FROM jenkinsci/jenkins:2.108
USER root
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install apt-transport-https
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update
RUN apt-get install cf-cli
RUN apt-get install -y python3-pip
RUN cp /usr/bin/python3 /usr/bin/python
RUN cp /usr/bin/pip3 /usr/bin/pip
RUN pip3 install pipenv
USER jenkins
