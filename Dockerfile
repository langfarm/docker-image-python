FROM --platform=${TARGETPLATFORM:-linux/amd64} langfarm/alinux3:3.9.2

# 使用阿里云的 pypi 源 https://mirrors.aliyun.com/pypi/simple/
COPY uv.toml /etc/uv/uv.toml
COPY pip.conf /etc/pip.conf

# 设置 uv 相关配置
ENV UV_PYTHON_INSTALL_DIR=/usr/local/python
ENV UV_CACHE_DIR=/var/cache/uv

# 创建 uv 相关目录
# 直接 root 用户，uv 环境变量也生效
RUN mkdir -p $UV_PYTHON_INSTALL_DIR \
    && mkdir -p $UV_CACHE_DIR \
    && echo "export UV_PYTHON_INSTALL_DIR=$UV_PYTHON_INSTALL_DIR" >> /root/.bashrc \
    && echo "export UV_CACHE_DIR=$UV_CACHE_DIR" >> /root/.bashrc

# install.sh 安装 uv
ARG UV_HOME=/usr/local

ARG PYTHON_VERSION
ENV PYTHON_VERSION=${PYTHON_VERSION:-3.12}
ENV PYTHON_SHOT_VERSION=${PYTHON_VERSION%.*}

# 安装 python
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="${UV_HOME}/bin" sh \
    && ${UV_HOME}/bin/uv python install ${PYTHON_VERSION} \
    && ln -s $(uv python find ${PYTHON_VERSION}) /usr/local/bin/python \
    && ln -s $(uv python find ${PYTHON_VERSION}) /usr/local/bin/python3 \
    && ln -s $(uv python find ${PYTHON_VERSION}) /usr/local/bin/python${PYTHON_SHOT_VERSION}
