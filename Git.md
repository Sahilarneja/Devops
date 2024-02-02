# Git Overview

Git is a version control system developed to coordinate work among developers. It provides features and benefits that make collaborative software development more efficient.

## Features of Git:

- **Open Source**: Licensed under GPL License.
- **Scalable**: Can handle a large number of users easily.
- **Distributed**: Users can clone repositories on different machines easily.
- **Security**: Utilizes SHA-1 (Secure Hash Algorithm) to name and identify objects, ensuring secure operations.
- **Speed**: Fast operations, especially on the local repository.
- **Branching and Merging**: Supports multiple branches, enabling collaborative work among developers.
- **Staging Area**: Provides a preview of the next commit.

## Benefits of Git:

- **Save Time**: Efficient version control saves time in development.
- **Offline Working**: Allows developers to work offline and sync changes later.
- **Undo Mistakes**: Provides the ability to undo mistakes with version control.
- **Track Changes**: Facilitates tracking changes made by different contributors.

## Git Commands:

- To initialize Git: `$ git init`
- Check status of files: `$ git status`
- Track a file: `$ git add index.html`
- Commit changes: `$ git commit -m "first commit"`
- Add all files: `$ git add -A`
- Undo mistakes: `$ git checkout about.html`
- Track changes in a file: `$ git diff`
- View differences in staged changes: `$ git diff --staged`
- View differences compared to the latest commit (HEAD): `$ git diff Head`
- Check last commit: `$ git show`
- View commit history: `$ git log`
- Delete a file: `$ git rm services.html -f`
- Remove from staging state: `$ git rm --cached services.html`
- List branches: `$ git branch --list`
- Create a new branch: `$ git branch login`
- Switch to another branch: `$ git checkout login`
- Delete a branch: `$ git branch -D login2`
- Merge branches: `$ git merge login`

## Important Terms:

- **Branch**: A repository diverges from the main working directory.
- **Checkout**: Used for switching between different versions of a target environment.
- **Clone**: Make a copy of a repository from a server.
- **Merge**: Combine branches.
- **Origin**: The remote repository from which a project was initially cloned.
- **Pull**: Receive data from the server (GitHub).
- **Push**: Upload the local repository to the server.
- **Git Ignore**: Used to intentionally untrack files.
- **Git Diff**: Shows changes between commits, working tree, etc.
- **Git Rm**: Used for removing files.

## Git Branching:

### How to Create Branches:

1. Verify your branch: `$ git branch`
2. Create and switch to a new branch: `$ git checkout -b division` or `$ git switch -c new_feature`

### Creating and Switching to a Particular Branch:

- `$ git checkout -b new_feature` or `$ git switch -c new_feature`

### Committing to a Branch:

- Initialize: `$ git init`
- Add files: `$ git add .`
- Add remote repository: `$ git remote add origin "repo url"`
- Commit changes: `$ git commit -m "message"`
- Push to remote repository: `$ git push -u origin branch_name`

### Merging One Branch to Another:

1. **Git Merge:**
   ```bash
   git checkout destination_branch
   git merge source_branch

2. **Git Rebase:**
   ```bash
   git checkout source_branch
   git rebase destination_branch

3. **Git Cherry-Pick:**
   ```bash
   git checkout destination_branch
   git cherry-pick <commit-hash>
