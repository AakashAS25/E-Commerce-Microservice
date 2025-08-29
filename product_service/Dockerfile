FROM python:3.11-slim

WORKDIR /app

COPY product_service.py /app/

RUN pip install flask

EXPOSE 5001

CMD ["python", "product_service.py"]
