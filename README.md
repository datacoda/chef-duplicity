duplicity cookbook
==================

No-frills duplicity installation from source.  By default uses the package version.

Requirements
------------

Usage
-----

If you require a version later than that in your OS package, set the attribute

    $ node['duplicity']['install_method'] = 'source'


Attributes
----------

### default
Generally used attributes.

- `node['duplicity']['install_method']` - default 'package'
- `node['duplicity']['backends']` - Possible values ftp, rsync, s3. default `[]`

### source
Specifies the installation packages and versions.  Be sure to update version and checksum at minimum.

- `node['duplicity']['source']['version']` - version to install. default '0.6.23'
- `node['duplicity']['source']['checksum']` - checksum value from downloads page.
- `node['duplicity']['source']['url']` - location of url.  Automatically defined by version above.

Recipes
-------
This cookbook provides three main recipes for installing Duplicity.

- `default.rb` - *Use this recipe* if you don't really care.
- `package.rb` - Installs using the primary os package.
- `source.rb` - *Use this recipe* if want to install a newer version than is available.



# Author

Author:: Nephila Graphic (<ted@nephilagraphic.com>)

