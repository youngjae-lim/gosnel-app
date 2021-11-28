BINARY_NAME=gosnelApp

build:
	@go mod vendor
	@echo "Building Gosnel..."
	@go build -o tmp/${BINARY_NAME} .
	@echo "Gosnel built!"

run: build
	@echo "Starting Gosnel..."
	@./tmp/${BINARY_NAME} &
	@echo "Gosnel started!"

clean:
	@echo "Cleaning..."
	@go clean
	@rm tmp/${BINARY_NAME}
	@echo "Cleaned!"

start_compose:
	docker-compose up -d

stop_compose:
	docker-compose down

test:
	@echo "Testing..."
	@go test ./...
	@echo "Done!"

start: run

stop:
	@echo "Stopping Gosnel..."
	@-pkill -SIGTERM -f "./tmp/${BINARY_NAME}"
	@echo "Stopped Gosnel!"

restart: stop start