#!/bin/bash
# change the value of NMLC to reference your own nmlc installation
NMLC="python3 $HOME/.local/bin/nmlc"
./clean.sh
mkdir default-rails-enhanced
$NMLC -c -p DEFAULT --clear-orphaned default-rails-enhanced.pnml
if [ $? -eq 0 ]
then
    cp default-rails-enhanced.grf default-rails-enhanced
    cp README.md default-rails-enhanced/readme.txt
    cp LICENSE default-rails-enhanced/license.txt
    cp changelog.txt default-rails-enhanced
    tar cvf default-rails-enhanced.tar default-rails-enhanced
    cp -i default-rails-enhanced.tar $HOME/.openttd/newgrf
    echo -e "\e[92m*** build successful ***"
else
    echo -e "\e[91m*** nmlc could not build newgrf ***"
fi
echo "NML:"
echo "---------------"
$NMLC --version

