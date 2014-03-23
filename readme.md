Arrow Key Repurpose
===================

A small simple plugin for repurposing the arrow keys in Vim. Taken from some
blog somewhere, which was in turn taken from an older version of
[this page](http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines)
on the vim wiki, then modified by myself for my own purposes.

This plugin is mostly for shifting your text around. Up and down move the
current line thusly by adding and removing empty lines from above it, and shift
plus up and down will add and remove empty lines below. Right and left unifies
Vim's built-in mappings for indenting and unindenting in normal, visual, and
insert mode.

It is important to note that I still keep my hands on the home row, even while
using these mappings, by use of a Windows program called
[touchcursor](http://touchcursor.sourceforge.net/).

Installation
------------

There are currently two recommended ways to install this plugin, though other
plugin managers are likely easily adapted:

### Pathogen:

Navigate to your bundle directory. By default, this will be something like
“~/.vim/bundle”.

Then run the command:

    “hg clone https://bitbucket.org/atimholt/arrowkeyrepurpose”

(minus the quotes)

### NeoBundle:

Add this line to your vimrc (minus the quotes), under the conditions described
by the NeoBundle documentation:

    “NeoBundle 'bb:atimholt/ArrowKeyRepurpose', {'type': 'hg'}”

