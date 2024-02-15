tag=$(date +'%Y%m%d-%H%M%S')

docker images | grep -E "^fifilyu/ubuntu1804   ${tag}"

if [ $? -eq 0 ]; then
    echo "[错误] 指定的Docker镜像tag已经存在：${tag}"
    exit 1
fi

echo "[信息] 构建Docker镜像：fifilyu/ubuntu1804:${tag}"
docker buildx build -t fifilyu/ubuntu1804:${tag} -t fifilyu/ubuntu1804:latest .
