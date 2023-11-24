# Local DEV Environments

## Overview

This is a collection of Dockefiles for local development containers and a compose file for the definition of your dev containers. 

## Using this repo

## prepare system

clone repo somewhere on your local machine. Create a symlink to the script like this: 

(for mac in this case, check docs for linux/windows)
```
chmod +x _scripts/start.sh
ln -s _scripts/start.sh /usr/bin/startenv
```


## attach to dev environment

You can attach to the developement containers with the start.sh script: 

```
startenv boilerplate
```
