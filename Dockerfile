FROM python:3.11-slim

RUN apt-get update && apt-get install -y npm && \
    npm install -g configurable-http-proxy && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash jupyter

RUN pip install --no-cache-dir jupyterhub jupyterlab

RUN mkdir -p /home/jupyter/notebooks && \
    chown -R jupyter:jupyter /home/jupyter

COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

EXPOSE 8000

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
