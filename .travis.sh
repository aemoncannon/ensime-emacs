#!/usr/bin/bash

export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sleep 3
mkdir ~/.emacs.d
mkdir ~/.emacs.d/ensime-servers
mkdir ~/.emacs.d/ensime-servers/${ENSIME_TEST_SERVER_VERSION}
touch ensime_test.log
$EMACS --version
$EMACS --batch --no-init-file --load .emacs_test.el --eval '(ensime-update-server "${ENSIME_TEST_SERVER_VERSION}")'
$EMACS -d :99 --no-init-file --load .emacs_test.el --eval '(ensime-run-all-tests)' &
tail -f ensime_test.log
