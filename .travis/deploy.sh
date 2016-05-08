# copy files from github to cdn
VERSION=$1

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 .travis/deploy_key.pem # this key should have push access
ssh-add .travis/deploy_key.pem

echo "create directory $VERSION"
ssh -p10022 podlove@cdn.podlove.org "mkdir ~/podlove-web-player/$VERSION"

echo 'copy files from travis to CDN'
cd dist
scp -P10022 -r . podlove@cdn.podlove.org:podlove-web-player/$VERSION

echo 'Done'
