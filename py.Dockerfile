FROM python:3.10-alpine3.22

WORKDIR /myapp

COPY ./py/ .

RUN pip3 install -r requirements.txt

CMD ["python3", "/myapp/app.py"]