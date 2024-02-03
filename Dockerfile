# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim
#FROM jupyter/scipy-notebook

EXPOSE 5000
# Keeps Python from generating .pyc files in the container
#ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
#ENV PYTHONUNBUFFERED=1
#RUN pip install virtualenv

# Install pip requirements
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

#WORKDIR /app
COPY code_model_training ./code_model_training
COPY data ./data
COPY ms ./ms
COPY app.py ./app.py
COPY model ./model

RUN python3 code_model_training/train.py



# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
