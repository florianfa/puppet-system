# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v0.8.2](https://github.com/voxpupuli/puppet-system/tree/v0.8.2) (2018-09-09)

[Full Changelog](https://github.com/voxpupuli/puppet-system/compare/v0.8.1...v0.8.2)

**Closed issues:**

- RHEL 7 mismatching dependencies and lookup failure [\#43](https://github.com/voxpupuli/puppet-system/issues/43)

**Merged pull requests:**

- allow puppetlabs/concat 5.x and herculesteam/augeasproviders 2.x [\#54](https://github.com/voxpupuli/puppet-system/pull/54) ([bastelfreak](https://github.com/bastelfreak))
- allow puppetlabs/stdlib 5.x [\#52](https://github.com/voxpupuli/puppet-system/pull/52) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#49](https://github.com/voxpupuli/puppet-system/pull/49) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#47](https://github.com/voxpupuli/puppet-system/pull/47) ([bastelfreak](https://github.com/bastelfreak))

## [v0.8.1](https://github.com/voxpupuli/puppet-system/tree/v0.8.1) (2018-03-29)

[Full Changelog](https://github.com/voxpupuli/puppet-system/compare/v0.8.0...v0.8.1)

**Merged pull requests:**

- Bump puppet dependency to minimum supported version 4.10.0 [\#45](https://github.com/voxpupuli/puppet-system/pull/45) ([bastelfreak](https://github.com/bastelfreak))
- Fix changelog and update README with VP badges etc [\#36](https://github.com/voxpupuli/puppet-system/pull/36) ([alexjfisher](https://github.com/alexjfisher))

## [v0.8.0](https://github.com/voxpupuli/puppet-system/tree/v0.8.0) (2017-10-15)

[Full Changelog](https://github.com/voxpupuli/puppet-system/compare/v0.7.4...v0.8.0)

**Closed issues:**

- system::files [\#11](https://github.com/voxpupuli/puppet-system/issues/11)

**Merged pull requests:**

- fix typo in .sync.yml [\#32](https://github.com/voxpupuli/puppet-system/pull/32) ([bastelfreak](https://github.com/bastelfreak))
- Stop using meta parameter as a variable [\#24](https://github.com/voxpupuli/puppet-system/pull/24) ([ianlunam](https://github.com/ianlunam))
- add options into the resolver configuration [\#21](https://github.com/voxpupuli/puppet-system/pull/21) ([skroes](https://github.com/skroes))
- Allow the use of 3rd party ntp modules [\#19](https://github.com/voxpupuli/puppet-system/pull/19) ([level99](https://github.com/level99))
- Small fixes for system::selbooleans [\#18](https://github.com/voxpupuli/puppet-system/pull/18) ([MasonM](https://github.com/MasonM))
- Add OS limitation to README.md [\#14](https://github.com/voxpupuli/puppet-system/pull/14) ([marcw](https://github.com/marcw))
- Don't require ipaddress and netmask if DHCP is enabled [\#12](https://github.com/voxpupuli/puppet-system/pull/12) ([MasonM](https://github.com/MasonM))

## [v0.7.4](https://github.com/voxpupuli/puppet-system/tree/v0.7.4) (2013-09-22)

* Documentation fixes

* Script to generate hiera network config on an existing host

* Change dependency from ripienaar/concat to puppetlabs/concat (thanks #eshkay)

## v0.7.3 (2013-03-19)

* Enable files to be created from ERB templates

* Only apply SELinux boolean changes if SELinux is enabled

* Manage simple mail smart host configuration (initially just Postfix).  Mail
aliases are now set under 'mail' instead of a separate 'mailaliases'.

* Do not try to set a MAC address on a virtual interface. Instead make virtual
interfaces dependent on their parents (#3 thanks eglis).

* Added basic IPv6 support (#2 thanks eglis)

## v0.7.2 (2013-02-19)

* Realize groups before users so that user primary groups exist when the user
is created.

* Make 'include system' work again (#1 thanks mkm85) by avoiding mandatory
parameters in network and adding checks instead.

* Do not restart the network service when config file changes are made as this
sometimes causes issues (like the default route going missing).  This should
be fixed in a later release but for now the network service must be manually
restarted.

## v0.7.1 (2013-02-13)

* Added ldif2users script to create user/group config from an LDAP export

* Fixed bugs in user and group realize preventing hiera data lookup from
working and fixed silly typos in routes.pp

## v0.7.0 (2013-02-11)

* By default virtual user and group resources are now created that must then
be realized rather than real resources as before.  This allows all of the user
and group configuration to be added to a common part of the hiera hierarchy
but only the relevent users and groups created on each host.

To create real resources instead (and make things work as they did with
earlier versions of this module) use:

    system::users::real:  'true'
    system::groups::real: 'true'

* Added support for basic networking: set hostname, enable/disable
zeroconf/IPv6, set the default route, configure interfaces and their static
routes, configure nameserver resolvers and domains

* Manage NTP servers in /etc/ntp.conf

## v0.6.3 (2013-02-11)

* Added support for managing SELinux booleans

## v0.6.2 (Never released)

* Facts that have array values now create multiple facts with the array index
as a suffix.  For example:

    system::facts:
      software: [ 'jboss', 'httpd' ]

creates the facts:

    software0: 'jboss'
    software1: 'httpd'

## [v0.6.1](https://github.com/voxpupuli/puppet-system/tree/v0.6.1) (2013-01-26)
[Full Changelog](https://github.com/voxpupuli/puppet-system/compare/v0.6.0...v0.6.1)

* Set custom facts using the facter_dot_d Facter plugin that loads facts from
/etc/facter/facts.d.  Set 'system::facts::cleanold: true' to remove facts from
the old locations under /etc/profile.d and in /etc/sysconfig/puppet.

* Facts can now be set by running scripts - see example.yaml.

## [v0.6.0](https://github.com/voxpupuli/puppet-system/tree/v0.6.0) (2013-01-25)

* Refactoring to make it easier to use without hiera (ie. just as
parameterised classes).

* Added support for schedules so that configuration does not need to be
applied with every Puppet run.  All classes other than system::providers and
system::schedules can be configured with a default schedule, including the
system class itself.  An 'always' schedule is provided in addition to the
default schedules available (eg. hourly, daily, weekly).

* Changed the yumgroup type to have a default 'daily' schedule to reduce the
time Puppet runs take - package group changes are usually rare after the host
is first set up.  Users can override this by supplying their own schedule.

* Documented that particular system classes can be excluded when doing
'include system' by setting their default schedule to 'never' which is useful
when testing or debugging issues or just to prevent config lower in the
hierarchy from being applied.

* Added support for the augeas type to enable simple configuration file
changes to be made without writing new classes

* Use augeas to make sysconfig file changes as it is more reliable.  One
limitation is that all values are now unquoted so they can't have any
whitespace. This only appears to potentially affect system::sysconfig::puppet
puppet-extra_opts.

## v0.5.3 (2013-01-06)

* Added 'crontabs' to create user crontab entries

* Added 'execs' to run idempotent external commands

## v0.5.2 (2012-12-21)

* limits: Fixed examples to show changes due to multiple entry support

* Actually fix the typo in mounts.pp preventing it from working!

* mounts: Updated example to show an NFS share

* example.yaml: Added files examples

* sysctl: Added a note to quote numeric values to avoid "can't convert Fixnum
into String" errors

* yumgroups: added a usecache option for when 'yum -C grouplist' does not work

## [v0.5.1](https://github.com/voxpupuli/puppet-system/tree/v0.5.1) (2012-12-21)
[Full Changelog](https://github.com/voxpupuli/puppet-system/compare/v0.5.0...v0.5.1)

* Added 'files' to create directories and populate the content of files.  The
initial reason was to create mount points for NFS shares.

* Fixed typo in mounts.pp preventing it from working.

* Run 'mounts' in the last stage so that any required users, groups and mount
points can be created first.

* Require augeasproviders > 0.5.1 to get bug fix for problems running under
'puppet apply'.

* Require limits > 0.3.1 as this allows more than one entry per user or group.


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
