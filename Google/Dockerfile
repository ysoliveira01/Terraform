FROM python:3.9-slim

WORKDIR /app

COPY filter_script.py . 
COPY requeriments.txt .

RUN pip install -r requeriments.txt

ENV SLACK_TOKEN=xoxb-6776156708533-6811437788000-NVXWG0mIGbKL2NTjv72tAlWe

EXPOSE 8080

CMD ["python", "filter_script.py"]
