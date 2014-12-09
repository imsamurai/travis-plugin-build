#!/bin/bash

if [ "$PHPDOC" = 1 ]; then
	sudo apt-get -qq update;
	sudo apt-get -qq install graphviz;
fi;

git clone https://github.com/imsamurai/travis.git --depth 1 ../travis;
../travis/before_script.sh;
if [ "$PHPCS" != 1 ]; then
	echo "<?php
		date_default_timezone_set('UTC');
		require_once dirname(dirname(__FILE__)) . '/vendor/autoload.php';
		require_once dirname(dirname(dirname(__FILE__))) . '/lib/Cake/Console/ShellDispatcher.php';
		return ShellDispatcher::run(\$argv);
	" > ../cakephp/app/Console/cake.php;
fi;