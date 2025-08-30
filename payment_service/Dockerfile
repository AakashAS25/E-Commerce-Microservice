FROM python:3.11-slim

WORKDIR /app

COPY payment_service.py /app/

RUN pip install flask

EXPOSE 5003

CMD ["python", "payment_service.py"]
