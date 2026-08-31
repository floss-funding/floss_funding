# Changelog

[![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][📗keep-changelog],
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html),
and [yes][📌major-versions-not-sacred], platform and engine support are part of the [public API][📌semver-breaking].
Please file a bug if you notice a violation of semantic versioning.

[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat

## [Unreleased]

### Added

- Documentation of all ENV configuration variables, and their behavior
- Rakefile: Added `appraisal:update` task to update Appraisal gemfiles and run RuboCop Gradual autocorrect.

- kettle-jem-template-20260720-005 - README Support & Community links now
  include RubyForum.
- kettle-jem-template-20260726-001 - Projects now include YARD lint
  configuration and documentation dependencies so documentation issues fail
  before generated docs are refreshed.
- kettle-jem-template-20260727-001 - Spec harness documentation now lists the
  RSpec helpers provided by `kettle-test`.

### Changed

- Final summary header now shows only the project basename (name) instead of the full project root path.

- Rename FLOSS funding configuration environment variables to the FLOSS_CFG_FUND_* namespace.

- kettle-jem-template-20260716-002 - Gemspecs now ship fewer repository-only
  files, reducing package noise for downstream packagers.
- kettle-jem-template-20260720-002 - Development Gemfiles now use the released
  `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260725-002 - Version specs now use `anonymous_loader` to
  cover `version.rb` without redefining constants, or are removed when version
  specs are not managed for the project.
- kettle-jem-template-20260728-001 - Generated Ruby workflows now use clearer
  setup-ruby-flash planning and can prepare appraisal-only jobs without
  installing the main Gemfile bundle.
- kettle-jem-template-20260801-001 - Generated README gem dashboard links now
  use ClickGems instead of BestGems.

- Use gem_mine for generated test fixtures instead of the private fixture scaffold.

- [kc] kettle-jem/prepare: updated 35 project files:
  - configuration (1)
  - dependencies (32)
  - other (2)

- [kc] kettle-jem/template: updated 22 project files:
  - code and tests (5)
  - configuration (1)
  - dependencies (6)
  - documentation (3)
  - other (6)
  - workflows (1)

### Deprecated

### Removed

### Fixed

- kettle-jem-template-20260720-003 - StructuredMerge Git diff driver config now
  uses the installed `smorg-rb` driver command.
- kettle-jem-template-20260725-001 - Release pull request branches beginning
  with `feature/release` now run JRuby and TruffleRuby workflows.
- kettle-jem-template-20260726-002 - Generated version files now document their
  version namespace and constants, reducing warning-only YARD lint output.
- kettle-jem-template-20260726-003 - Coverage upload steps now treat Coveralls,
  QLTY, and Codecov as optional, so provider outages do not fail CI when local
  coverage thresholds still pass.
- kettle-jem-template-20260728-002 - Generated RuboCop configs now ignore the
  same `gemfiles/vendor/bundle` tree as `.gitignore`, so vendored dependency
  installs are not reported as project lint debt.
- kettle-jem-template-20260728-005 - VersionGem bootstrap now creates the
  missing canonical version spec when a project only has shim namespace version
  specs.
- kettle-jem-template-20260729-003 - Old-Ruby gems below the VersionGem runtime
  floor now get managed minimal `version.rb` files and anonymous-loader version
  specs without adding `version_gem`.
- kettle-jem-template-20260730-001 - Gemspec package file enumeration now runs
  relative to the gemspec directory, so release package contents stay correct
  even when the gemspec is loaded from another working directory.
- kettle-jem-template-20260801-002 - Generated RSpec helpers now normalize
  managed configuration block bindings structurally, preventing mixed block
  parameter names from producing invalid configuration after a merge.
- kettle-jem-template-20260801-003 - Generated project metadata and
  documentation now normalize configured underscore hostnames to valid
  hyphenated hostnames.
- kettle-jem-template-20260801-004 - Generated organization README logos now
  use GitHub's stable organization avatar endpoint instead of assuming a
  matching Galtzo-hosted asset exists.
- kettle-jem-template-20260802-001 - Devcontainer JSON files now merge as JSONC,
  preserving comments and trailing commas during template updates.

- kettle-jem-template-20260728-003 - Generated dep-heads workflows now run
  TruffleRuby jobs with current RubyGems and Bundler, avoiding setup failures
  before the test suite starts.
- kettle-jem-template-20260728-004 - Generated dep-heads workflows now use the
  setup-ruby Bundler install path for direct appraisal Gemfiles, avoiding rv
  lockfile parser failures on Git and path dependencies.
- kettle-jem-template-20260729-001 - Generated JRuby 9.4 workflows now use the
  legacy manual bundle install path, avoiding setup-time Bundler full-index
  failures against `gem.coop`.

- Allow compatible Month Serializer patch releases instead of requiring exactly version 1.0.1.

### Security

## [1.0.0-alpha.3] - 2025-08-11
- TAG: [v1.0.0-alpha.3][1.0.0-alpha.3t]
- COVERAGE: 100.00% -- 283/283 lines in 8 files
- BRANCH COVERAGE: 100.00% -- 93/93 branches in 8 files
- 98.25% documented
### Added
- Global override for environment variable prefix via `ENV['FLOSS_FUNDING_ENV_PREFIX']`. Set to an empty string to disable any prefix entirely.
- Global override to disable and silence FlossFunding entirely.
  - Set `ENV['FLOSS_FUNDING_SILENT']` to a value of `"CATHEDRAL_OR_BAZAAR"` (case insensitive match) to disable and silence FlossFunding entirely.
  - Any other value will allow FlossFunding to run normally.
### Changed
- (BREAKING) Moved `DEFAULT_PREFIX` and `SILENT` constants into `FlossFunding::Constants` and updated all usages to reference `::FlossFunding::Constants::DEFAULT_PREFIX` and `::FlossFunding::Constants::SILENT`.
- Replaced hard-coded "FLOSS_FUNDING_" magic strings with `::FlossFunding::Constants::DEFAULT_PREFIX` where applicable.
- Updated documentation, RBS signatures, and specs to reflect the new Constants module and global prefix behavior.
### Deprecated
### Removed
- (BREAKING) Removed per-library ability to override the ENV prefix via `:env_prefix` option to `FlossFunding::Poke.new`. A single process-wide override is now supported via `ENV['FLOSS_FUNDING_ENV_PREFIX']`.
- (BREAKING) Removed `UnderBar::DEFAULT_PREFIX` constant.
### Fixed
- Clarified examples and error messages referencing how to set the ENV variable name.
### Security

## [1.0.0-alpha.2] - 2025-08-10
- TAG: [v1.0.0-alpha.2][1.0.0-alpha.2t]
- COVERAGE: 100.00% -- 263/263 lines in 6 files
- BRANCH COVERAGE: 100.00% -- 85/85 branches in 6 files
- 100.00% documented
### Added
- More documentation
### Fixed
- Required `base.txt` added to gem package
- Documentation typos

## [1.0.0-alpha.1] - 2025-08-10
- TAG: [v1.0.0-alpha.1][1.0.0-alpha.1t]
- COVERAGE: 100.00% -- 262/262 lines in 6 files
- BRANCH COVERAGE: 100.00% -- 85/85 branches in 6 files
- 100.00% documented
### Added
- Initial release

[Unreleased]: https://gitlab.com/galtzo-floss/floss_funding/-/compare/v1.0.0-alpha.3...main
[1.0.0-alpha.3]: https://gitlab.com/galtzo-floss/floss_funding/-/compare/v1.0.0-alpha.2...v1.0.0-alpha.3
[1.0.0-alpha.3t]: https://gitlab.com/galtzo-floss/floss_funding/-/tags/v1.0.0-alpha.3
[1.0.0-alpha.2]: https://gitlab.com/galtzo-floss/floss_funding/-/compare/v1.0.0-alpha.1...v1.0.0-alpha.2
[1.0.0-alpha.2t]: https://gitlab.com/galtzo-floss/floss_funding/-/tags/v1.0.0-alpha.2
[1.0.0-alpha.1]: https://gitlab.com/galtzo-floss/floss_funding/-/compare/389ece6fb9bd04013d11edca6fb6830139a84f4c...v1.0.0-alpha.1
[1.0.0-alpha.1t]: https://gitlab.com/galtzo-floss/floss_funding/-/tags/v1.0.0-alpha.1
