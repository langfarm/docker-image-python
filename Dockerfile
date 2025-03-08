FROM --platform=${TARGETPLATFORM:-linux/amd64} langfarm/alinux3:3.9.1

# 安装 python3.11
#RUN yum remove -y python3
#RUN yum install -y python3.11

# install.sh 安装 uv
ARG UV_HOME=/usr/local/uv
RUN mkdir -p ${UV_HOME}/bin
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="${UV_HOME}/bin" sh
RUN chmod +x ${UV_HOME}/bin/uv*
RUN chown -R admin:admin ${UV_HOME}

RUN ln -s ${UV_HOME}/bin/uv /usr/local/bin/uv
RUN ln -s ${UV_HOME}/bin/uvx /usr/local/bin/uvx

# 用 pip 安装 uv
#RUN yum install -y python3.11-pip
#RUN pip3.11 install -i https://mirrors.aliyun.com/pypi/simple/ uv
#RUN yum remove -y python3.11-pip

# 清理 yum cache
#RUN yum clean all

# 使用阿里云的 pypi 源 https://mirrors.aliyun.com/pypi/simple/
COPY uv.toml /etc/uv/uv.toml
COPY pip.conf /etc/pip.conf

# 设置 uv 相关配置
ENV UV_PYTHON_INSTALL_DIR=/usr/local/python
ENV UV_CACHE_DIR=/var/cache/uv

RUN mkdir -p $UV_PYTHON_INSTALL_DIR
RUN mkdir -p $UV_CACHE_DIR

# 安装 python
RUN ${UV_HOME}/bin/uv python install 3.12
RUN ln -s $(uv python find 3.12) /usr/local/bin/python
RUN ln -s $(uv python find 3.12) /usr/local/bin/python3
RUN ln -s $(uv python find 3.12) /usr/local/bin/python3.12

# 设置权限给 admin
RUN chown -R admin:admin $UV_PYTHON_INSTALL_DIR
RUN chown -R admin:admin $UV_CACHE_DIR
