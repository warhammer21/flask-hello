FROM python:3
WORKDIR /myproject
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD python hello-flask.py
