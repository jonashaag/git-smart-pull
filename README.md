# `git smart-pull`

Automatically use rebase pulls when possible, and fall back to merge pulls when necessary.

`smart-pull` tries the following pull strategies in order:

1. Fast-forward
   ```
   ❯ git smart-pull
   [smart-pull] Attempting fast-forward pull
   Updating 9eb3fbb..0dacec5
   Fast-forward
    klaus/contrib/app_args.py | 11 ++++++++++-
    setup.py                  | 13 -------------
    2 files changed, 10 insertions(+), 14 deletions(-)
   [smart-pull] Fast-forward pull succeeded.
   ```
2. Rebase, if there are no conflicts
   ```
   ❯ git smart-pull
   [smart-pull] Attempting fast-forward pull
   [smart-pull] Fast-forward pull failed.
   [smart-pull] Checking if we can rebase without conflict.
   [smart-pull] Can rebase without conflict.
   [smart-pull] Will pull with rebase.
   Switched to branch 'master'
   Your branch and 'origin/master' have diverged,
   and have 1 and 1 different commits each, respectively.
     (use "git pull" if you want to integrate the remote branch with yours)
   Successfully rebased and updated refs/heads/master.
   ```
3. Rebase or merge, if there are any conflicts
   ```
   ❯ git smart-pull
   [smart-pull] Attempting fast-forward pull
   [smart-pull] Fast-forward pull failed.
   [smart-pull] Checking if we can rebase without conflict.
   [smart-pull] Cannot rebase without conflict. Conflicted files:
   [smart-pull] CHANGELOG.rst
   Select pull method: [m]erge / [r]ebase / [n]one
   ```
