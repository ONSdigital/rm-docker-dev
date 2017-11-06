FROM python:3.6.2-stretch
MAINTAINER Kieran Wardle <kieran.wardle@ons.gov.uk>
COPY ras-collection-instrument/ /home/
COPY config.sh /home/
WORKDIR /home
RUN pip install -r requirements.txt
RUN ./config.sh
RUN ONS_ENV=development
CMD ["./scripts/run.sh"]

