# MultiRepoSync
Synchronizing multi repositories project

The script is simple yet useful to keep project based on multi repositories up-to-date to your needs.
the script repository should be placed in the same location as other repositories of your project.

When runing the script, it will loop all the repos in your root directory and offer you the following options.
- If the repository current branch is **default branch (master/main)** it will update or ignore based on your answer. (you could save the same answer to all further repositories of same situation.)
- If the reopository is in another branch than **default branch (master/main)** it will ask you for 3 options (you could save the same answer to all further repositories of same situation.): 
1. Pull last changes on current branch
2. Checkout to **default branch (master/main)** and pull last changes 
3. Pull last changes on **default branch (master/main)** and merge it into current
