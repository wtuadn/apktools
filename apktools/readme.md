# apktools
一款apk签名、压缩、修改资源的工具，可用于生成渠道包

### 原理
利用[7z](https://sparanoid.com/lab/7z/)压缩、修改apk，再用apksigner重新签名

### 主要功能
> 用命令sign xxx.apk 对apk签名

> 用命令compress xxx.apk 压缩apk

> 在apktools目录下放一个apk文件，双击add_channel.bat修改apk的资源

> 以上功能可以分开、组合使用

##### 相关配置
配置android sdk环境变量，能用where adb命令找到adb所在路径
<br>
<br>
修改sign.bat里的如下变量

set keyPath=%oPath%key 签名用的密钥的绝对路径（直接复制到apktools目录改名为key，这行就不用管了）
<br>
set alias=alias1 密钥别名
<br>
set storePass=000000 密钥库密码
<br>
set aliasPass=111111 别名密码
<br>
set buildTool=26.0.2 buildTool版本（最好和你工程的一样，并且只支持25及以上）
<br>
<br>
在channels文件夹下，每个渠道一个文件夹，里面放需要替换的资源文件，<br>
路径必须和apk直接解压（不是反编译）后得到的资源路径一致，<br>
比如splash.jpg在工程中是在res\mipmap-xxhdpi里，<br>
而release包解压后splash.jpg在res\mipmap-xxhdpi-v4里，<br>
那么渠道文件夹里的splash.jpg也该放在res\mipmap-xxhdpi-v4里
<br>
<br>
渠道名放在assets\channel 在代码里使用ChannelUtils.getChannel()获取

#### 说明
1. 签名同时采用v1和v2，兼容新旧android版本
1. compress.bat和add_channel.bat依赖于sign.bat，压缩和修改资源和会自动进行签名
1. 修改资源后的apk在apktools\outputs里
1. demo工程生成的app-release.apk已放在apktools目录下，是默认的splash和渠道，<br>
   对其应用相关功能并安装后观察apk的大小、splash和渠道名称的变化
1. 压缩率取决于apk里的文件，可高可低
1. 理论上可以替换可见的任意资源，更多用法请自行探索