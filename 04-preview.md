In this section, we setup automatic preview environments on every pull request using wing cloud

## Instructions

### Setup your Repo in Github

1. Clean up create-react-app `.git` and `.gitignore` to main project
```
rm -rvf client/.git client/.gitignore
```
2. Add the `.gitignore` to root project path, with the following content:
```
.DS_Store
backend/target
node_modules
client/public/wing.js
 ```
3. Initialize a git repo, add the files & folders and commit:
```
git init
git add ./
git commit -m init -a 
```
4. Login to github, create a new empty repository called `wing-react-workshop`
5. Push your local repo to github (notice that you should use your username and not `ekeren`:
```
git remote add origin git@github.com:ekeren/wing-react-workshop.git
git branch -M main
git push -u origin main
```

   
### Connect The Repo with Wing.Cloud

1. Add the `backend/wing.sh` with the following to your repo:
```
#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"

cd "$DIR"/../client
npm install
```
2. Commit and push to main
```
git add backend/wing.sh
git commit -m "adding wing install helper" backend/wing.sh
git push -u origin main
```
4. Go to [production.wingcloud.io](https://production.wingcloud.io/)
5. Log in with your Github credentials
6. Click on the `+ Add` button --> Connect an existing repository
7. Give Permissions to your Github repository
8. Wait for Main to finish building succefully 
9. Open a pull requst with some change to the API returned value (e.g. `body: "Hello from the API PR"` instead of `body: "Hello from the API"`)
10. Wait for PR comment to be updated to status deployed and visit the ReactApp endpoint and the Console 

🚀 You have setup automatic preview environment on every PR 🤯 🚀
