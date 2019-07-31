FROM python:3.6
RUN apt-get update \
    && apt-get install -y --no-install-recommends 

WORKDIR /app

RUN mkdir -p ~/.pip
COPY . .

RUN cp /app/pip.conf ~/.pip/pip.conf

RUN pip3 install -r requirements.txt


EXPOSE 8991

CMD ["python", "manage.py", "runserver", "0.0.0.0:8991"]
