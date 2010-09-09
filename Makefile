BRANCH_NAME=$(shell git branch | awk '/^\*/ {print $$2}')


# GIT typical workflow:
# 1. get fresh contents from master
# on error message you have to commit your changes locally
# by "git ci" before pull
up:
	git pull origin +$(BRANCH_NAME)

sync:
	-git pull origin +$(BRANCH_NAME)
	git push origin $(BRANCH_NAME)

# 2. make some changes, inspect changeset
di:
	git diff HEAD

# 3. commit locally then push changesets on server
# (note: additional pull to use fresh HEAD before commit)
ci:
	git pull origin +$(BRANCH_NAME)
	git commit -a
	git push origin $(BRANCH_NAME)

# create local branch & switch
bcreate:
	@git branch
	git checkout -b test;

# switch to existing local branch
sb:
	@git branch
	@read -p "name of existing branch to switch to [a-z_0-9]+: "\
      	branch_name;\
        git checkout test;

