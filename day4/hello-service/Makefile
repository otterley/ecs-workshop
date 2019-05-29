REPO_URL := $(shell aws cloudformation list-exports --query 'Exports[?Name==`ecsworkshop:HelloServiceRepositoryUrl`].Value' --output text)

upload-image:
	eval "\$$(aws ecr get-login --no-include-email)" && \
		docker build -t ${REPO_URL} . && \
		docker push ${REPO_URL}
