```shell
docker build -t my-vnc-chrome .

docker run -p 5900:5900 -e VNC_PASSWORD=password my-vnc-chrome
```

