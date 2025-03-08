
## Python 3 环境

主要配置：

* 默认 PyPI 源（/etc/uv/uv.toml, /etc/pip.conf）：
    * 阿里云 PyPI 源 http://mirrors.aliyun.com/pypi/simple/
    * 清华大学 PyPI 源 https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
    * 华中科学大学 PyPI 源 https://mirrors.ustc.edu.cn/pypi/simple

主要 python 包版本：

* python 3.12.x
* uv 0.6.x

本地构建命令
```bash
# sh build.sh <tag-version>
# sh build.sh latest
sh build.sh 3.12.9
```
