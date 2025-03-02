FROM --platform=${TARGETPLATFORM:-linux/amd64} langfarm/alinux3:3.9.0

# 安装 python3.11
RUN yum remove -y python3
RUN yum install -y python3.11

# install.sh 安装 uv
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="/usr/local/bin" sh
RUN chmod +x /usr/local/bin/uv
RUN chmod +x /usr/local/bin/uvx

# 用 pip 安装 uv
#RUN yum install -y python3.11-pip
#RUN pip3.11 install -i https://mirrors.aliyun.com/pypi/simple/ uv
#RUN yum remove -y python3.11-pip

# 清理 yum cache
RUN yum clean all

# 使用阿里云的 pypi 源 https://mirrors.aliyun.com/pypi/simple/
COPY uv.toml /etc/uv/uv.toml

# 给 admin 权限
RUN chown -R admin:admin /home/admin/
