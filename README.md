## Python 3 环境

* 基本 alinux3（Alibaba Cloud Linux 3） 版本 3.9
* 包括 uv
* uv 安装 python

## 特性：
- 默认 PyPI 源（/etc/uv/uv.toml, /etc/pip.conf）：
  - 阿里云 PyPI 源 http://mirrors.aliyun.com/pypi/simple/
  - 清华大学 PyPI 源 https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
  - 华中科学大学 PyPI 源 https://mirrors.ustc.edu.cn/pypi/simple
- uv 版本 0.6.12
  - uv 安装到 /usr/local/bin 目录；
  - uv 相关环境变更：
    - UV_PYTHON_INSTALL_DIR=/usr/local/python
    - UV_CACHE_DIR=/var/cache/uv
- 用 uv 来安装 python
  - python 的安装目录为 /usr/local/python 。 生成连接到 /usr/local/bin/python

## 镜像标签
* ```langfarm/python:3.12```, ```langfarm/python:3.12-aliunx3```, ```langfarm/python:3.12.9```, ```langfarm/python:3.12.9-aliunx3```
* ```langfarm/python:3.11```, ```langfarm/python:3.11-aliunx3```, ```langfarm/python:3.11.11```, ```langfarm/python:3.11.11-aliunx3```
