FROM	debian:bullseye


RUN		apt update -y && apt upgrade -y && apt install -y \
			wget

RUN		wget https://github.com/google/cadvisor/releases/download/v0.40.0/cadvisor \
			&& chmod +x cadvisor


CMD		["./cadvisor"]
