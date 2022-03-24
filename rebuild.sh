docker manifest create nimmis/ubuntu:14.04 --amend nimmis/ubuntu:14.04-amd64 --amend nimmis/ubuntu:14.04-arm32v7  --amend nimmis/ubuntu:14.04-arm64v8
docker manifest push nimmis/ubuntu:14.04
docker manifest create nimmis/ubuntu:16.04 --amend nimmis/ubuntu:16.04-amd64 --amend nimmis/ubuntu:16.04-arm32v7  --amend nimmis/ubuntu:16.04-arm64v8
docker manifest push nimmis/ubuntu:16.04
docker manifest create nimmis/ubuntu:18.04 --amend nimmis/ubuntu:18.04-amd64 --amend nimmis/ubuntu:18.04-arm32v7  --amend nimmis/ubuntu:18.04-arm64v8
docker manifest push nimmis/ubuntu:18.04
docker manifest create nimmis/ubuntu:20.04 --amend nimmis/ubuntu:20.04-amd64 --amend nimmis/ubuntu:20.04-arm32v7  --amend nimmis/ubuntu:20.04-arm64v8
docker manifest push nimmis/ubuntu:20.04
docker manifest create nimmis/ubuntu:latest --amend nimmis/ubuntu:latest-amd64 --amend nimmis/ubuntu:latest-arm32v7  --amend nimmis/ubuntu:latest-arm64v8
docker manifest push nimmis/ubuntu:latest
