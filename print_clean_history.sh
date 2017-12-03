#!/bin/zsh -i
echo "===================BASH SECTION==================="
cat ~/.bash_history| grep -v 'git\|Telegram\|hist\|vim\|inkscape\|cd\|ls\|curl\|wget'
echo "====================ZSH SECTION==================="
cat ~/.zsh_history| grep -v 'git\|Telegram\|hist\|vim\|inkscape\|cd\|ls\|curl\|wget'
