# Changelog
All notable changes to this project will be documented in this file, starting with versions >= 0.9.5.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) starting with versions >= 1.0.0.

## [Unreleased]
### Added
- [#53](https://github.com/rdp/os/pull/53) - Add cygwin support to `open_file_command`
- [#54](https://github.com/rdp/os/pull/54) - Add `host_cpu` to documentation
### Changed
- [#68](https://github.com/rdp/os/pull/68) - Upgrade RSpec to latest (including syntax)
- [#71](https://github.com/rdp/os/pull/71) - Migrate `autotest` => `guard-rspec`
- [#72](https://github.com/rdp/os/pull/72) - Rakefile Best Practices (& RuboCop)
### Fixed
- [#52](https://github.com/rdp/os/pull/52) - http => https typo
- [#59](https://github.com/rdp/os/pull/59) - 🚑️ Remove circular dependency, fixes #55, #60
- 
### Removed

## [1.1.4] - 2021-11-07 ([tag][1.1.4t])
### Fixed
- Attempt to fix circular dependency

## [1.1.2] - 2021-11-07 ([tag][1.1.2t])
### Fixed
- Make `rss_bytes` return bytes in linux/OS X, like it always should have

## 1.1.1 - 2020-08-02
### Fixed
- Fix skip blank lines in `OS#parse_os_release`

## [1.1.0] - 2020-03-31 ([tag][1.1.0t])
### Added
- Add app_config_path method
- Detect underlying Docker containers method
- Add Linux-specific OS#parse_os_release method
### Changed
- Cleans up dev dependency specs

## 1.0.1 - 2019-04-26
### Added
- `docker?` method

## [1.0.0] - 2017-02-20 ([tag][1.0.0t])
### Added
- `freebsd?` method
### Changed
- other cleanup
- use same version number in VERSION and os.gemspec

## 0.9.6 - 2012-02-17
### Added
- add changelog, license

## 0.9.5 - 2011-12-07
### Fixed
- don't count hyper thread by default windows

## 0.9.4 - 2011-08-11
## 0.9.3 - 2011-06-27
## 0.9.2 - 2011-06-08
## 0.9.1 - 2011-06-06
## 0.9.0 - 2011-06-01
## 0.8.0 - 2011-05-20
## 0.7.4 - 2011-02-25
## 0.7.2 - 2010-05-18
## 0.7.1 - 2010-01-19 - yanked
## 0.6.3 - 2010-01-16
## 0.6.1 - 2010-01-15
## 0.6.0 - 2010-01-15
## 0.5.0 - 2010-01-14
## 0.4.0 - 2010-01-13
## 0.3.3 - 2009-12-30
## 0.3.2 - 2009-12-29
## 0.3.1 - 2009-12-21
## 0.3.0 - 2009-12-17
## 0.2.0 - 2009-12-17
## 0.1.0 - 2009-12-17
## 0.0.0 - 2009-12-17

[Unreleased]: https://github.com/rdp/os/compare/v1.1.4...HEAD
[1.1.4]: https://github.com/rdp/os/compare/v1.1.2...v1.1.4
[1.1.4t]: https://github.com/rdp/os/releases/tag/v1.1.4
[1.1.2]: https://github.com/rdp/os/compare/v1.1.0...v1.1.2
[1.1.2t]: https://github.com/rdp/os/releases/tag/v1.1.2
[1.1.0]: https://github.com/rdp/os/compare/v1.0.0...v1.1.0
[1.1.0t]: https://github.com/rdp/os/releases/tag/v1.1.0
[1.0.0]: https://github.com/rdp/os/compare/5cf86de08aae24eb7a3c2f86cab5e8fa0a901a15...v1.0.0
[1.0.0t]: https://github.com/rdp/os/releases/tag/v1.0.0
