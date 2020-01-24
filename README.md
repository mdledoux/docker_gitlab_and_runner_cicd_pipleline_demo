# CI/CD Pipeline with Docker and Gitlab
## This uses a containerized Gitlab server and a containerized gitlab-runner

This demo is based on: https://blog.logrocket.com/how-to-auto-deploy-a-vue-application-using-gitlab-ci-cd-on-ubuntu/

## Run the following:

This first command starts gitlab.  Wait a bit until it comes up.
```
./start_gitlab.sh
```
followed by this second two stage command (register, then run) \
This will run "gitlab-runner register" via docker, and then run/start the container:
```
./runner.sh
```
Really difficult!\
Follow the directions in the demo for making a Docker recipe for your app.  In their case they create a Vue.js app - but it wouldn't take much alteration to deploy any NodeJS-based app built with ```npm install``` and ```npm run build``` - it appears that the same recipe even would work, as long as the packages in and source code in your repo is different.

Put that Dockerfile recipe into your app's source repository, add a .gitlab-ci.yml, and this should work!
