all:
	@docker build -t goruntime-builder .
	@docker run goruntime-builder | docker import - daaku/goruntime
