#!/bin/bash

tmux new -s main -d
tmux rename-window -t main notes
tmux send-keys -t main 'nvim' C-m

tmux new-window -t main
tmux rename-window -t main code
tmux send-keys -t main 'nvim .' C-m ':vsplit' C-m ':split' C-m

tmux new-window -t main
tmux rename-window -t main term
tmux split-window -h
tmux split-window -h

tmux select-pane -t 0

tmux attach -t main

