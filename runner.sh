#!/bin/sh


# STEP 0
rm -rf gitlab-runner/

# STEP 1:  REGISTER
# RUN - with certs folder, and kick off register, then remove:
docker run -it  --name gitlab-runner --rm   -v $PWD/gitlab-runner/config:/etc/gitlab-runner   -v $PWD/volumes/config/ssl:/etc/gitlab-runner/certs   -v /var/run/docker.sock:/var/run/docker.sock --link=gitlab:gitlab   gitlab/gitlab-runner:latest  register

# STEP 2:  RUN gitlab-runner
# RUN - with certs folder:
docker run -d --name gitlab-runner --restart always   -v $PWD/gitlab-runner/config:/etc/gitlab-runner   -v $PWD/volumes/config/ssl:/etc/gitlab-runner/certs   -v /var/run/docker.sock:/var/run/docker.sock --link=gitlab:gitlab   gitlab/gitlab-runner:latest 

# you're done if you did STEP 1 first!  Optionally, you can do the step of registering AFTER building/running the container.

# STEP 3a (if STEP 1 WAS MISSED)
docker run -it     -v $PWD/gitlab-runner/config:/etc/gitlab-runner   -v $PWD/volumes/config/ssl:/etc/gitlab-runner/certs   -v /var/run/docker.sock:/var/run/docker.sock --link=gitlab:gitlab   gitlab/gitlab-runner:latest  register
# this seems to mount everything and create the config in the desired folder. ( /gitlab-runner/config )
# REMEMBER TO RESTART gitlab-runner if this has been done:

# STEP 3b
docker restart gitlab-runner

