# 🏯 **Haskell Dojo** 🥷

### **Using with Jambhala Cardano Development Suite**
This repository can be used as an add-on to the [Jambhala Cardano Development Suite](https://github.com/iburzynski/jambhala). This allows aspiring Cardano developers to complete this Haskell course within the same fully pre-configured environment they'll use to learn `cardano-cli` and Plutus afterward.

If you intend to use Jambhala for learning Cardano development...

Follow these steps to get started with Jambhala:
1. Fork this repository. Keep the name `haskell-dojo` as the name/URL slug for your fork: using this name is required for integration with Jambhala.
2. [Install Jambhala](https://github.com/iburzynski/jambhala) by following the instructions in the official README.
3. After completing the installation, navigate to the `jambhala` directory in your terminal and run `jcode` to open Jambhala's integrated VS Codium editor.
4. Open the `.env` file in the Jambhala root directory and add your Github username to the `GITHUB_ID` variable. I.e.:
```shell
GITHUB_ID="iburzynski"
```
5. Enter `refresh` in your terminal session. Your forked `haskell-dojo` should now automatically clone itself into the `jambhala` directory (and will be ignored by `git`). Exit the editor and reopen it in the `haskell-dojo` directory by running `jcode haskell-dojo` (use this same command from the `jambhala` directory in your terminal each time to ensure proper functioning).


### **Using with Gitpod**
This repository contains a preconfigured Gitpod Haskell development environment, allowing you to start coding in Haskell with zero installation using [Gitpod](https://www.gitpod.io/) and a browser-based version of VS Code.

Follow these steps to get started with Gitpod:
1. Fork this repository
2. Copy the link to your new repository and prefix it with "https://gitpod.io/#" in your browser
3. Click `Continue with GitHub` and `Authorize gitpod-io`
4. Wait for the environment to build. This can take a while the first time.
5. Select "VS Code Browser" as your editor.

## **Using the Sandbox**
Haskell Dojo provides a special empty file called `Sandbox.hs` in the `src/` directory.

You can use this file as a scratchpad to: 
1. practice/experiment with writing arbitrary Haskell code
2. test this practice code in GHCi

The provided `sbox` script launches GHCi with the `Sandbox` module open: 

```shell
./sbox
```

You can use this GHCi session to experiment and test simple code directly in the interpreter, or run any code you've saved in `src/Sandbox.hs`.

Use the `:r` (`:reload`) command in GHCi to reload the `Sandbox` contents after making changes.

>**Note:** `Sandbox.hs` is a module of our larger Cabal project, which means we can use it to test functions from libraries our project is using besides the Haskell standard library (`base`), such as `random` and `directory`. This isn't possible in an ordinary GHCi session. However, this also means `Sandbox.hs` must always compile with no errors before we can run any other code inside the project. Correct or comment out any erroneous code in this file as needed to ensure successful compilation.