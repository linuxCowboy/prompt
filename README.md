# prompt
I want my *bash prompt* to include:
 - **history** number (apply with !number)
 - number of background **jobs**
 - **host**name
 - working **dir**ectory
 - **exit** status of last command (only if != 0: "Rule of Silence")
 - git **branch** (only if in git tree)
 - git **dirty** status (I:index M:modified U:untracked)
 - effective **UID**

![Screenshot](screenshot.jpg?raw=true)
**bash** prompt with _exit status_ and _git branch_

**Test:**

```source bash_prompt```

**Install:**

```cat bash_prompt >> ~/.bashrc```
