# MultiRepoSync
Synchronizing multi repositories project

the script is simple yet useful to kee project base on multi repositories up-to-date to you needs.
the script repository should be placed in the same location as othere repositories of your project.

When runin the script, it will look all the repos in you root directory and offer you the following options.
- if the repository is in master branch it will update or ignore based on your answer. (you could save the same answer to all further repositories.)
- if the reopository is in another branch than master it will ask you for 3 option
      - update current branch
      - checkout and update master
      - update master and merge it into current
