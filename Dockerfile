FROM python:3.10-slim

ENV PYTHONBUFFERED True

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN pip install -r requirements.txt

EXPOSE 5000

CMD exec gunicorn --bind :5000 --workers 1 --threads 8 --timeout 0 app:app