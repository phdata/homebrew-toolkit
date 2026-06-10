# phData Homebrew Tap

Homebrew is a package manager for macOS (or Linux), go to https://brew.sh to learn more.
In additional to the official repository, Homebrew allows you to add third-party repositories. 
Tap repositories like this one provide additional packages.
Go to https://docs.brew.sh/Taps for more details.

## Installation

Tap the phData Homebrew repository to install the [Toolkit CLI](https://toolkit.phdata.io).

```shell
brew tap phdata/toolkit
```
Install the Toolkit CLI

```shell
brew install toolkit-cli
```
Install a specific version

```shell
brew install toolkit-cli@0.93.0
```
Upgrade to the latest version

```shell
brew update && brew upgrade toolkit-cli
```

>[!NOTE]
>Use Homebrew to upgrade instead of `toolkit admin upgrade`.
