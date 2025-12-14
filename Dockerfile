FROM python:3.11-slim

RUN echo "deb http://ftp.ru.debian.org/debian trixie main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://ftp.ru.debian.org/debian-security trixie-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y npm && \
    npm install -g configurable-http-proxy && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash jupyter

RUN pip install --no-cache-dir jupyterhub jupyterlab

RUN mkdir -p /home/jupyter/notebooks /home/jupyter/data /srv/jupyterhub && \
    chown -R jupyter:jupyter /home/jupyter /srv/jupyterhub

COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
RUN chown jupyter:jupyter /srv/jupyterhub/jupyterhub_config.py

EXPOSE 8000

USER jupyter

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
