.PHONY:	 all fclean

all:
		@sudo docker-compose -f srcs/docker-compose.yml up --build -d

fclean:	
		@sudo docker-compose -f srcs/docker-compose.yml down
		@docker system prune -af --volumes
		@sudo rm -rf /home/swang/data

re: fclean all