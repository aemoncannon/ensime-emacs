#!/usr/bin/bash

export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sleep 3
mkdir ~/.emacs.d
mkdir ~/.emacs.d/ensime-servers
mkdir ~/.emacs.d/ensime-servers/${ENSIME_TEST_SERVER_VERSION}
touch ensime_test.log
$EMACS --version
echo "Updating server:"
$EMACS --batch --no-init-file --load .emacs_test.el --eval "(ensime-get-or-download-server \"${ENSIME_TEST_SERVER_VERSION}\")"
sleep 2
echo "Starting tests:"
$EMACS -d :99 --no-init-file --load .emacs_test.el --eval "(ensime-run-all-tests)" &
tail -f ensime_test.log
