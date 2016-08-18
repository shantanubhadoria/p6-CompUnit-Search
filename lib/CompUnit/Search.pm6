use v6;

=begin pod

=head1 NAME

CompUnit::Search - Search through compunits

=head1 SYNOPSIS

=head2 Search through compunits

=begin code

    use CompUnit::Search;

    my @modules = installed-compunits({$_ ~~ /Test\:\:.*/});

    for @modules -> $module {
      say $module;
    }

=end code

=head1 METHODS

=head2 installed-compunits

Gets a list of all installed compunits from the repositories. Note that at the moment this only searches in repositories
of type CompUnit::Repository::Installation, as these are the only ones which provide a quick meta to search for
installed modules. If you install anything through `panda install` it should show up in the list. Once there is a good
way to search through other repositories I will implement it here.

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through github at
L<https://github.com/shantanubhadoria/p6-CompUnit-Search/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/shantanubhadoria/p6-CompUnit-Search>

  git clone git://github.com/shantanubhadoria/p6-CompUnit-Search.git

=head1 AUTHOR

Shantanu Bhadoria <shantanu@cpan.org> L<https://www.shantanubhadoria.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Shantanu Bhadoria.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 6 programming language system itself.

=end pod

unit module CompUnit::Search;

sub installed-compunits(Block $callback = {True}) is export {
  my $repo = $*REPO;
  lazy gather repeat {
    given $repo.^name {
      when 'CompUnit::Repository::Installation' {
        for $repo.installed -> $distribution {
          for $distribution.meta<provides>.keys -> $provides {
            if $callback($provides) {
              take $provides;
            }
          }
        }
      }
    }
  } while $repo = $repo.next-repo;
}
