FROM docker.io/python:3.11-alpine

WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt --no-cache-dir --disable-pip-version-check --no-build-isolation

ARG DJANGO_SETTINGS_MODULE
ENV DJANGO_SETTINGS_MODULE ${DJANGO_SETTINGS_MODULE:-server.settings}

# RUN python server/manage.py collectstatic

COPY ./ /app

EXPOSE 8000

WORKDIR /app/server

CMD ["gunicorn", "server.asgi:application", "-c", "conf.d/gunicorn.conf.py"]
