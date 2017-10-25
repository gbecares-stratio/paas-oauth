#!/bin/bash -e

. bin/commons.sh

if [ -d "$GOPATH" ]; then
    echo "Uploading to Nexus..."
	curl -u stratio:${NEXUSPASS} --upload-file $GOPATH/bin/dcos-oauth http://sodio.stratio.com/repository/paas/ansible/dcos-oauth-${VERSION}
	echo "Finished uploading to Nexus."
else
    echo "Target file not available, please run 'make compile' first"
    exit 1
fi

### Awful workaround because of GO
if [ -f "/home/jenkins/.ssh/config" ]; then
    chmod 600 /home/jenkins/.ssh/config
    chown jenkins /home/jenkins/.ssh/config
fi
