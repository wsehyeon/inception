.PHONY:	 all fclean

all:
		@sudo mkdir -p /home/swang/data/wordpress
		@sudo mkdir -p /home/swang/data/database
		@sudo docker-compose -f srcs/docker-compose.yml up --build -d

fclean:	
		@sudo docker-compose -f srcs/docker-compose.yml down
		@docker system prune -af
		@docker volume rm $$(docker volume ls -q)
		@sudo rm -rf /home/swang/data

re: fclean all
