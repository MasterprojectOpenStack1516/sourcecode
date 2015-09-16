source "$1"

if ! dpkg -s "curl" >> /dev/null 2>&1
then 
  sudo apt-get -y install "curl" || exit 1
fi


echo "on controller, get token from Keystone (as admin)"
ssh ubuntu@controller "source admin-openrc.sh; openstack token issue" | tee "$TMP_PATH/remote.log"

TOKEN=`grep " id" "$TMP_PATH/remote.log" | cut -s -d "|" -f3 |  tr -d '[[:space:]]'`
echo "TOKEN=$TOKEN" >> "$1"
