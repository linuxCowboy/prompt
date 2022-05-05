# prompt
I want my *bash prompt* to include:
 - **history** number (apply with !number)
 - number of background **jobs**
 - **host**name
 - working **dir**ectory
 - **exit** status of last command (only if != 0: "Rule of Silence")
 - git **head** (only if in git tree)
 - git **dirty** status (I:index M:modified U:untracked)
 - effective **UID**

![Screenshot](screenshot.png?raw=true)  
**bash** prompt with _exit status_ and _git head_

**Test:**

```source bash_prompt.sh```

**Install:**

```cat bash_prompt.sh >> ~/.bashrc```

