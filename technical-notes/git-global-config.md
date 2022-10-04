# Git Global Configurations

```bash
$ git config --global user.name "<your name>"
$ git config --global user.email "<email@example.com>"
$ git config --global core.editor "<an command line editor. ex: vim, emacs, vi...>"
$ git config --global core.editor "code --wait" # if you use vscode
$ git config --global merge.tool meld
```

## Disable SSL verification

```bash
$ git config --global http.sslVerify "false"
```

## Error - Filename too long (Windows)

There are two ways to solve this. Error `Filename too long`.

```bash
$ git config core.longpaths true
```

Or, on `git clone...`

```bash
$ git clone -c core.longpaths=true 
```
