all:
	@go build
	@docker build -t daaku/goruntime-example .
	@docker run -it --rm daaku/goruntime-example
