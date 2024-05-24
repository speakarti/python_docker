# BUILD: sudo docker build -t python-docker-image .
# RUN: sudo docker run --rm -d -it --name python-dock python-docker-image python main.py

FROM python:latest
RUN mkdir /data
WORKDIR /data
COPY requirements.txt ./
RUN pip install -r ./requirements.txt
RUN mkdir /my /my/folder
WORKDIR /my/folder
COPY main.py /my/folder
COPY config.yml /data
CMD [ "python", "/my/folder/main.py", "--config", "/data/config.yml"]