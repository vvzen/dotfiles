# Readme

## Shell

Bash. I tried `fish`, and I really liked it.
But it doesn't make too much sense to learn a shell that I can't use for my day-to-day at work.
Plus, `bash` is the default on anything, these days, so it's good to know its ins and outs.


## Terminal emulator

I'm currently evaluating [wezterm](https://wezfurlong.org/wezterm/) both on arch and macOS.
As of 2023-04-29, the arch package was not working (404s), but it was an easy one to
just `cargo build --release` following the install instructions.


## Generic utils

### bat

`cat` with superpowers: https://github.com/sharkdp/bat

```bash
$ sudo pacman -S bat
```

## Git

I use [git-delta](https://github.com/dandavison/delta) for most of my diffs.

```bash
$ sudo pacman -S git-delta
```
