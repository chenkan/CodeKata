#### 预备

1. 在本机安装好maven

#### 导入Eclipse

1. 从命令行进入工程根目录，执行 mvn eclipse:eclipse 将此maven工程转变为Eclipse工程
2. 打开Eclipse，即可import

#### 执行测试

1. 从命令行进入工程根目录，执行 mvn clean test （第一次运行要下载相应Jar文件，会比较慢）
2. 测试结束后，查看生成的 target/surefire-reports/emailable-report.html 文件

#### 其它

1. 不足 Or 问题，联系陈侃（chenkan@corp.netease.com）
