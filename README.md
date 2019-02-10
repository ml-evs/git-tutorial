  - [Introduction](#introduction)
      - [What is version control and why should I
        care?](#what-is-version-control-and-why-should-i-care)
      - [What is Git?](#what-is-git)
      - [What is a repository?](#what-is-a-repository)
      - [What is a commit?](#what-is-a-commit)
  - [Worked examples](#worked-examples)
      - [Setup](#setup)
      - [Example 1.1: a contrived local
        repository](#example-1.1-a-contrived-local-repository)
      - [Example 1.2: Remote version
        control](#example-1.2-remote-version-control)
  - [More advanced usage](#more-advanced-usage)
      - [Branching, merging and
        collaboration](#branching-merging-and-collaboration)
      - [Test-driven development](#test-driven-development)
  - [Appendices](#appendices)
      - [Basic subcommand cheatsheet](#basic-subcommand-cheatsheet)
      - [Useful links](#useful-links)

license (i.e. do what you want with this material). Any
queries/corrections can be raised as issues/pull requests on GitHub.
Learning effective version control is a vital skill, not just for
careers in the tech industry, but also for producing sustainable
software and thus reproducible science.
e.g. [Google trends](https://g.co/trends/CECvA).
TODO: Add paragraph about git’s internal data structure

A commit (a.k.a. revision, changeset) is a set of file modifications
grouped under the same user-provided descriptive comment and a
randomly-generated hash, providing a snapshot in time of the entire
repository. Here are some practical questions you might be asking about
commits:

  - How often should I commit?
      - The changes to code that you commit can be as fine or
        coarse-grained as necessary, depending on personal preference.
      - When writing a new code, the first commit might not occur until
  - What makes a good commit message?
      - Simply a short description of the changes made. For example,
        good messages include “fixed typo in example.cpp”, “added
        diffraction plotting function”, “got ODE solver working” and
        “attempted second example”, but “fixed example”, “added
        function”, “code now working” and “end of first practical” are
        less good. If you want to write a long description, write a
        short description as the first line, then use new lines to add
        detail.
  - Can I edit previous commits?
  - Can I undo a commit?

## Worked examples

You may find these examples easier to follow online, where text can be
copied more easily:
<https://www.github.com/ml-evs/part2-computing-git-tutorial>.
    $ git --version
    git version 2.20.1
    $ git config --global user.name "<your_name_here>"
    $ git config --global user.email "<your_email_here>"
#### Example 1.1: a contrived local repository
    memory…

    $ echo "Call me Moby. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the water part of the world." >> moby.txt
    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
      moby.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    $ git add moby.txt
    $ git status
    On branch master
    
    No commits yet
    
    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)
    
      new file:   moby.txt
    $ git commit
    quit.

    $ echo "The morning was so damp and misty that it was only with great difficulty that the day succeeded in breaking." >> moby.txt
    $ git diff
    diff --git a/moby.txt b/moby.txt
    index c256b41..6a234d6 100644
    --- a/moby.txt
    +++ b/moby.txt
    @@ -1 +1,2 @@
     Call me Moby. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the water part of the world.
    +The morning was so damp and misty that it was only with great difficulty that the day succeeded in breaking.
    directly:
    $ git commit moby.txt -m 'Added another sentence of Moby Dick from memory'
    $ git log
    commit 3efacaf57c09387c701110d73f354286e3d4e669 (HEAD -> master)
    Author: Matthew Evans <me388@cam.ac.uk>
    Date:   Mon Jan 28 21:13:15 2019 +0000
    
        Added another sentence of Moby Dick from memory
    
    commit 81ec9e18c39dc6919146fcb9677a11a31d76719d
    Author: Matthew Evans <me388@cam.ac.uk>
    Date:   Mon Jan 28 21:12:40 2019 +0000
    
        Added first sentences of Moby Dick
    $ sed -i 's/Moby/Ishmael/g' moby.txt
    $ git diff
    diff --git a/moby.txt b/moby.txt
    index 6a234d6..e966d0d 100644
    --- a/moby.txt
    +++ b/moby.txt
    @@ -1,2 +1,2 @@
    -Call me Moby. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the water part of the world.
    +Call me Ishmael. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the water part of the world.
     The morning was so damp and misty that it was only with great difficulty that the day succeeded in breaking.
    $ git mv moby.txt idiot.txt
    $ sed '1s/.*/Towards the end of November, during a thaw, at nine o' clock one morning, a train on the Warsaw and Petersburg railway was approaching the latter city at full speed.' idiot.txt
    $ git commit idiot.txt -m 'Fixed mistake where I wrote out Moby Dick instead of The Idiot, like The Idiot I am'
suitable, that impresses everyone.
    $ git commit --amend
    $ git log
    commit a0e8df557279270a9fa686c0ef7a44e347c189ce (HEAD -> master)
    Author: Matthew Evans <me388@cam.ac.uk>
    Date:   Mon Jan 28 21:40:41 2019 +0000
    
        Fixed subtle bug in Linux kernel (I am very smart) that caused Moby Dick to be written to file instead of The Idiot
    
    commit e2b7ad72976d4c00ab6d0214ab41d3c13869c2dd
    Author: Matthew Evans <me388@cam.ac.uk>
    Date:   Mon Jan 28 21:32:41 2019 +0000
    
        Fixed name in first sentence of Moby Dick
    
    commit 92b27f011520c0ae99261203bb12b4fa4b11bbf4
    Author: Matthew Evans <me388@cam.ac.uk>
    Date:   Mon Jan 28 21:11:58 2019 +0000
    
        Added another sentence of Moby Dick from memory
    
    commit 473e3ad8df6fd2b6602a71bb1d764d7e4898b1ef
    Author: Matthew Evans <me388@cam.ac.uk>
    Date:   Mon Jan 28 21:11:23 2019 +0000
    
        Added first sentences of Moby Dick
    
    $ git diff 473e3a
    diff --git a/idiot.txt b/idiot.txt
    new file mode 100644
    index 0000000..9925ab9
    --- /dev/null
    +++ b/idiot.txt
    @@ -0,0 +1,2 @@
    +Towards the end of November, during a thaw, at nine o clock one morning, a train on the Warsaw and Petersburg railway was approaching the latter city at full speed.
    +The morning was so damp and misty that it was only with great difficulty that the day succeeded in breaking.
    diff --git a/moby.txt b/moby.txt
    deleted file mode 100644
    index c256b41..0000000
    --- a/moby.txt
    +++ /dev/null
    @@ -1 +0,0 @@
    -Call me Moby. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the water part of the world.
#### Example 1.2: Remote version control

Our aim is now to take a repository to the cloud. For this, you will
need an account with your favourite cloud VCS, for example GitHub,
Bitbucket or GitLab. For the sake of this example, I will follow the
live demo from the lecture and make a repository for my solutions to the
exercises on GitHub.

Every provider should have a simple interface for creating a new
repository, which we can give any name we want. GitHub tells me that
`part2-computing-exercises` is a fine name, we can select whether we
want to the repository to be private or public, and then we can decide
whether we want to select a license for the code
<sup href='#license'>\[6\]</sup>. After creating the remote repository,
we will be provided with a url and some instructions on how to set up
our local copy; this example will expand those instructions below.

Now, on our local machine, we navigate to the top-level folder that we
want to track with version control, which in my case, has
sub-directories for each exercise.

    $ ls 
    exercise1  exercise2  exercise3a  exercise3b

We now simply execute `git init` to initialise the local Git repository.

    $ git init
    Initialized empty Git repository in /home/matthew/documents/teaching/part_II/computing/part2-computing-exercises/.git/

You should see that the directory `.git` has been made (it will be
hidden) which contains all of the objects Git uses to track your files.

    $ ls .git
    branches  config  description  HEAD  hooks  info  objects  refs

A call of `git status` will tell us that we are on the master branch,
have no commits, and some untracked files. In order to begin tracking
files in the `exercise1/` folder, we “stage” them for comitting using
`git add`:

    $ git add exercise1
    $ git status
    $ git status
    On branch master
    
    No commits yet
    
    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)
    
        new file:   exercise1/README.md
        new file:   exercise1/cornu.pdf
        new file:   exercise1/diffraction_D_0.3m.pdf
        new file:   exercise1/diffraction_D_0.5m.pdf
        new file:   exercise1/diffraction_D_1.0m.pdf
        new file:   exercise1/sine_nd_mc.pdf
        new file:   exercise1/supp_task2.py
        new file:   exercise1/task1.py
        new file:   exercise1/task2.py

The files are now ready to be commited, and a simple `git commit` will
bring up the editor for us to enter our commit message.

> Notice how only the core source files/outputs are included in the
> repository. You don’t want to add “cruft” to your repository, such as
> `__pycache__/` folders or `*.pyc` files. To ignore these
> automatically, you can create a file called `.gitignore` that contains
> the above strings on separate lines to ignore them forever.

We should now tell our local Git repository where it’s remote server is.
As stated in the GitHub instructions, we do this using the following
command:

    $ git remote add origin https://github.com/ml-evs/part2-computing-exercises.git

Finally, we can now push our first commit to GitHub’s servers.

    $ git push -u origin master
Coming soon…?

Remove a file from disk, and from any further Git tracking (the deletion
of the file will need to be commited). The history of the file will
remain under version control, as well as all previous versions.
#### Omissions (non-exhaustive)

Here are some extra Git subcommands that you will eventually find a use
for in more complex projects.

  - `branch`
  - `merge`
  - `reset`
  - `revert`
  - `reflog`
  - `bisect`
  - `rebase`
  - `tag`

  - List of GUIs for Git on the [Git
    website](https://git-scm.com/downloads/guis).
  - For open source projects, [how to choose a software
    license](https://choosealicense.com/).
  - The [Journal of Open Source Software (JOSS)](https://joss.theoj.org)
    takes submissions as git repositories and uses GitHub’s issue
    tracker for the [review
    process](https://github.com/openjournals/joss-reviews).
<!-- end list -->
3.  \~14,500 people posted on the Linux kernel mailing list between 1995

6.  This will put the text of a particular legally-binding code license
    in the main folder of our repository. See
    [choosealicense.com](https://choosealicense.com) for tips as to
    which license is most suitable for you.