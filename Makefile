name = inception

all:
	@printf "Lauching configuration ${name}...\n"
	@mkdir -p ~/data/db ~/data/wp
	@docker-compose -f srcs/docker-compose.yml build
	@docker-compose -f srcs/docker-compose.yml up -d
#	@docker-compose -f srcs/docker-compose.yml logs -f

down:
	@printf "Shutting down configuration ${name}...\n"
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

fclean: clean
	@printf "Total clean of all docker configurations\n"
	@docker system prune --all --force --volumes

re:	fclean all

PHOMY: all down clean fclean re
