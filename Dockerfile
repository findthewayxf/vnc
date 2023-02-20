FROM debian:latest

# 安装必要的软件包和 Chrome 浏览器
RUN apt-get update && apt-get install -y wget gnupg2 ca-certificates && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# 安装 Xvfb 和 x11vnc
RUN apt-get update && \
    apt-get install -y xvfb x11vnc && \
    mkdir ~/.vnc

# 设置 vnc 密码
RUN x11vnc -storepasswd password ~/.vnc/passwd

# 添加启动脚本
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

# 设置环境变量
ENV DISPLAY=:0 \
    VNC_PASSWORD=password

# 启动 Xvfb 和 x11vnc
CMD ["/start.sh"]
