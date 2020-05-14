[![LICENSE](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/nooncall/shazam/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/nooncall/shazam.svg?branch=master)](https://travis-ci.org/nooncall/shazam)
[![Go Report Card](https://goreportcard.com/badge/github.com/nooncall/shazam)](https://goreportcard.com/report/github.com/nooncall/shazam)

## 简介

**shazam ([ʃə'zæm], 沙赞)是一款兼容MySQL协议的数据库中间件, 其前身是[Gaea](https://github.com/XiaoMi/Gaea).**

## 功能列表

### 基础功能

- 多租户
- SQL透明转发
- 注解路由
- SQL统计 (SQL指纹, 慢SQL日志等)
- 读写分离，从库负载均衡
- 自定义SQL拦截与过滤
- 连接池
- 配置热加载
- IP/IP段白名单
- 全局序列号

### 分库、分表功能

- 分库: 支持mycat分库方式
- 分表: 支持kingshard分表方式
- 聚合函数: 支持max、min、sum、count、group by、order by等
- join: 支持分片表和全局表的join、支持多个分片表但是路由规则相同的join

## 安装使用

- [快速入门](docs/quickstart.md)
- [配置说明](docs/configuration.md)
- [基本概念](docs/concepts.md)
- [SQL兼容性](docs/compatibility.md)
- [FAQ](docs/faq.md)

## 设计与实现

- [整体架构](docs/architecture.md)
- [多租户的设计与实现](docs/multi-tenant.md)
- [配置热加载设计与实现](docs/config-reloading.md)
- [后端连接池的设计与实现](docs/connection-pool.md)
- [prepare的设计与实现](docs/prepare.md)

## 社区

### 钉钉
![Dingtalk](docs/assets/shazam_dingtalk.png)

### gitter
[![Gitter](https://badges.gitter.im/nooncall/shazam.svg)](https://gitter.im/nooncall/shazam)

