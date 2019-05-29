BUCKET_NAME := $(shell aws cloudformation list-exports --query 'Exports[?Name==`ecsworkshop:S3Bucket`].Value' --output text)
REPO_URL := $(shell aws cloudformation list-exports --query 'Exports[?Name==`ecsworkshop:ForwarderTaskRepositoryUrl`].Value' --output text)

upload-image:
	eval "\$$(aws ecr get-login --no-include-email)" && \
		docker build -t ${REPO_URL} . && \
		docker push ${REPO_URL}

.PHONY: upload-message
upload-message:
	  aws s3 cp hello.txt s3://${BUCKET_NAME}/hello.txt
