# !/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
YELLOW="\033[0;33m"
BOLD='\033[1m'
NC='\033[0m'
WHICH=FAX
FAX_BUILD=$(date +'%y%m%d-%H%M')
FAX_DIR=~/Downloads/BuildFAX/
SCRIPT_DIR=~/Downloads/BuildFAX/Scripts


mkdir $FAX_DIR
mkdir $SCRIPT_DIR

clear

echo -e "${RED}\n\n--------------------------------\n\nImportant\n\nPlease understand that ${PURPLE}FreeAPS X (FAX)${RED}:\n-Is highly experimental\n-Is not approved for therapy\n-You take full responsibility for building and running this system and do so at your own risk.\n\nYou may only proceed if you agree..\n\n--------------------------------\n\n${NC}"
echo -e "Type the number from below and hit enter to proceed."
options=("Agree" "Disagree")
select opt in "${options[@]}"
do
    case $opt in
        "Agree")
            break
            ;;
        "Disagree")
            echo -e "\n${RED}Did not agree to terms of use.${NC}\n\n";
            exit 0
            break
            ;;
        *)
    esac
done

clear

echo -e "\n\n--------------------------------\n\nWelcome to Loop and Learn Scripts.\n\n"
echo -e "This script will assist you in preparing your computer as well as \ndownloading and building ${PURPLE}FreeAPS X (FAX).\n${NC}"
echo -e "This is ${PURPLE}the iPhone implementation of OpenAPS (oref0 / oref1)${NC}, and \nnot a fork or branch of ${GREEN}Loop.${NC}"
echo -e "Before you begin, please ensure that you have Xcode installed and \nyour phone is plugged into your computer\n\n--------------------------------\n\n"
echo -e "Type the number from below and hit enter to proceed."
options=("Build FAX" "Utility Scripts" "Cancel")
select opt in "${options[@]}"
do
    case $opt in
        "Build FAX")
            WHICH=FAX
            break
            ;;
        "Utility Scripts")
            WHICH=UtilityScripts
            break
            ;;
        "Cancel")
            clear
            echo -e "\n${RED}User cancelled!${NC}\n\n⬆️  You can press the up arrow on the keyboard followed by the Enter key to start the script from the beginning.\n\n";
            exit 0
            break
            ;;
        *)
    esac
done

clear

if [ "$WHICH" = "FAX" ]
then

    echo -e "Please select which version of FAX you would like to download and build.\n\nType the number for the branch and hit enter to select the branch.\n${PURPLE}For the latest release of FAX, please select MASTER${NC}. \nType 3 and hit enter to cancel.\n\n"
    options=("MASTER branch" "dev" "Cancel")
    select opt in "${options[@]}"
    do
        case $opt in
            "MASTER branch")
                FOLDERNAME=FAX-Master
                REPO=https://github.com/ivalkou/freeaps
                BRANCH=master
                break
                ;;
                "dev")
                FOLDERNAME=FAX-dev
                REPO=https://github.com/ivalkou/freeaps
                BRANCH=dev
                break
                ;;
            "Cancel")
                clear
                echo -e "\n${RED}User cancelled!${NC}\n\n⬆️  You can press the up arrow on the keyboard followed by the Enter key to start the script from the beginning.\n\n";
                exit 0
                break
                ;;
            *)
        esac
    done

    clear
    FAX_DIR=~/Downloads/BuildFAX/$FOLDERNAME-$FAX_BUILD
    mkdir $FAX_DIR
    cd $FAX_DIR
    pwd
    clear
    echo -e "Downloading FAX to your Downloads folder:"
    echo -e "${YELLOW}${PWD}${NC}"
    echo -e "--------------------------------"
    git clone --branch=$BRANCH $REPO
    cd freeaps
    curl -O https://raw.githubusercontent.com/loopnlearn/loopbuildscripts/main/FAXfiles/ConfigOverride.xcconfig    

    echo -e "--------------------------------\n🛑 Please check for errors listed above before proceeding. If there are no errors listed, code has successfully downloaded.\n"
    echo -e "${NC}Type 1 and hit enter to open Xcode.${NC}"
    echo -e "The Loop and Learn page with further instructions for "
    echo -e "building ${PURPLE}FreeAPS X${NC} will open in your default browser.\n"
    echo -e "You may close the terminal after Xcode opens.\n"

    options=("Open Xcode" "Cancel")
    select opt in "${options[@]}"
    do
        case $opt in
            "Open Xcode")
                open https://www.loopandlearn.org/freeaps-x/#build
                xed ./FreeAPS.xcworkspace
                exit 0
                break
                ;;
            "Cancel")
            clear
                echo -e "\n${RED}User cancelled!${NC}\n\n⬆️  You can press the up arrow on the keyboard followed by the Enter key to start the script from the beginning.\n\n";
                echo -e "FreeAPS X (FAX) has been downloaded to this folder:"
                echo -e "${YELLOW}${PWD}${NC}\n\n"
                exit 0
                break
                ;;
            *)
        esac
    done

else
    cd $FAX_DIR/Scripts
    clear
    echo -e "\n\n--------------------------------\n\nThese scripts will automate several cleanup options for you.\n\n--------------------------------\n\n➡️  Clean Carthage and Derived Data:\nThis script is used to clean up data from old builds from Xcode. Xcode should be closed when running this script.\n\n➡️  Xcode Cleanup (The Big One):\nThis script is used to clean up “stuff” from Xcode. It is typically used after uninstalling Xcode and before installing a new version of Xcode. It can free up a substantial amount of space. Sometimes you might be directed to use this script to resolve a problem, ‼️  beware that you might be required to fully uninstall and reinstall Xcode after running this script.‼️  Usually, Xcode will recover the simulator and other files it needs without needing to be reinstalled.\n\n"
    echo -e "Type the number from below and hit enter to proceed."
    options=("Clean Derived Data" "Xcode Cleanup (The Big One)" "Clean Profiles and Derived Data" "Cancel")
    select opt in "${options[@]}"
    do
        case $opt in
            "Clean Derived Data")
                echo -e "\n\n--------------------------------\n\nDownloading Derived Data Script\n\n--------------------------------\n\n"
                rm ./CleanCartDerived.sh
                curl -fsSLo ./CleanCartDerived.sh https://raw.githubusercontent.com/loopnlearn/LoopBuildScripts/main/CleanCartDerived.sh
                clear
                source ./CleanCartDerived.sh
                break
                ;;
            "Xcode Cleanup (The Big One)")
                echo -e "\n\n--------------------------------\n\nDownloading Xcode Cleanup Script\n\n--------------------------------\n\n"
                rm ./XcodeClean.sh
                curl -fsSLo ./XcodeClean.sh https://raw.githubusercontent.com/loopnlearn/LoopBuildScripts/main/XcodeClean.sh
                clear
                source ./XcodeClean.sh
                break
                ;;
            "Clean Profiles and Derived Data")
                echo -e "\n\n--------------------------------\n\nDownloading Profiles and Derived Data Script\n\n--------------------------------\n\n"
                rm ./CleanProfCartDerived.sh
                curl -fsSLo ./CleanProfCartDerived.sh https://raw.githubusercontent.com/loopnlearn/LoopBuildScripts/main/CleanProfCartDerived.sh
                clear
                source ./CleanProfCartDerived.sh
                break
                ;;
            "Cancel")
                clear
                echo -e "\n${RED}User cancelled!${NC}\n\n⬆️  You can press the up arrow on the keyboard followed by the Enter key to start the script from the beginning.\n\n";
                exit 0
                break
                ;;
            *)
        esac
    done
fi

