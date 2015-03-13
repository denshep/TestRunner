#!/bin/bash
#============================================
GITHUB_ACCOUNT=denshep
WS_DIR=Workspace
REPO_NAME=Title_Validation_E2E
APP_VERSION=1.1
MAIN_CLASS=Selenium
ARGS_01=
#============================================
if ! which java >/dev/null 2>&1 ; then echo Java not installed; return; fi
	if ! which mvn >/dev/null 2>&1 ; then echo Maven not installed; return; fi
		if ! which git >/dev/null 2>&1 ; then echo Git not installed; return; fi
			
			if [ -d "$HOME/$WS_DIR" ]; then cd ~/$WS_DIR; else echo $WS_DIR directory does not exist; return; fi
				if [ -d "$HOME/$WS_DIR/$REPO_NAME" ]; then rm -rf $HOME/$WS_DIR/$REPO_NAME; fi
					git clone https://github.com/$GITHUB_ACCOUNT/$REPO_NAME.git
					
					cd ./$REPO_NAME
					
					mvn clean site test -Dtest=AllTests -Dbuild.version=$APP_VERSION
					echo "Executing java program . . ."
					java -jar $HOME/$WS_DIR/$REPO_NAME/target/$REPO_NAME-$APP_VERSION-jar-with-dependencies.jar $ARGS_01
