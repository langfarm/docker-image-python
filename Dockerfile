FROM --platform=${TARGETPLATFORM:-linux/amd64} langfarm/alinux3:3.9

# 使用阿里云的 pypi 源 https://mirrors.aliyun.com/pypi/simple/
COPY uv.toml /etc/uv/uv.toml
COPY pip.conf /etc/pip.conf

# 设置 uv 相关配置
ENV UV_PYTHON_INSTALL_DIR=/usr/local/python

# python 版本
ARG PYTHON_VERSION
ENV PYTHON_VERSION=${PYTHON_VERSION:-3.12.9}
ENV PYTHON_SHORT_VERSION=${PYTHON_VERSION%.*}

# install.sh 安装 uv
ENV UV_HOME=/usr/local
# 合并一起安装
#RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="${UV_HOME}/bin" sh

# install.sh 安装 uv
# 安装 python
# 创建 uv 相关目录
# 直接 root 用户，uv 环境变量也生效
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="${UV_HOME}/bin" sh \
    && ${UV_HOME}/bin/uv python install ${PYTHON_VERSION} \
    && ln -s $(uv python find ${PYTHON_VERSION}) /usr/local/bin/python \
    && ln -s $(uv python find ${PYTHON_VERSION}) /usr/local/bin/python3 \
    && ln -s $(uv python find ${PYTHON_VERSION}) /usr/local/bin/python${PYTHON_SHORT_VERSION}
