FROM python:3.6.2-stretch
MAINTAINER Kieran Wardle <kieran.wardle@ons.gov.uk>
COPY ras-party/ /home/
WORKDIR /home
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "run.py"]

