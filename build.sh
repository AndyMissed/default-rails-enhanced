#!/bin/bash
# change the value of NMLC to reference your own nmlc installation
NMLC="python3 $HOME/.local/bin/nmlc"
./clean.sh
mkdir wannaroo-rails
$NMLC -c -p DEFAULT --clear-orphaned wannaroo-rails.pnml
if [ $? -eq 0 ]
then
    cp wannaroo-rails.grf wannaroo-rails
    cp README.md wannaroo-rails/readme.txt
    cp LICENSE wannaroo-rails/license.txt
    cp changelog.txt wannaroo-rails
    tar cvf wannaroo-rails.tar wannaroo-rails
    cp -i wannaroo-rails.tar $HOME/.openttd/newgrf
    echo -e "\e[92m*** build successful ***"
else
    echo -e "\e[91m*** nmlc could not build newgrf ***"
fi
echo "NML:"
echo "---------------"
$NMLC --version

