FROM python:3.10

RUN mkdir /app

ENV PYTHONDNTWRITEBYTECODE=1
ENV PYTHONBUFFERED=1

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8001", "new_todo.wsgi:application",  "--workers=3"]
