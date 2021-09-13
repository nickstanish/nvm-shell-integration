# nvm-shell-integration

Shell integration to automatically change node version when changing directories.
Based on https://github.com/nvm-sh/nvm/tree/0b5bb5ccd875d82e470568b6465d546346e37778#automatically-call-nvm-use but with `.node-version` as well as `.nvmrc`

- [nvm-shell-integration](#nvm-shell-integration)
  - [Install](#install)
    - [bash](#bash)
    - [zsh](#zsh)
  - [Usage](#usage)
  - [Debug](#debug)
  - [System Dependencies](#system-dependencies)

## Install

Clone this repository with git (or download the zip and extract) to the directory of your choice.

### bash

Add this to your `~/.bash_profile`

```
NVM_SHELL_INTEGRATION_PATH=/path/to/nvm-shell-integration
source $NVM_SHELL_INTEGRATION_PATH/nvm-shell-integration.bash
```

### zsh

Add this to your `~/.zshrc`

```
NVM_SHELL_INTEGRATION_PATH=/path/to/nvm-shell-integration
source $NVM_SHELL_INTEGRATION_PATH/nvm-shell-integration.zsh
```

## Usage

Create a `.node-version` in your project directory:

```
v12.13.0
```

Anytime you `cd` into your project, the specified version will be used:

```
$ cd my-project/
$ nvm version
v12.13.0
```

Note: If you specify a version that is not installed on your system, then you will get a message like this:

```
version "12.13.0" is not yet installed.

You need to run "nvm install 12.13.0" to install it before using it.
```

## Debug

Logs to STDERR can be enabled by setting an environment variable `NVM_SHELL_INTEGRATION_LOGGER=1`

## System Dependencies

- Ruby
- NVM
