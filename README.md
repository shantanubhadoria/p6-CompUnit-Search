NAME
====

CompUnit::Search - Search through compunits

SYNOPSIS
========

Search through compunits
------------------------

        use CompUnit::Search;

        my @modules = installed-compunits({$_ ~~ /Test\:\:.*/});

        for @modules -> $module {
          say $module;
        }

METHODS
=======

installed-compunits
-------------------

Gets a list of all installed compunits from the repositories. Note that at the moment this only searches in repositories of type CompUnit::Repository::Installation, as these are the only ones which provide a quick meta to search for installed modules. If you install anything through `panda install` it should show up in the list. Once there is a good way to search through other repositories I will implement it here.

SUPPORT
=======

Bugs / Feature Requests
-----------------------

Please report any bugs or feature requests through github at [https://github.com/shantanubhadoria/p6-CompUnit-Search/issues](https://github.com/shantanubhadoria/p6-CompUnit-Search/issues). You will be notified automatically of any progress on your issue.

Source Code
-----------

This is open source software. The code repository is available for public review and contribution under the terms of the license.

[https://github.com/shantanubhadoria/p6-CompUnit-Search](https://github.com/shantanubhadoria/p6-CompUnit-Search)

    git clone git://github.com/shantanubhadoria/p6-CompUnit-Search.git

AUTHOR
======

Shantanu Bhadoria <shantanu@cpan.org> [https://www.shantanubhadoria.com](https://www.shantanubhadoria.com)

COPYRIGHT AND LICENSE
=====================

This software is copyright (c) 2016 by Shantanu Bhadoria.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 6 programming language system itself.
