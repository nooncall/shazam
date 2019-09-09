# 快速入门

## 编译安装

shazam基于go开发，基于go modules进行版本管理，并依赖goyacc、gofmt等工具。

* go >= 1.11

```bash
# 如果你已配置GOPATH，同时GO11MODULE设置为auto，请克隆shazam到GOPATH外的目录
git clone git@github.com:nooncall/shazam.git

# 如果拉取依赖速度慢，可以配置GOPROXY
# export GOPROXY=https://athens.azurefd.net

# 编译二进制包
cd shazam && make
```

## 执行

编译之后在bin目录会有shazam-proxy、shazam-cc两个可执行文件。etc目录下为配置文件，如果想快速体验shazam proxy的功能，可以采用file配置方式，然后在etc/file/namespace下添加对应租户的json文件，该目录下目前有两个示例，可以直接修改使用。
./bin/shazam-proxy --help显示如下，其中-config是指定配置文件位置，默认为./etc/shazam_proxy.ini，具体配置见[配置说明](configuration.md)。

```bash
Usage of ./bin/shazam-proxy:
  -config string
    shazam proxy config file (default "etc/shazam_proxy.ini")
```
