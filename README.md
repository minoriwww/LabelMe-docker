# 0 Intro

>Here you will find the source code to install the LabelMe annotation tool on your server. LabelMe is an annotation tool writen in Javascript for online image labeling. The advantage with respect to traditional image annotation tools is that you can access the tool from anywhere and people can help you to annotate your images without having to install or copy a large dataset onto their computers. [LabelMe](https://github.com/CSAILVision/LabelMeAnnotationTool)


# 1 Build
```
git clone https://github.com/minoriwww/LabelMe-docker.git
docker build - < Dockerfile
```

# or Run by DockerCloud
```
docker rm -f labelme # if you have one image named labelme

docker pull leodp/labelme

docker run --name labelme -p 8081:80 -v DIR:/notebooks -it leodp/labelme /bin/bash -C /notebooks/auto_conf.sh
# DIR is your path to this repo, end with repo's name
```

# 2 See URL
http://127.0.0.1:8081

# If error occured
```
sudo sh /notebooks/auto_conf.sh
```
