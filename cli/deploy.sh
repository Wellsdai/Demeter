# 部署用

buildPath='build'

echo 'make build path'
mkdir $buildPath

cp -r public ${buildPath}

echo 'convert es6 to es5'
# 根目录转换
babel server.js --out-file "${buildPath}/server.js"
babel config.js --out-file "${buildPath}/config.js"

# api目录转换
babel api -d "${buildPath}/api"

# cli目录转换
babel cli -d "${buildPath}/cli"

# models目录转换
babel models -d "${buildPath}/models"

# util目录转换
babel util -d "${buildPath}/util"

# pm2启动项目
pm2 start ${buildPath}/cli/express.js --node-args="--harmony" --name demeter