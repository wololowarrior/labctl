GIT_COMMIT=$(shell git rev-parse --verify HEAD)
UTC_NOW=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

build-dev:
	go build \
		-ldflags="-X 'main.version=dev' -X 'main.commit=${GIT_COMMIT}' -X 'main.date=${UTC_NOW}'" \
		-o labctl

release:
	goreleaser --clean

release-snapshot:
	goreleaser release --snapshot --clean

test-e2e:
	go test -v -count 1 ./e2e/exec
