FROM gitpod/workspace-base

# Install dependencies
RUN sudo apt-get install -y build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5

# Install GHCUp
ENV BOOTSTRAP_HASKELL_GHC_VERSION=8.10.7
ENV BOOTSTRAP_HASKELL_INSTALL_HLS=1
ENV BOOTSTRAP_HASKELL_ADJUST_BASHRC=1

RUN sudo curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

ENV PATH=${PATH}:${HOME}/.ghcup/bin