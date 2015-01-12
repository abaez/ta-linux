# ta-linux
## [Textadept](http://foicica.com/textadept/) Linux module/lexer for kernel development/patch by [@a_baez](https://twitter.com/a_baez)

### DESCRIPTION
The module was built with the idea to be able to make patches and check them as
quickly as possible for Linux kernel contributing. It doesn't do anything
too fancy. The modules uses the [checkpatch.pl](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl)
script for checking if a patch is written correctly. It also builds a
`Makefile` if one doesn't exist near the source of the file being written for
checking.

The lexer is really only an alias to the `ansi_c` lexer.

#### Completed:
*   lexer: straight alias to `ansi_c` lexer. Cannot get easier.
*   module: checkpatch for compile, makefile build on save, and a good list of
snippets to use.
*   build: uses Makefile generated or in source to build.

#### To Do:
*   autocomplete: use autocomplete or reference to Linux kernel.
*   lint: may change how checkpatch call works and instead use for before save
check of a file to correct for Linux C compliant.

### INSTALL
Clone the repository to your `~/.textadept/modules` directory:

```
cd ~/.textadept/modules
hg clone https://bitbucket.org/a_baez/ta-linux linux
```

Then copy the `linux.lua` lexer file into your `~/.textadept/lexers` directory:

```
cp ~/.textadept/modules/linux/linux.lua ~/.textadept/lexers/linux.lua
```

Finally, append to your `~/.textadept/init.lua` file the module through the
file extension. Need to do this, since the file type extension declares the
lexer:

```
textadept.file_types.extensions.rs = 'linux'
```

