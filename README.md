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

# Possible enhancements

* PIN / secondary password
 > Along with the master password use an optional pin as part of the seed. That way we could potentially store the hashed master password on a trusted device and only require the user enter a pin.

* Username
 > Prompt for a username once off, and store this (hashed?) in a configuration location. Use this as part of the seed. Useful?

* Chrome extension
 > Last pass style chrome extension that can fill fields and guess the site key based on URL.

* Static website
 > Simple JS only website implementing the app.

* Mobile apps
 > Wrap the above into android and osx apps?
