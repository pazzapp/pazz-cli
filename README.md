# Pazz

Pazz is a deterministic password manager.

Like 1Password or Lastpass it lets you use different passwords for different websites. Unlike the above however there is no need to trust an external party, or store any kind of file or 'vault' as the passwords are generated on the fly each time you look them up.

This means you can't choose your own passwords, but also that you'll never lose you passwords so long as you remember your master password.


## pazz-cli

pazz-cli is a command line utility for generating and fetching your passwords.

### Usage:

Just run pazz

    ./pazz.rb

Pazz will prompt for your master password (which won't be shown). This is the magic seed for all your other passwords and needs to be long and complicated! But easy to remember and hard to mistype.

    $ ./pazz.rb
    Enter your master password:
    Enter a site (blank when finished): github
    %8-LeSN6h28gi6zJm_!K
    Enter a site (blank when finished): stackoverflow
    n_gVMKKvvu@h62-vLkCP
    Enter a site (blank when finished):
