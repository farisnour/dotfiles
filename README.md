# My Dotfiles

## Initial Setup for tmux

Install tpm tmux plugin manager

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

If you add a plugin to `~/.tmux.conf` hit `prefix + I` to fetch and source the new plugin.

## Initial Setup For RHEL 9

Download and install neovim: https://neovim.io/doc/install/

```shell
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

If `findmnt /home` shows `noexec` RHEL may not allow execution from /opt/ so copy
the binary to /usr/local/bin.

```shell
sudo cp /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
sudo chmod 755 /usr/local/bin/nvim
```
