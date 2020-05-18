FROM python:3.7

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

RUN pip install -r requirements.txt

EXPOSE 8080
CMD ["python", "app.py"]
