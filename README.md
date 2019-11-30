# macstatus.sh - Status Line - aa and voilá!

Type macstatus.sh and bash will return a status line like this:


```
[C:192.168.1.1] [L:0.60] [D:57%] [M:150M] [S:Mute] [B:50%] [01.09.2017 15:07]
```
This features:
- C: Network connected to
- L: CPU Load
- D: Disk usage
- M: Memory usage
- S: Sound Level
- B: Battery Level
- Date and time

You can use it with watch to have a "top in line" application:

```
$ watch -n 1 macstatus.sh
```

Or pipe it into other software, like: i3bar on i3wm, gnu/screen and tmux.
