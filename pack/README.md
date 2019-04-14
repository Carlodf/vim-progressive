# Manage plug ins

All plug ins are set as git submodules.

## To add a plug in

```
git submodule add https://github.com/tuthor/foo.git pack/bundle/start/foo
git commit -m "Add plug in foo"
```

After adding the plug in open vim to generate help documentation

```
vim
:Helptags ALL
```

## Remove a plug in

```
git submodule deinit pack/bundle/start/foo
git rm -r pack/bundle/start/foo
rm -r .git/modules/pack/bundle/start/foo
```

## Update a plug in

```
cd ~/.vim/pack/bundle/start/foo
git pull origin master
```
In case of any update:

```
git commit -am "Update plug in foo"
```

To update all plug ins at once

```
cd ~/.vim
git submodule foreach git pull origin master
```

And again in case of any updates

```
git commit -am "Update all plug ins"
```
