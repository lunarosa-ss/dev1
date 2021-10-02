#!/bin/sh
LANG=C

TARGET=/var/www/virtual_host/dev1
chown apache:apache $TARGET
chmod 2755 $TARGET

# Deploy 時のタイムスタンプが UTC になってしまう
# touch コマンドに TZ を指定しても挙動に変化はなかったため
# この方式は不採用
#find $TARGET -type f -exec TZ=Asia/Tokyo touch {} \;

cat <<-EOF > /var/www/virtual_host/DeployENV_dev1.txt
	------------------------------------------------------------
	Deploy 中に認識している環境変数
	------------------------------------------------------------
	APPLICATION_NAME      : $APPLICATION_NAME
	DEPLOYMENT_ID         : $DEPLOYMENT_ID
	DEPLOYMENT_GROUP_NAME : $DEPLOYMENT_GROUP_NAME
	DEPLOYMENT_GROUP_ID   : $DEPLOYMENT_GROUP_ID
	LIFECYCLE_EVENT       : $LIFECYCLE_EVENT
EOF

