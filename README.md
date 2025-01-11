# `git smart-pull`

Tries the following pull strategies in order:

1. **Fast-forward**

   If possible, `git smart-pull` will simply fast-forward.

   ```
   ❯ git smart-pull
   ...
   Updating 89b26d6..7fd8446
   Fast-forward
    example.txt | 2 +-
    1 file changed, 1 insertion(+), 1 deletion(-)
   [smart-pull] Fast-forward pull succeeded.
   ```
2. **Automatic rebase**

   If a fast-forward is not possible and there are no conflicts, `git smart-pull` automatically will rebase.
   ```
   ❯ git smart-pull
   ...
   [smart-pull] Will pull with rebase.
   Switched to branch 'main'
   Your branch and 'origin/main' have diverged,
   and have 1 and 1 different commits each, respectively.
     (use "git pull" if you want to integrate the remote branch with yours)
   Successfully rebased and updated refs/heads/main.
   ```
3. **Resolve conflicts with rebase or merge**

   If there are conflicts, `git smart-pull` will ask you to do a rebase or merge.
   If you choose to `[r]ebase`, it will use `git smart-rebase` (see below).
   ```
   ❯ git smart-pull
   ...
   [smart-pull] Cannot rebase without conflict. Conflicted files:
   [smart-pull] example.txt
   Select pull method: [m]erge / [r]ebase / [q]uit r

   Auto-merging example.txt
   CONFLICT (content): Merge conflict in example.txt
   error: could not apply 5e62eef... My conflicting feature commit
   hint: Resolve all conflicts manually, mark them as resolved with
   hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
   hint: You can instead skip this commit: run "git rebase --skip".
   hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
   hint: Disable this message with "git config advice.mergeConflict false"
   Could not apply 5e62eef... My conflicting feature commit

   ❯ ... fix conflicts ...

   ❯ git add -u example.txt
   ❯ git rebase --continue


# `git smart-rebase`

Offers to squash commits before rebasing.

```
❯ git smart-rebase main
Rebasing my-feature onto main
Commits to be rebased:
5e583a0 (HEAD -> my-feature) Another conflicting feature commit
20cef54 My conflicting feature commit
Do you want to squash the commits before rebasing? [s]quash / [i]nteractive rebase / [n]o / [q]uit
```

# git smart-push

If a normal push is rejected, offers to either:

- Use `git smart-pull`, then push again.
- Use `git push --force-with-lease`.
- Use `git push --force`.
