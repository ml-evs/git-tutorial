# Introduction to version control

Part II Computational Physics

Matthew Evans
https://github.com/ml-evs/part2-computing-git-tutorial

## What is version control and why should I care?

Put simply, version control (aka revision or source control) is a system that tracks and manages changes to a set of data (e.g. source code). Say you are writing a report; instead of renaming different versions of files `report.tex`, `report_final.tex`, `report_FINAL.tex`, `report_FINALFINAL.tex`, `report_FINAL_abcdef.tex`, ad infinitum, version control systems allow you to save the entire history of a file as a series of staged changes, often called commits (git) or revisions (svn). This may not seem so useful for a linear process such as a single person writing a document, but for the non-linear process of software development, version control is a must. Every single serious software project exists under some form of version control, almost by definition. Learning effective version control techniques is a vital skill, not just careers in the tech industry, but also for producing reproducible code and thus reproducible science.

The aim of this tutorial is to teach basic concepts of version control that you might consider using for the coursework. A few hours of investment, and maybe some moments of confusion, will hopefully lead to a productivity boost. We shall work with the Git (`git`) version control system as, at the time of writing this, it dominates the market, with Subversion (`svn`) and Mercurial (`hg`) lagging behind, as evidenced by e.g. Google trends https://g.co/trends/CECvA.

### What is git?

Git was created by Linus Torvalds in 2005\* to manage the source code of the Linux kernel

\* Linus Torvalds started writing Git on April 3rd, it was then hosting its own source code by April 7th (https://marc.info/?l=git&m=117254154130732), and then was hosting the entire Linux kernel (2.6.12-rc2) by April 16th. Whilst famous for creating Linux, many argue that Git is Linus Torvalds' greatest technical achievement.

`git`, like its forebears `svn` and `hg`, is what is called a distributed version control system. This means that there is no "master copy" of a project, and instead the entire history is mirrored on the computer of every developer (and potentially user). This becomes extremely useful when multiple people are actively developing a project for reasons we shall touch on later.




## What is a repository?

- Git init and the .git folder
- Remote repositories: GitHub, Bitbucket, GitLab.
- Open source

## What is a commit?

- Hashing - first hash collision
- descriptive tag of incremental change.

## Basic usage: single-user repositories

### Setup

### A simple example

### Remote version control

## More advanced usage

### Branching, merging and collaboration

### Test-driven development

## Useful links

- git website: https://git-scm.com/
- The git repository for the git source code: https://github.com/git/git
- Cheatsheet of git commands: https://www.atlassian.com/dam/jcr:8132028b-024f-4b6b-953e-e68fcce0c5fa/atlassian-git-cheatsheet.pdf

- github.com 
- GitHub student developer pack
- bitbucket.com
- gitlab.com


## Subcommand cheatsheet

### `clone`

### `init`

### `add`

### `diff`

### `commit`

### `push`

### `pull`

### `checkout`

### `log`

### `branch`

### `reset`
