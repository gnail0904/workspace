# Scoop的安装

查看powershell的版本

可通过在PowerShell输入$psversiontable或$host访问相应信息。输入$psversiontable后

```shell
$psversiontable
$host
```

![image-20231119144005420](D:\Learn\workspace\other\scoop.assets\image-20231119144005420.png)





# 安装步骤

```shell
set-executionpolicy remotesigned -scope currentuser 
# 或者 （但是它没有上面的命令安全）
set-executionpolicy Unrestricted -scope currentuser
# 配置环境变量

$env:SCOOP='D:\soft\work\Scoop'
# 先添加用户级别的环境变量 SCOOP
[environment]::setEnvironmentVariable('SCOOP',$env:SCOOP,'User') 
## 下载安装 
# 然后下载安装 Scoop （如果使用默认安装路径则直接运行下面的命令） 
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
# 或者使用下面的命令安装： 
iwr -useb get.scoop.sh | iex 

```



# 常用命令



```shell
scoop help #查看帮助scoop help <某个命令> # 具体查看某个命令的帮助 
scoop install <app>   # 安装 APP
scoop uinstall <app>  # 卸载 APP 
scoop list  # 列出已安装的 APP
scoop search # 搜索 APP
scoop status # 检查哪些软件有更新 
scoop update # 更新 Scoop 自身
scoop update <app1> <app2> # 更新某些app
scoop update *  # 更新所有 app （前提是需要在apps目录下操作） 
scoop bucket known #通过此命令列出已知所有 bucket（软件源）
scoop bucket add bucketName #添加某个 bucket 
scoop cache rm <app> # 移除某个app的缓存 




```

# 安装卸载软件

```shell
# 安装之前，通过 search 搜索 APP, 确定软件名称
scoop search  xxx
# 安装 APP
scoop install <app>
# 安装特定版本的 APP；语法 AppName@[version]，示例
scoop install git@2.23.0.windows.1
# 卸载 APP 
scoop uninstall <app>  #卸载 APP
```





# NVM安装node

```shell
nvm install 19.7.0

```

