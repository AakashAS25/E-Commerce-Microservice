FROM python:3.11-slim

WORKDIR /app

COPY order_service.py /app/

RUN pip install flask

EXPOSE 5002

CMD ["python", "order_service.py"]
