# macstatus.sh - Status Line for MacOS

Type macstatus.sh and bash will return a status line like this:

```
[C:192.168.1.101] [L:2.132] [D:79%] [M:1253M] [S:100%] [B:42%] [30.11.2019 00:29]
```
This features:
- C: Network connected to
- L: CPU Load
- D: Disk usage
- M: Memory usage
- S: Sound Level
- B: Battery Level
- Date and time

You can use it with watch and have a "top in line" application:

```
$ watch -n 1 macstatus.sh
```

Or pipe it into other software, like: i3bar on i3wm, gnu/screen and tmux.
