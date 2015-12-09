#!/bin/bash

function error {
    echo -e "\e[31m$1\e[0m" 
}  
function ok {
    echo -e "\e[32m$1\e[0m"
}

function checkevar {
    J=$1
    if [ ! -z "${!J}" -a "${!J}" != " " ]; then
        ok "$1 is set to ${!J}" 
    else 
        error "'$1' is NOT set"; 
    fi
}
function isinstalled {
   APP=$1
   if [ ! -z "$APP" -a "$APP" != " " ]; then
        ok "$APP is installed"
    else
        error "'$APP' is NOT installed";
   fi
}


checkevar JAVA_HOME 
checkevar JAVA8_HOME
checkevar JAVA7_HOME
checkevar ANDROID_HOME
GIT_VER=`git --version`
isinstalled "$GIT_VER"
JRE_VER=`java -version 2>&1 | head -n 1`
isinstalled "$JRE_VER"
isinstalled "`javac -version 2>&1`"

