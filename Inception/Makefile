all: 
	mkdir -p /home/lucas/data/mariadb
	mkdir -p /home/lucas/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/lucas/data/mariadb/*
	@sudo rm -rf /home/lucas/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean