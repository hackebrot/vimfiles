========
vimfiles
========

This repo features my personal vimrc_ as well as a cheat sheet for nifty vim commands.

.. _vimrc: vimrc


Cheat Sheet
-----------

Count number of search matches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following will display the count, but will not change the buffer::

    :%s/pattern//gn

See `Tip 860`_ by Marc Weber on the `vim wiki`_.


Find in files
~~~~~~~~~~~~~

Search for ``foobar`` in all python files in the current directory and all subdirectories::

    :noautocmd vimgrep /foobar/gj ./**/*.py

Disable autocommands to increase search speed.

Use ``:cw`` to open the quickfix window.

See `Tip 1543`_ by Fritzophrenic on the `vim wiki`_.


Marks
~~~~~

Set mark ``a`` at current cursor location::

    ma

Jump to position (line and column) of mark ``a``::

    `a

Delete mark ``a``::

    :delm a

See `Tip 42`_ on the `vim wiki`_.


Restore a visual selection
~~~~~~~~~~~~~~~~~~~~~~~~~~

Reselect the last block::

    gv

See `Tip 1584`_ by Metacosm on the `vim wiki`_.


Run macro on multiple windows, tabs, buffers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run macro ``q`` on all tabs (files are not saved to disk)::

    :tabdo normal! @q

You can also write all the changed tabs to disk in a single step::

    :tabdo execute "normal! @q" | update

Depeneding on how you work with buffers you may need to choose a slightly different command:

* ``argdo`` - all files in argument list
* ``bufdo`` - all buffers
* ``tabdo`` - all tabs
* ``windo`` - all windows in the current tab

See `Tip 133`_ on the `vim wiki`_.


Run macro on visual selection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run the macro from register ``q`` on each line of your selection::

    :normal @q

See `Tip 398`_ on the `vim wiki`_.


Tabs
~~~~

Open files in tabs::

    vim -p foo.py bar.py
    vim -p *.py

List all tabs::

    :tabs

Go to next/previous tab in normal mode::

    gt
    gT

See `Tip 1347`_ on the `vim wiki`_.


Move a split to a new tab::

    <C-W>T


Move each of the opened buffers to a new tab::

    :tab sball


Plugins
-------

Fugitive
~~~~~~~~

Resolve merge conflicts. Open three-way diff::

    :Gdiff

Write the current file to the index::

    :Gwrite

Commit the staged changes along with a message::

    :Gcommit -m 'Create a settings json file and load it in the app'


Plugin by Tim Pope. See `vim-fugitive`_.


License
-------

.. image:: https://i.creativecommons.org/l/by-sa/3.0/88x31.png

This cheat sheet is licensed under a `Creative Commons Attribution-ShareAlike 3.0 Unported License`_.


.. _`Tip 42`: http://vim.wikia.com/wiki/Using_marks
.. _`Tip 133`: http://vim.wikia.com/wiki/Run_a_command_in_multiple_buffers
.. _`Tip 398`: http://vim.wikia.com/wiki/Macros
.. _`Tip 860`: http://vim.wikia.com/wiki/Count_number_of_matches_of_a_pattern
.. _`Tip 1347`: http://vim.wikia.com/wiki/Using_tab_pages
.. _`Tip 1543`: http://vim.wikia.com/wiki/Find_in_files_within_Vim
.. _`Tip 1584`: http://vim.wikia.com/wiki/Visual_selection

.. _`Creative Commons Attribution-ShareAlike 3.0 Unported License`: http://creativecommons.org/licenses/by-sa/3.0/
.. _`vim wiki`: http://vim.wikia.com

.. _`vim-fugitive`: https://github.com/tpope/vim-fugitive
