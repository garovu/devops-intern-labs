# syntax=docker/dockerfile:1.4
FROM python:3.10-alpine

WORKDIR /src
COPY requirements.txt /src
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]