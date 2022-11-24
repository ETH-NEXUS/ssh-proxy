build:
	@docker build --no-cache . -t ethnexus/ssh-proxy
docker: build
	@docker push ethnexus/ssh-proxy