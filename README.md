duplicity cookbook
==================

No-frills duplicity installation from source.  By default uses the package version.


Requirements
------------

None


Usage
-----

Just include the `default` recipe in your run_list.  If you require a version later than that in your
OS package, set the attribute

    $ node['duplicity']['install_method'] = 'source'

Since the from-source version is compiled using checkinstall, you can remove it at any time by calling

    $ dpkg -r duplicity<version>


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



License & Authors
-----------------
- Author:: Ted Chen (<ted@nephilagraphic.com>)

```text
Copyright 2014, Nephila Graphic

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```