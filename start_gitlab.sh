#docker run --hostname gitlab.example.com \
docker run --detach \
	--hostname gitlab.docker.local \
	--name gitlab \
	--restart always \
	--env GITLAB_OMNIBUS_CONFIG="external_url 'https://gitlab.docker.local/'; gitlab_rails['lfs_enabled'] = true; gitlab_rails['smtp_enable'] = false; gitlab_rails['gitlab_shell_ssh_port'] = 2222;" \
	--publish 443:443 --publish 80:80 --publish 2222:22 \
	--volume $PWD/volumes/config:/etc/gitlab \
	--volume $PWD/volumes/logs:/var/log/gitlab \
	--volume $PWD/volumes/data:/var/opt/gitlab \
	gitlab/gitlab-ce:latest 



#	--env GITLAB_OMNIBUS_CONFIG="external_url 'https://gitlab.docker.local/'; gitlab_rails['lfs_enabled'] = true;" \
#	--env GITLAB_OMNIBUS_CONFIG="external_url 'https://gitlab.docker.local/'; gitlab_rails['lfs_enabled'] = true; gitlab_rails['smtp_enable'] = false; gitlab_rails['gitlab_shell_ssh_port'] = 2222;" \



#Resolving SSL Self-Signed Certificate Errors
#  https://confluence.atlassian.com/bitbucketserverkb/resolving-ssl-self-signed-certificate-errors-806029899.html
#
# GIT_SSL_NO_VERIFY=true git clone https://username@git.example.com/scm/repository.git

# SSH - alternate port:
# git clone ssh://git@gitlab.docker.local:2222/mdledoux/docker_recipe_demo.git



# Import by URL:
# https://github.com/mdledoux/docker_recipe_demo

# DOES NOT WORK:
# Satis repo on code:
# git clone --bare git://code.sr.unh.edu/composer/satis.git

