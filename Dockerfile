FROM python:3.10

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install add tools and kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN apt update \
    && apt install -y apt-transport-https ca-certificates curl rsync \
    && curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    && apt update \
    && apt install -y kubectl

COPY . .

ENTRYPOINT ["/bin/bash", "./bin/entrypoint.sh"]
