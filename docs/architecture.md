# 架构设计

## 模块划分

shazam包含四个模块，分别是shazam-proxy、shazam-cc、shazam-agent、shazam-web。shazam-proxy为在线代理，负责承接sql流量，shazam-cc是中控模块，负责shazam-proxy的配置管理及一些后台任务，shazam-agent部署在mysql所在的机器上，负责实例创建、管理、回收等工作，shazam-web是一个管理界面，使shazam整体使用更加方便。

## 架构图

![shazam架构图](assets/architecture.png)
