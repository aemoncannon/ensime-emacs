#!/usr/bin/bash

export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sleep 3
touch ensime_test.log
$EMACS --version
$EMACS -d :99 --no-init-file --load .emacs_test.el --eval "(ensime-run-all-tests)" &
tail -f $TRAVIS_BUILD_DIR/ensime_test.log
