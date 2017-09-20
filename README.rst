========
vimfiles
========

This repo features my personal `neovim config`_ as well as a cheat sheet for
nifty vim commands.

.. _`neovim config`: config/


Cheat Sheet
-----------

Change text of next search match
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let's say you want to replace ``Hello World`` in the following text::

    We are going to write a simple Hello World program...

Given that you searched for it via ``/Hello World``, you can simply use the
following command to change the text::

    cgn

Or delete the text via::

    dgn


Count number of search matches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following will display the count, but will not change the buffer::

    :%s/pattern//gn

See `Tip 860`_ by Marc Weber on the `vim wiki`_.


Find in files
~~~~~~~~~~~~~

Search for ``foobar`` in all python files in the current directory and all
subdirectories::

    :noautocmd vimgrep /foobar/gj ./**/*.py

Disable autocommands to increase search speed.

Use ``:cw`` to open the quickfix window.

See `Tip 1543`_ by Fritzophrenic on the `vim wiki`_.


Folding
~~~~~~~

Toggle the current fold::

    za

See `Tip 108`_ on the `vim wiki`_.


Marks
~~~~~

Set mark ``a`` at current cursor location::

    ma

Jump to position (line and column) of mark ``a``::

    `a

Delete mark ``a``::

    :delm a

See `Tip 42`_ on the `vim wiki`_.


Move cursor to end of match
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add ``/e`` to your search to place the cursor at the end of the match::

    /foobar/e


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

Depeneding on how you work with buffers you may need to choose a slightly
different command:

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


Smartcase searching
~~~~~~~~~~~~~~~~~~~

Given that both ``ignorecase`` and ``smartcase`` are enabled, vim does a case
sensitive search only if the pattern contains an uppercase letter.

To explicitly search for a case sensitive pattern use the following::

    /foobar\C

See `Tip 1`_ on the `vim wiki`_.


Substitute with ascending numbers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To replace each occurrence of *abc* with *xyz_N* where N is an ascending number
(xyz_1, xyz_2, xyz_3, and so on)::

    :let i = 1 | %s/abc/\='xyz_' . Inc()/g

Whereas ``Inc()`` is a custom function you may want to put in your vimrc::

    function Inc(...)
      let result = g:i
      let g:i += a:0 > 0 ? a:1 : 1
      return result
    endfunction

See `Tip 918`_ on the `vim wiki`_.

You can refer to match groups in the replacement expression via ``submatch``::

    :let i = 1 | %s/\(foo\s*\)\(abc\)\(\s*bar\)/\=submatch(1) . 'xyz_' . Inc() . submatch(3)/g


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

Eunuch
~~~~~~

Move the current file relative to the its containing directory::

    :Rename

Run ``find`` and load the results into the quickfix list::

    :Find

Plugin by Tim Pope. See `vim-eunuch`_.


Exchange
~~~~~~~~

Mark a word for exchange::

    cxiw

Replace the word under the cursor by repeating the command::

    .

The same works for lines::

    cxx

Or in Visual mode::

    X

Clear selection::

    cxc

Plugin by Tom McDonald. See `vim-exchange`_.


Fugitive
~~~~~~~~

Resolve merge conflicts. Open three-way diff::

    :Gdiff

Jump to the next/previous hunk in a diff::

    ]c
    [c

Write the current file to the index::

    :Gwrite

Commit the staged changes along with a message::

    :Gcommit -m 'Create a settings json file and load it in the app'

Imagine the following scenario::

    git checkout master
    git merge feat/user-settings-panel

Pull over a hunk from the ``master``::

    :diffget //2

Pull over a hunk from ``feat/user-settings-panel``::

    :diffget //3

Compare the current file with another branch::

    :Gdiff feat/user-settings-panel


Plugin by Tim Pope. See `vim-fugitive`_.

For a great tutorial on *Fugitive* by Drew Neil please visit `vimcasts.org`_.

Jedi
~~~~

Completion::

    <C-Space>

Goto assignments::

    <leader>g

Goto definitions::

     <leader>d

Renaming::

     <leader>r

Usages::

     <leader>n

Plugin by Dave Halter. See `jedi-vim`_.

Surround
~~~~~~~~

Change ``"Hello world!"`` to ``'Hello world!'``::

    cs"'

Remove delimiters entirely::

    ds"

Add another pair of parentheses to ``(Fizz Buzz)``::

    ysi))

Plugin by Tim Pope. See `vim-surround`_.


License
-------

.. image:: https://i.creativecommons.org/l/by-sa/3.0/88x31.png

This cheat sheet is licensed under a `Creative Commons Attribution-ShareAlike
3.0 Unported License`_.


.. _`Tip 1`: http://vim.wikia.com/wiki/Searching
.. _`Tip 42`: http://vim.wikia.com/wiki/Using_marks
.. _`Tip 108`: http://vim.wikia.com/wiki/Folding
.. _`Tip 133`: http://vim.wikia.com/wiki/Run_a_command_in_multiple_buffers
.. _`Tip 398`: http://vim.wikia.com/wiki/Macros
.. _`Tip 860`: http://vim.wikia.com/wiki/Count_number_of_matches_of_a_pattern
.. _`Tip 918`: http://vim.wikia.com/wiki/Making_a_list_of_numbers
.. _`Tip 1347`: http://vim.wikia.com/wiki/Using_tab_pages
.. _`Tip 1543`: http://vim.wikia.com/wiki/Find_in_files_within_Vim
.. _`Tip 1584`: http://vim.wikia.com/wiki/Visual_selection

.. _`Creative Commons Attribution-ShareAlike 3.0 Unported License`: http://creativecommons.org/licenses/by-sa/3.0/
.. _`vim wiki`: http://vim.wikia.com

.. _`vim-eunuch`: https://github.com/tpope/vim-eunuch
.. _`vim-exchange`: https://github.com/tommcdo/vim-exchange
.. _`jedi-vim`: https://github.com/davidhalter/jedi-vim
.. _`vim-fugitive`: https://github.com/tpope/vim-fugitive
.. _`vim-surround`: https://github.com/tpope/vim-surround
.. _`vimcasts.org`: http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
