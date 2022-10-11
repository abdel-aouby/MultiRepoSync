CWD="$(dirname `pwd`)"
COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_YELLOW='\033[0;33m'
NO_COLOR='\033[0m'

clear

for d in `find $CWD -name ".git" -type d -maxdepth 2`;

do
    cd $d/..
    PROJECT_DIR=`pwd`
    REMOTE_NAME=`git remote`
    DEFAULT_BRANCH=`git remote show ${REMOTE_NAME} | sed -n '/HEAD branch/s/.*: //p'`
    CURRENT_BRANCH=`git branch --show-current`

    if [ "$DEFAULT_BRANCH" == "$CURRENT_BRANCH" ]; then
        echo -e "\n ${COLOR_GREEN} [${DEFAULT_BRANCH}] |==> ${PROJECT_DIR} ${NO_COLOR}"

        if [ "$save_master_answer" == "N" ] || [ "$save_master_answer" == "n" ] || [ -z ${save_master_answer+x} ]; then
            read -p "Do you want to update [${DEFAULT_BRANCH}] [Y/N]: " update_master
            read -p "Do you wish to save the same answer for further repositories with same situation? [Y/N]: " save_master_answer
        fi

        if [ "$update_master" == "Y" ] || [ "$update_master" == "y" ]; then
            git pull
            echo -e "${COLOR_BLUE} Branch [${DEFAULT_BRANCH}] synchronized successfully"
        fi
    else
        echo -e "\n ${COLOR_YELLOW} [${CURRENT_BRANCH}] |==> ${PROJECT_DIR}"

        if [ "$save_no_master_answer" == "N" ] || [ "$save_no_master_answer" == "n" ] || [ -z ${save_no_master_answer+x} ]; then
            echo -e "${COLOR_WHITE}"
            echo -e "This repository is not in [${REMOTE_NAME}] branch!"
            echo -e "Please type a number to continue:"
            echo -e "Type 1 to [git pull] this branch [${CURRENT_BRANCH}]"
            echo -e "Type 2 to checkout and pull ${DEFAULT_BRANCH}"
            echo -e "type 3 to merge last ${DEFAULT_BRANCH} branch into this branch"

            read -p "Enter the answer: " answer
            while [ "$answer" != 1 ] && [ "$answer" != 2 ] && [ "$answer" != 3 ] ; do
              echo -e "Wrong answer !! please try again."
              read -p "Enter the answer: " answer
            done

            read -p "Do you wish to save the same answer for further repositories with same situation? [Y/N]: " save_no_master_answer
        fi

        if [ "$answer" == 1 ]; then
            git pull
        elif [ "$answer" == 2 ]; then
            git checkout ${DEFAULT_BRANCH}
            git pull
        elif [ "$answer" == 3 ]; then
            git fetch ${REMOTE_NAME} ${DEFAULT_BRANCH}:${DEFAULT_BRANCH}
            git fetch ${REMOTE_NAME} ${CURRENT_BRANCH}:${CURRENT_BRANCH}
            git merge ${DEFAULT_BRANCH}
        fi
    fi
done
