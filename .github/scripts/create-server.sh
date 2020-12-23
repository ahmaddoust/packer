echo "PWD is $PWD"

# move back to root directory where code is downloaded under /github/workspace
# currently we are in /github/workspace/.github/scripts
cd ../../ 

ls

echo 'Installing server'
PACKER_LOG=1 packer build -var-file=settings.json ./ami.json
