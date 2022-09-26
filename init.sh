if [ !/home/init.txt ]
then
	@sudo mkdir -p /home/swang/data/wordpress
	@sudo mkdir -p /home/swnag/data/database
	@sudo chmod 777 /etc/hosts
	@sudo echo "127.0.0.1 swang.42.fr" >> /etc/hosts
	@sudo echo "127.0.0.1 www.swang.42.fr" >> /etc/hosts
	@sudo echo "make /home/swang/* directory && host domain setting finished" >> /home/init.txt
fi