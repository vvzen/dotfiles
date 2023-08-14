# Readme

## Shell

Bash. I tried `fish`, and I really liked it.
But it doesn't make too much sense to learn a shell that I can't use for my day-to-day at work.
Plus, `bash` is the default on anything, these days, so it's good to know its ins and outs.


## Terminal emulator

I'm currently evaluating [wezterm](https://wezfurlong.org/wezterm/) both on arch and macOS.
As of 2023-04-29, the arch package was not working (404s), but it was an easy one to
just `cargo build --release` following the install instructions.

## Text editors

I have been using helix editor since its early times.
I love its philosophy and its 'all included' approach, which means I can install it and tweak a few lines in a config and I'm ready to write some code, no matter the platform I'm in.

On the other hand, I have started (since June 2023) to use Doom Emacs and I love it for the opposite reasons: it's good fun to hack around with my config. Plus, it's an excuse to use a bit of LISP in my day to day programming life.

- https://github.com/doomemacs/doomemacs
- https://github.com/helix-editor/helix

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
