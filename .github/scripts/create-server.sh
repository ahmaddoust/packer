echo "PWD is $PWD"

# move back to root directory where code is downloaded under /github/workspace
# currently we are in /github/workspace/.github/scripts
cd ../../ 

echo "GITHUB REF IF $GITHUB_REF"

ENVIRONMENT="${GITHUB_REF#ref/heads/}"

if [[ $ENVIRONMENT != "qa" && $ENVIRONMENT != "uat" && $ENVIRONMENT != "master" ]]; then
  ENVIRONMENT="develop"
fi


if [[ $ENVIRONMENT == "master" ]]; then
  ENVIRONMENT="prod"
fi


echo "env is $ENVIRONMENT"


echo "PWD is $PWD"
ls 

echo 'Installing server'
PACKER_LOG=1 packer build -var "MY_ENV=$ENVIRONMENT"  -var-file=settings.json ./ami.json 
