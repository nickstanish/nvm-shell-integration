# nvm-shell-integration

Based on https://github.com/nvm-sh/nvm/tree/0b5bb5ccd875d82e470568b6465d546346e37778#automatically-call-nvm-use but with `.node-version` instead of `.nvmrc`


## bash
Add this to your `~/.bash_profile`

```
source $NVM_SHELL_INTEGRATION_PATH/nvm-shell-integration.bash
```

## zsh
Add this to your `~/.zshrc`

```
source $NVM_SHELL_INTEGRATION_PATH/nvm-shell-integration.zsh
```
