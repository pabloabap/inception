# Build Docker images using docker-compose.yml

all: container

container: preprocess
	@bash -c 'cd srcs && docker compose up -d';

preprocess:
	@mkdir -p ${HOME}/data/db ${HOME}/data/web;
	@bash ./scripts/ssl_generator.sh && ./scripts/credentials_generator.sh;

clean:
	@cd srcs && docker compose down || true;	

fclean: clean
	@docker run --rm -v "${HOME}/data":"/to_delete:rw" mariadb:inception sh -c "rm -rf /to_delete/*" || true;
	@cd srcs && docker compose down --rmi all --volumes || true;	
	@rm -rf ./secrets/ssl.* ${HOME}/data;

re:
	- make fclean
	make all

.PHONY: all clean fclean re
