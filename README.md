# 🏯 **Haskell Dojo** 🥷

## **Setup**
The Haskell Dojo can be set up in several ways, depending on your learning goals:
1. [With Jambhala Cardano Development Suite](#with-jambhala-cardano-development-suite) -- *recommended for Cardano developers*
2. [With Gitpod](#with-gitpod) (cloud-based browser editing) -- *recommended for sampling Haskell*
3. [With a local Haskell installation](#with-a-local-haskell-installation) (GHCup) -- *recommended for non-Cardano developers learning Haskell long-term*

### **With Jambhala Cardano Development Suite**
This repository can be used as an add-on to the [Jambhala Cardano Development Suite](https://github.com/iburzynski/jambhala). This allows aspiring Cardano developers to complete this Haskell course within the same fully pre-configured environment they'll use to learn `cardano-cli` and Plutus afterward.

If you intend to use Jambhala for learning Cardano development, follow these steps to get started with Haskell Dojo in Jambhala:
1. Fork this repository.
    >**Note:** keep the name `haskell-dojo` as the name/URL slug for your fork: using this name is required for integration with Jambhala.
2. [Install Jambhala](https://github.com/iburzynski/jambhala) by following the instructions in the official README.
3. After completing the installation, navigate to the `jambhala` directory in your terminal and run `jcode` to open Jambhala's integrated VS Codium editor:
```shell
cd jambhala
jcode
```
4. Open the `.env` file in the Jambhala root directory and add your Github username to the `GITHUB_ID` variable. I.e.:
```shell
# jambhala/.env

GITHUB_ID="iburzynski"
```
5. Enter `refresh` in your terminal session. Your forked `haskell-dojo` should now automatically clone itself into the `jambhala` directory (and will be ignored by `git`). Exit the editor and reopen it in the `haskell-dojo` directory by running `jcode haskell-dojo` (use this same command from the `jambhala` directory in your terminal each time to ensure proper functioning).

### **With Gitpod**
This repository contains a preconfigured Gitpod Haskell development environment, allowing you to start coding in Haskell with zero installation using [Gitpod](https://www.gitpod.io/) and a browser-based version of VS Code.

If you're looking to dive into Haskell quickly and aren't ready to commit to a local installation, follow these steps to get started with Gitpod:
1. Fork this repository
2. Copy the link to your new repository and prefix it with "https://gitpod.io/#" in your browser
3. Click `Continue with GitHub` and `Authorize gitpod-io`
4. Wait for the environment to build. This can take a while the first time.
5. Select "VS Code Browser" as your editor.

>**Note:** you may need to enable additional permissions to allow GitPod to push changes to your forked repository.
>1. Go to https://gitpod.io (login with your GitHub account if not already logged in)
>2. Click your user avatar image in the top right and select `User Settings` from the dropdown menu.
>3. Select `Git Providers` from the left menu, find `GitHub` and click the three dots to the right, then `Edit Permissions`.
>4. Check the box next to `public_repo` and click `Update Permissions`.
>You should now be able to push committed changes to your repository from the GitPod VS Code editor.

### **With a Local Haskell Installation**
This repository can also be used with a local Haskell toolchain installation through [GHCup](https://www.haskell.org/ghcup/) and either VS Codium or VS Code. This method may not be ideal for new Haskellers, as correct configuration to get Haskell to work properly in VS Code can be tricky and delay the process of actually learning Haskell. Having a system-wide Haskell installation can also occasionally cause conflicts with Haskell Nix development environments, such as used by Jambhala. For these reasons it is recommended to use the Jambhala suite (if you're learning Haskell for Cardano development) or Gitpod instead.

>If you do choose to install Haskell globally on your machine, be sure to do so using [GHCup](https://www.haskell.org/ghcup/), which is the canonical installation method for Haskell at the time of writing, and has good synergy with VS Codium/Code. Follow the official installation process at the link above.

If you have Haskell installed locally and don't intend to use Jambhala later, the Haskell Dojo code should compile and run with `cabal` for most versions of GHC. After forking and cloning Haskell Dojo on your system, navigate to the directory in your terminal and run `cabal run` to compile and run the program.

**For IDE support in VS Codium/Code:**
* You must have Haskell Language Server installed. If you didn't choose to install this when you installed GHCup, you can do so in the `ghcup tui` interface.
* You must have the Haskell VS Code extension installed. 
    >**Note:** this should be installed after GHCUp to prevent duplicate Haskell binaries being created on your system, which can break functionality in VS Codium/Code.

## **Completing the Course**
Complete the 8 assignments in the `assignments` directory sequentially, filling in the required Haskell code in the designated `.hs` file mentioned at the top of each markdown file.

>Try opening the markdown files on Github for better viewing. Alternatively you can right-click the markdown files and click `Open preview` to view them in your VS Codium/Code editor (then open a split window).

>**Note:** be sure to stage, commit, and push the changes you make to your fork (using the `Source Control` tab in VS Codium/Code, or a source control method of your choice). **If you are using Gitpod** this is especially important, as any changes you make will be lost when you close your browser session unless they are pushed to your fork!

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