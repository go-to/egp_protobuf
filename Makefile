setup:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
protoc:
	protoc -I src --go_out=./pb --go_opt=paths=source_relative --go-grpc_out=./pb --go-grpc_opt=paths=source_relative ./src/*.proto
clean-branch:
	git switch main
	git branch | grep -v "main" | xargs git branch -d
	git pull
