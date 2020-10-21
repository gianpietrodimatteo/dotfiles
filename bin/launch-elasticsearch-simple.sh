#!/bin/bash

# Run elastic stack
tmux new-session -d -n elasticsearch "/opt/elasticsearch-7.9.1/bin/elasticsearch"
tmux split-window -h "/opt/kibana-7.9.1-darwin-x86_64/bin/kibana"
tmux split-window -f "/opt/logstash-7.9.1/bin/logstash -f
/opt/logstash-7.9.1/logstash-simple.conf"
tmux -2 attach-session -d

