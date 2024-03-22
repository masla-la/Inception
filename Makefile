DCK	= 	docker compose -f

BFLAG =	up -d --build
CFLAG = stop
DFLAG =	down -v

DFILE = ./src/docker-compose.yml

EX = docker system prune -af

all:
	$(DCK) $(DFILE) $(BFLAG)

clean:
	$(DCK) $(DFILE) $(CFLAG)

rm-comp:
	$(DCK) $(DFILE) $(DFLAG)

system:
	$(EX)

fclean:
	rm -rf ${HOME}/data/mariadb/*
	rm -rf ${HOME}/data/wordpress/*

.PHONY: all clean rm-comp system fclean
