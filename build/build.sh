cd /home/docker_server_helloworld

sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
MIR=https://pypi.tuna.tsinghua.edu.cn/simple

apt-get clean
apt-get update
apt-get -y upgrade

apt-get install -y python3.9
apt-get install -y python3-distutils
python3.9 ./build/get-pip.py -i $MIR

ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

pip install virtualenv -i $MIR
virtualenv /home/venv
source /home/venv/bin/activate
pip install --upgrade pip -i $MIR
pip install -r ./build/requirements.txt -i $MIR

apt-get install -y supervisor
apt-get install -y nginx
apt-get install -y netbase