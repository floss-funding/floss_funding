[![Galtzo FLOSS Logo by Aboling0, CC BY-SA 4.0][🖼️galtzo-i]][🖼️galtzo-discord] [![ruby-lang Logo, Yukihiro Matsumoto, Ruby Visual Identity Team, CC BY-SA 2.5][🖼️ruby-lang-i]][🖼️ruby-lang] [![floss_funding Logo by Aboling0, CC BY-SA 4.0][🖼️floss_funding-i]][🖼️floss_funding]

[🖼️galtzo-i]: https://logos.galtzo.com/assets/images/galtzo-floss/avatar-192px.svg
[🖼️galtzo-discord]: https://discord.gg/3qme4XHNKN
[🖼️ruby-lang-i]: https://logos.galtzo.com/assets/images/ruby-lang/avatar-192px.svg
[🖼️ruby-lang]: https://www.ruby-lang.org/
[🖼️floss_funding-i]: https://logos.galtzo.com/assets/images/galtzo-floss/floss_funding/avatar-192px.svg
[🖼️floss_funding]: https://github.com/galtzo-floss/floss_funding

# 🪥 FlossFunding

[![Version][👽versioni]][👽version] [![License: MIT][📄license-img]][📄license-ref] [![Downloads Rank][👽dl-ranki]][👽dl-rank] [![Open Source Helpers][👽oss-helpi]][👽oss-help] [![Coveralls Test Coverage][🔑coveralls-img]][🔑coveralls] [![CodeCov Test Coverage][🔑codecovi♻️]][🔑codecov] [![QLTY Test Coverage][🔑qlty-covi]][🔑qlty-cov] [![QLTY Maintainability][🔑qlty-mnti]][🔑qlty-mnt] [![CI Heads][🚎3-hd-wfi]][🚎3-hd-wf] [![CI Current][🚎11-c-wfi]][🚎11-c-wf] [![CI Truffle Ruby][🚎9-t-wfi]][🚎9-t-wf] [![CI JRuby][🚎10-j-wfi]][🚎10-j-wf] [![Deps Locked][🚎13-🔒️-wfi]][🚎13-🔒️-wf] [![Deps Unlocked][🚎14-🔓️-wfi]][🚎14-🔓️-wf] [![CI Supported][🚎6-s-wfi]][🚎6-s-wf] [![CI Legacy][🚎4-lg-wfi]][🚎4-lg-wf] [![CI Unsupported][🚎7-us-wfi]][🚎7-us-wf] [![CI Ancient][🚎1-an-wfi]][🚎1-an-wf] [![CI Test Coverage][🚎2-cov-wfi]][🚎2-cov-wf] [![CI Style][🚎5-st-wfi]][🚎5-st-wf]

---

[![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay] [![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor] [![Buy me a coffee][🖇buyme-small-img]][🖇buyme] [![Donate on Polar][🖇polar-img]][🖇polar] [![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi] [![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

## 🌻 Synopsis

This tool can help library maintainers earn money from their open source work in one line of code, because maintainers have teeth, and need to pay their dentists.

- 👉️ No network calls.
- 👉️ No tracking.
- 👉️ No oversight.
- 👉️ Minimal crypto hashing.
- 💡 Easily disabled\*

\* There will be many ways to disable nags, to ensure it is always an option for Mr. Scrooge.
A global ones is:

```
ENV['FLOSS_CFG_FUNDING_SILENT'] = "CATHEDRAL_OR_BAZAAR"`
```

Instructions for turning this tool off will always be front and center.
If all you want is to turn it off, no sense in wasting your time figuring out how.

Now, back to the one line of code I mentioned. If you blink you may miss it...

```ruby
module MyGemLibrary
  include FlossFunding::Poke.new(__FILE__) # <====== THERE IT IS! ONE LINE OF CODE!
end
```

OK, the one line of code was a bit of a lie. You __do__ have to require the gem. So it is two lines of code.

Complete setup steps are:

1. Add gem to your Gemfile:
```ruby
gem "floss_funding"
```
2. Run the generator:
```console
bundle exec rake floss_funding:install
```
   - Idempotent: each file is handled independently. If a file already exists, you will be prompted to [d]iff, [o]verwrite, [s]kip, or [a]bort (set FF_INSTALL_CHOICE=overwrite|skip|abort|diff for non-interactive runs).
   - Adds or updates .gitignore to include a sentinel ignore for FlossFunding lockfiles: `.floss_funding.*.lock`.
3. Configure generated defaults:
```console
nano .floss_funding.yml
```
4. Add to your code (already done!):
```console
   require "floss_funding"

   module MyLibrary
   # namespace (optional): custom namespace for activation key
   # config_file (optional): alternate file name for your config at the library root (defaults to .floss_funding.yml)
   include FlossFunding::Poke.new(__FILE__, namespace: "MyLibrary", config_file: ".my_custom.yml")
   end
```

The website that will generate activation keys for your gems is coming soon @ [floss-funding.dev](https://floss-funding.dev).  FLOSS Funding relies on empathy, respect, honor, and annoyance of the most extreme mildness.  It doesn't accept payments for activation keys, and trusts you to go and sponsor or donate to your favorite open source projects before getting their "activation key".

What does an _activation key_ do?  It silences the nags for a library, and "activates" your peace of mind. It rewards you with a gold star sticker (⭐️) for each project you fund when your process exits.  That's it.

The project *does not affect* licensing of projects.  It is purely a tool to help library maintainers earn money from their open source work.

This is permitted by nearly all, if not all, FLOSS licenses, including the popular MIT, BSD 2-clause, BSD 3-clause, Apache 2.0, etc.

There are two kinds of "free" in software:

1. Free as in beer
2. Free as in freedom (of speech)

No FLOSS licenses I am aware of guarantee "free as in beer". Since developers deserve to be paid for their work, I decided to make this tool.

It has been my experience that work on the dark underbelly of software, down in the test harnesses, and the dev tools, often gets overlooked, as people focus on the big frameworks.

This tool makes it far easier to get paid for your work down there at the bottom of the stack, in the dev dependencies that get overlooked by most OSS funding tools.

Activation keys use a cipher encryption algorithm against a 2400-word dictionary, with some other data, like the project's namespace, and the current month, thrown in, to make valid activation keys slightly difficult to discover manually. Once a key is made it is valid forever. There is no revocation. The activation keys are _opaque_, rather than _private_. They are not tied to you in any way. Other people may use the same one. And that's fine! They don't do anything except silence some STDOUT nagging.

## Project summary

- Purpose
  - Help FLOSS maintainers get funded without changing licenses or adding telemetry. Libraries add one line to include a small module that reminds users to fund the software they rely on.
  - Default is consent and privacy-preserving: no network calls, no tracking, and easy opt-out when appropriate.

- Methodology (how it works)
  - Inclusion: Libraries include FlossFunding::Poke.new(__FILE__) in a module or class; this fingerprints the library and records activation events when it loads.
  - Activation keys via ENV: A user or CI sets ENV["FLOSS_FUNDING_<NAMESPACE>"] to an activation key value. Keys can be unpaid silence tokens (e.g., Free-as-in-beer), explicit opt-out tokens (Not-financially-supporting-<namespace>), or a paid 64-hex-byte key.
  - Gentle messaging: On library load, if unactivated or invalid, a single-line friendly message can be printed (on-load nag). At process end, a short end-of-run summary can highlight one library with next steps (at-exit spotlight) plus a brief table of activated/unactivated counts.
  - Sentinels: YAML lockfiles in the project root prevent over–nagging:
    - .floss_funding.ruby.on_load.lock limits on-load messages per library within a window.
    - .floss_funding.ruby.at_exit.lock ensures a given library isn’t repeatedly spotlighted at exit within a window.
  - Configuration: Optional .floss_funding.yml lets a library suggest donation amount and provide a funding URL. Defaults exist for resilience.

- Philosophy
  - Respect and empathy: Nags are mild, infrequent, and silent by default in many environments. Opt-out is always available and is treated as an "activated" state for silence.
  - Zero network by design: All behavior is local and deterministic. This is a social, not technical, contract encouraging support.
  - Ecosystem-agnostic future: Filenames include the ecosystem (e.g., .ruby) so the approach can be ported to other languages without collisions.
  - Safety first: Any failure paths are defensive; the library should never break your build or flip a successful exit into a failure.

## TO DO List

`floss_funding` ruby gem is a work in progress.

- [x] install take task `floss_funding:install`
  - [x] support for ruby gem implementers
  - [ ] support for apps with dependencies that use floss_funding
- [x] validation of activation keys
- [x] working silencing
- [x] working configuration
- [x] working CLI `floss_funding`

Website coming soon.

- [ ] A website to generate activation keys for gems
    - [ ] List all known gems that can be activated with floss_funding
    - [ ] Account creation with email address, for those who want to keep a record of their generated activation keys
    - [ ] (Optional) Enter Gem Name
    - [ ] Affirm they have purchased an activation key
    - [ ] (Optional) Receive activation key specific to namespace & month generated
    - [x] Activation key will remain valid for that namespace forever (tested out to the June, 5425 C.E.)

I expect the current release of this gem to be compatible with Ruby 1.9.2+,
but it is only tested on CI against Ruby 2.3+,
due to the inherent limitations of GitHub Actions.

| 🚚 _Amazing_ test matrix was brought to you by | 🔎 appraisal2 🔎                                                                    |
|------------------------------------------------|-------------------------------------------------------------------------------------|
| 👟 Check it out!                               | ✨ [github.com/appraisal-rb/appraisal2][💎appraisal2] ✨ |

## 💡 Info you can shake a stick at

### Federated DVCS

<details>
  <summary>Find this repo on other forges (Coming soon!)</summary>

| Federated [DVCS][💎d-in-dvcs] Repository              | Status                                                            | Issues                    | PRs                      | Wiki                      | CI                       | Discussions                  |
|-------------------------------------------------------|-------------------------------------------------------------------|---------------------------|--------------------------|---------------------------|--------------------------|------------------------------|
| 🧪 [galtzo-floss/floss_funding on GitLab][📜src-gl]   | The Truth                                                         | [💚][🤝gl-issues]         | [💚][🤝gl-pulls]         | [💚][📜wiki]              | 🏀 Tiny Matrix           | ➖                            |
| 🧊 [galtzo-floss/floss_funding on CodeBerg][📜src-cb] | An Ethical Mirror ([Donate][🤝cb-donate])                         | [💚][🤝cb-issues]         | [💚][🤝cb-pulls]         | ➖                         | ⭕️ No Matrix             | ➖                            |
| 🐙 [galtzo-floss/floss_funding on GitHub][📜src-gh]   | A Dirty Mirror                                                    | [💚][🤝gh-issues]         | [💚][🤝gh-pulls]         | ➖                         | 💯 Full Matrix           | [💚][gh-discussions]         |
| 🎮️ [Discord Server][✉️discord-invite]                | [![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite] | [Let's][✉️discord-invite] | [talk][✉️discord-invite] | [about][✉️discord-invite] | [this][✉️discord-invite] | [library!][✉️discord-invite] |

</details>

[gh-discussions]: https://github.com/galtzo-floss/floss_funding/discussions

### Enterprise Support [![Tidelift](https://tidelift.com/badges/package/rubygems/floss_funding)](https://tidelift.com/subscription/pkg/rubygems-floss_funding?utm_source=rubygems-floss_funding&utm_medium=referral&utm_campaign=readme)

<details>
  <summary>Need enterprise-level guarantees?</summary>

[![Get help from me on Tidelift][🏙️entsup-tidelift-img]][🏙️entsup-tidelift]

- 💡Subscribe for support guarantees covering _all_ FLOSS dependencies
- 💡Tidelift is part of [Sonar][🏙️entsup-tidelift-sonar]
- 💡Tidelift pays maintainers to maintain the software you depend on!<br/>📊`@`Pointy Haired Boss: An [enterprise support][🏙️entsup-tidelift] subscription is "[never gonna let you down][🧮kloc]", and *supports* open source maintainers

Alternatively:

- [![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite]
- [![Get help from me on Upwork][👨🏼‍🏫expsup-upwork-img]][👨🏼‍🏫expsup-upwork]
- [![Get help from me on Codementor][👨🏼‍🏫expsup-codementor-img]][👨🏼‍🏫expsup-codementor]

</details>

| Tokens to Remember      | [![Gem name][⛳️name-img]][⛳️gem-name] [![Gem namespace][⛳️namespace-img]][⛳️gem-namespace]                                                                                                                                                                                                                                             |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Works with JRuby        | ![JRuby 9.1 Compat][💎jruby-9.1i] ![JRuby 9.2 Compat][💎jruby-9.2i] <br/> [![JRuby 9.3 Compat][💎jruby-9.3i]][🚎10-j-wf] [![JRuby 9.4 Compat][💎jruby-9.4i]][🚎10-j-wf] [![JRuby 10.0 Compat][💎jruby-c-i]][🚎11-c-wf] [![JRuby HEAD Compat][💎jruby-headi]][🚎3-hd-wf]                                                                |
| Works with Truffle Ruby | ![Truffle Ruby 22.3 Compat][💎truby-22.3i] <br/> [![Truffle Ruby 23.0 Compat][💎truby-23.0i]][🚎9-t-wf] [![Truffle Ruby 23.1 Compat][💎truby-23.1i]][🚎9-t-wf] [![Truffle Ruby 24.1 Compat][💎truby-c-i]][🚎11-c-wf]                                                                                                                   |
| Works with MRI Ruby 3   | [![Ruby 3.0 Compat][💎ruby-3.0i]][🚎4-lg-wf] [![Ruby 3.1 Compat][💎ruby-3.1i]][🚎6-s-wf] [![Ruby 3.2 Compat][💎ruby-3.2i]][🚎6-s-wf] [![Ruby 3.3 Compat][💎ruby-3.3i]][🚎6-s-wf] [![Ruby 3.4 Compat][💎ruby-c-i]][🚎11-c-wf] [![Ruby HEAD Compat][💎ruby-headi]][🚎3-hd-wf]                                                            |
| Works with MRI Ruby 2   | ![Ruby 2.0 Compat][💎ruby-2.0i] ![Ruby 2.1 Compat][💎ruby-2.1i] ![Ruby 2.2 Compat][💎ruby-2.2i] <br/> [![Ruby 2.3 Compat][💎ruby-2.3i]][🚎1-an-wf] [![Ruby 2.4 Compat][💎ruby-2.4i]][🚎1-an-wf] [![Ruby 2.5 Compat][💎ruby-2.5i]][🚎1-an-wf] [![Ruby 2.6 Compat][💎ruby-2.6i]][🚎7-us-wf] [![Ruby 2.7 Compat][💎ruby-2.7i]][🚎7-us-wf] |
| Works with MRI Ruby 1   | ![Ruby 1.9 Compat][💎ruby-1.9i]                                                                                                                                                                                                                                                                                                        |
| Source                  | [![Source on GitLab.com][📜src-gl-img]][📜src-gl] [![Source on CodeBerg.org][📜src-cb-img]][📜src-cb] [![Source on Github.com][📜src-gh-img]][📜src-gh] [![The best SHA: dQw4w9WgXcQ!][🧮kloc-img]][🧮kloc]                                                                                                                            |
| Documentation           | [![Current release on RubyDoc.info][📜docs-cr-rd-img]][🚎yard-current] [![YARD on Galtzo.com][📜docs-head-rd-img]][🚎yard-head] [![Maintainer Blog][🚂maint-blog-img]][🚂maint-blog] [![Wiki][📜wiki-img]][📜wiki]                                                                                                                     |
| Compliance              | [![License: MIT][📄license-img]][📄license-ref] [![📄ilo-declaration-img]][📄ilo-declaration] [![Security Policy][🔐security-img]][🔐security] [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct] [![SemVer 2.0.0][📌semver-img]][📌semver]                                                                                       |
| Style                   | [![Enforced Code Style Linter][💎rlts-img]][💎rlts] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog] [![Gitmoji Commits][📌gitmoji-img]][📌gitmoji] [![Compatibility appraised by: appraisal2][💎appraisal2-img]][💎appraisal2]                                                                                     |
| Support                 | [![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite] [![Get help from me on Upwork][👨🏼‍🏫expsup-upwork-img]][👨🏼‍🏫expsup-upwork] [![Get help from me on Codementor][👨🏼‍🏫expsup-codementor-img]][👨🏼‍🏫expsup-codementor]                                                                                          |
| Maintainer 🎖️          | [![Follow Me on LinkedIn][💖🖇linkedin-img]][💖🖇linkedin] [![Follow Me on Ruby.Social][💖🐘ruby-mast-img]][💖🐘ruby-mast] [![Follow Me on Bluesky][💖🦋bluesky-img]][💖🦋bluesky] [![Contact Maintainer][🚂maint-contact-img]][🚂maint-contact] [![My technical writing][💖💁🏼‍♂️devto-img]][💖💁🏼‍♂️devto]                         |
| `...` 💖                | [![Find Me on WellFound:][💖✌️wellfound-img]][💖✌️wellfound] [![Find Me on CrunchBase][💖💲crunchbase-img]][💖💲crunchbase] [![My LinkTree][💖🌳linktree-img]][💖🌳linktree] [![More About Me][💖💁🏼‍♂️aboutme-img]][💖💁🏼‍♂️aboutme] [🧊][💖🧊berg] [🐙][💖🐙hub]  [🛖][💖🛖hut] [🧪][💖🧪lab]                                      |

## ✨ Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add floss_funding

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install floss_funding

### 🔒 Secure Installation

<details>
  <summary>For Medium or High Security Installations</summary>

This gem is cryptographically signed, and has verifiable [SHA-256 and SHA-512][💎SHA_checksums] checksums by
[stone_checksums][💎stone_checksums]. Be sure the gem you install hasn’t been tampered with
by following the instructions below.

Add my public key (if you haven’t already, expires 2045-04-29) as a trusted certificate:

```console
gem cert --add <(curl -Ls https://raw.github.com/galtzo-floss/certs/main/pboling.pem)
```

You only need to do that once.  Then proceed to install with:

```console
gem install floss_funding -P HighSecurity
```

The `HighSecurity` trust profile will verify signed gems, and not allow the installation of unsigned dependencies.

If you want to up your security game full-time:

```console
bundle config set --global trust-policy MediumSecurity
```

`MediumSecurity` instead of `HighSecurity` is necessary if not all the gems you use are signed.

NOTE: Be prepared to track down certs for signed gems and add them the same way you added mine.

</details>

## Terminology

- Nag: Non-debug, non-error, behavioral output from FlossFunding.
  - on_load nag: a single-line message emitted during inclusion/load about missing or invalid activation.
  - at_exit nag: the featured library information card rendered at process exit.

## 🔧 Basic Usage

Usage pattern options when including in to a library namespace:

1. Traditional namespace (uses the including module's name):
    ```ruby
    include FlossFunding::Poke.new(__FILE__)
    ```
2. Arbitrary custom namespace (can add version, or anything else):
    ```ruby
    include FlossFunding::Poke.new(__FILE__, :namespace => "Custom::Namespace::V4")
    ```
3. Explicitly disable gemspec parsing, and config discovery (including library_name) by passing `nil` and `wedge: true`:
    ```ruby
    include FlossFunding::Poke.new(nil, :wedge => true)
    ```
4. Provide a custom config file name located at the library root:
   module MyGemLibrary
    ```ruby
    include FlossFunding::Poke.new(__FILE__, :config_file => ".my_custom.yml")
    ```

In all cases, the first parameter should be a String file path (e.g., `__FILE__`) or `nil` to disable discovery.

## CLI

The gem ships a CLI executable you can run from a Bundler project root:

- floss_funding -p / --progress
  - Shows a progress bar of Activated libraries vs Activated + Unactivated libraries in the current project.
  - The bar reflects progress made toward activating all fingerprinted libraries.
  - Edge cases:
    - If 0 of N libraries are activated, the bar shows 0% and remains at the start, e.g., Funding: | | 0% (0/N)
    - If there are no fingerprinted libraries at all (0/0), a simple fallback line is printed: Funding: 0% (0/0)

Example:

```
$ ./exe/floss_funding -t

+------------------------------------------------------------------------------+-----------------------------------------------------------------------------+
| Needs Funding (Unactivated + Invalid)                                        | Funded by You (Activated)                                                   |
+------------------------------------------------------------------------------+-----------------------------------------------------------------------------+
| floss_funding [FlossFunding]                                                 |                                                                             |
+------------------------------------------------------------------------------+-----------------------------------------------------------------------------+

$ ./exe/floss_funding -p
Funding: | | 0% (0/1)
```

- floss_funding -t / --table
  - Shows a two-pane table of libraries by activation state (Unactivated + Invalid on the left; Activated on the right).

## Configuration

### Silence via global Environment Variable

For global silence the best solution is to set the environment variable `FLOSS_CFG_FUNDING_SILENT=CATHEDRAL_OR_BAZAAR` before your application starts.

If you can't control ENV variables, and you can control the stack, at the beginning of the stack, before other things load, simply `require "floss_funding/silent"`, and it will silence all output. Note that this is less performant than setting the global environment variable, as above.

### Silence via Poke.new `silent` option.

`silent` options values can be any of:

- truthy - indicates that the library including Poke.new requires `FlossFunding` to be silent, perhaps due to scanning the output of a command, or generating output that is expected elsewhere.
- falsey - indicates that the library including Poke.new does not require `FlossFunding` to be silent. This is effectively the default.
- Object that responds to `:call` - indicates that the library including Poke.new might require `FlossFunding` to be silent, and that evaluation will be done whenever FlossFunding attempts to print something.

If you have a library that doesn't know, at the time of `Poke.new` inclusion, if it needs silence, pass an object that responds to `:call` as the `silent` option to `FlossFunding::Poke.new`.

**IMPORTANT** - By the time your `Poke.new` using library loads into a stack, other libraries may have already loaded `Poke.new` for themselves, and may have already generated output. This is not a solution for silencing all output. The main thing it can reliably do is silence the output from the at_exit handler.

If you need to silence **everything**, do so by setting the environment variable `FLOSS_CFG_FUNDING_SILENT=CATHEDRAL_OR_BAZAAR` before your application starts.

### File-based Configuration

Gems that use the floss_funding gem can configure some features by creating a `.floss_funding.yml` file at their root directory. This works in the same manner as `.rubocop.yml` for gems that use RuboCop.

The following options are configured via the `.floss_funding.yml` file:

1. `suggested_donation_amount` - The suggested donation amount to display in the begging message (default: 5)
2. `floss_funding_url` - The URL to direct users to for donations or sponsorship
   a. default: https://floss-funding.dev, which doesn't take donations on behalf of other projects, but it will have helpful tips on how to find a way to donate.

#### Example Configuration

In your `.floss_funding.yml` at the root of your project:

```yaml
suggested_donation_amount: 10
floss_funding_url: https://example.com/fund
```

## Environment variables

These environment variables let you control FlossFunding behavior at runtime. Each variable is optional; unset variables use safe defaults.

Note: This section documents the FLOSS_CFG_FUNDING_* variables specifically requested. The library also honors additional variables (e.g., activation key envs and some FLOSS_CFG_FUND_* controls) which are described elsewhere in the README and code comments.

### FLOSS_CFG_FUNDING_LOGFILE
- Purpose: Redirects FlossFunding debug output to a file when debugging is enabled.
- Type: file path (string)
- Default: unset (debug messages, if any, go to STDOUT)
- Behavior:
  - When set to a non-empty path, FlossFunding attempts to create/truncate the file on first use and logs debug messages via Ruby's Logger at DEBUG level.
  - Directory creation is best-effort (mkdir -p). Failures fall back to STDOUT without raising.
- Example:
  - FLOSS_CFG_FUNDING_LOGFILE=tmp/log/floss_funding.debug.log

### FLOSS_CFG_FUNDING_ON_LOAD_SEC_PER_NAG_MAX
- Purpose: Limits how often a given library can emit an on-load (include-time) nag message.
- Type: integer seconds
- Default: 86400 (24 hours)
- Behavior:
  - A YAML lockfile .floss_funding.ruby.on_load.lock in the project root records the last on-load nag per library. If the recorded time is within this many seconds, the on-load nag is suppressed.
  - Values are clamped to a safe range internally.
- Example:
  - FLOSS_CFG_FUNDING_ON_LOAD_SEC_PER_NAG_MAX=3600  # at most one on-load nag per hour per library

### FLOSS_CFG_FUNDING_AT_EXIT_SEC_PER_NAG_MAX
- Purpose: Limits how often the at-exit spotlight (the featured info card at process end) can highlight a library.
- Type: integer seconds
- Default: 2400 (40 minutes)
- Behavior:
  - A YAML lockfile .floss_funding.ruby.at_exit.lock in the project root records the last at-exit spotlight per library. If within this many seconds, that library won't be spotlighted again.
  - Values are clamped to a safe range internally.
- Example:
  - FLOSS_CFG_FUNDING_AT_EXIT_SEC_PER_NAG_MAX=600  # at most one at-exit spotlight per 10 minutes per library

### FLOSS_CFG_FUNDING_WEDGE_DANGEROUS
- Purpose: Enables an aggressive mode for FlossFunding::Wedge that attempts to require gems before injecting, to increase chances of finding their namespaces.
- Type: string; recognized value: "1"
- Default: unset (safe mode)
- Behavior:
  - When set to "1", the wedge will attempt to require each loaded gem before resolving constants, but only if FlossFunding DEBUG is true. If DEBUG is false, wedge prints a warning and remains safe.
  - This file is not auto-required by the gem; wedge must be explicitly required/used.
- Example:
  - FLOSS_CFG_FUNDING_WEDGE_DANGEROUS=1
  - With DEBUG enabled (see README for DEBUG), running: ruby -rfloss_funding/wedge -e 'FlossFunding::Wedge.wedge!'

## 🦷 FLOSS Funding

> How wonderful it is that nobody need wait a single moment before starting to improve the world.<br/>
>—Anne Frank

I’m driven by a passion to foster a thriving open-source community – a space where people can tackle complex problems, no matter how small.  Revitalizing libraries that have fallen into disrepair, and building new libraries focused on solving real-world challenges, are my passions — totaling 79 hours of FLOSS coding over just the past seven days, a pretty regular week for me.  I was recently affected by layoffs, and the tech jobs market is unwelcoming. I’m reaching out here because your support would significantly aid my efforts to provide for my family, and my farm (11 🐔 chickens, 2 🐶 dogs, 3 🐰 rabbits, 8 🐈‍ cats).

If you work at a company that uses my work, please encourage them to support me as a corporate sponsor. My work on gems you use might show up in `bundle fund`.

I’m developing a new library, [floss_funding][🖇floss-funding-gem], designed to empower open-source developers like myself to get paid for the work we do, in a sustainable way. Please give it a look.

**[Floss-Funding.dev][🖇floss-funding.dev]: 👉️ No network calls. 👉️ No tracking. 👉️ No oversight. 👉️ Minimal crypto hashing. 💡 Easily disabled nags**

[![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay] [![Donate on PayPal][🖇paypal-img]][🖇paypal] [![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor] [![Buy me a coffee][🖇buyme-small-img]][🖇buyme] [![Donate on Polar][🖇polar-img]][🖇polar] [![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi] [![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

## 🔐 Security

See [SECURITY.md][🔐security].

## 🤝 Contributing

If you need some ideas of where to help, you could work on adding more code coverage,
or if it is already 💯 (see [below](#code-coverage)) check [reek](REEK), [issues][🤝gh-issues], or [PRs][🤝gh-pulls],
or use the gem and think about how it could be better.

We [![Keep A Changelog][📗keep-changelog-img]][📗keep-changelog] so if you make changes, remember to update it.

See [CONTRIBUTING.md][🤝contributing] for more detailed instructions.

### 🚀 Release Instructions

See [CONTRIBUTING.md][🤝contributing].

### Code Coverage

[![Coverage Graph][🔑codecov-g♻️]][🔑codecov]

[![Coveralls Test Coverage][🔑coveralls-img]][🔑coveralls]

[![QLTY Test Coverage][🔑qlty-covi]][🔑qlty-cov]

### 🪇 Code of Conduct

Everyone interacting with this project's codebases, issue trackers,
chat rooms and mailing lists agrees to follow the [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct].

## 🌈 Contributors

[![Contributors][🖐contributors-img]][🖐contributors]

Made with [contributors-img][🖐contrib-rocks].

Also see GitLab Contributors: [https://gitlab.com/galtzo-floss/floss_funding/-/graphs/main][🚎contributors-gl]

## ⭐️ Star History

<a href="https://star-history.com/#galtzo-floss/floss_funding&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=galtzo-floss/floss_funding&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=galtzo-floss/floss_funding&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=galtzo-floss/floss_funding&type=Date" />
 </picture>
</a>

## 📌 Versioning

This Library adheres to [![Semantic Versioning 2.0.0][📌semver-img]][📌semver].
Violations of this scheme should be reported as bugs.
Specifically, if a minor or patch version is released that breaks backward compatibility,
a new version should be immediately released that restores compatibility.
Breaking changes to the public API will only be introduced with new major versions.

> dropping support for a platform is both obviously and objectively a breaking change <br/>
>—Jordan Harband ([@ljharb](https://github.com/ljharb), maintainer of SemVer) [in SemVer issue 716][📌semver-breaking]

I understand that policy doesn't work universally ("exceptions to every rule!"),
but it is the policy here.
As such, in many cases it is good to specify a dependency on this library using
the [Pessimistic Version Constraint][📌pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency("floss_funding", "~> 1.0")
```

<details>
<summary>📌 Is "Platform Support" part of the public API? More details inside.</summary>

SemVer should, but doesn't explicitly, say that dropping support for specific Platforms
is a *breaking change* to an API.
It is obvious to many, but not all, and since the spec is silent, the bike shedding is endless.

To get a better understanding of how SemVer is intended to work over a project's lifetime,
read this article from the creator of SemVer:

- ["Major Version Numbers are Not Sacred"][📌major-versions-not-sacred]

</details>

See [CHANGELOG.md][📌changelog] for a list of releases.

## 📄 License

The gem is available as open source under the terms of
the [MIT License][📄license] [![License: MIT][📄license-img]][📄license-ref].
See [LICENSE.txt][📄license] for the official [Copyright Notice][📄copyright-notice-explainer].

### © Copyright

<ul>
    <li>
        Copyright (c) 2025 Peter H. Boling, of
        <a href="https://discord.gg/3qme4XHNKN">
            Galtzo.com
            <picture>
              <img src="https://logos.galtzo.com/assets/images/galtzo-floss/avatar-128px-blank.svg" alt="Galtzo.com Logo (Wordless) by Aboling0, CC BY-SA 4.0" width="24">
            </picture>
        </a>, and floss_funding contributors.
        Three files, and marked in the header of each, have been graciously stolen from the rubocop gem. Two lightly, and one heavily, edited for purpose. RuboCop is under the same MIT license, but those files are are Copyright (c) 2012-23 Bozhidar Batsov. *1
    </li>
    <li>*1) If they were extracted into a general purpose `config_finder`, I'd use that instead, and I may do that at some point.</li>
</ul>

P.S. If you need help️ or want to say thanks, 👇 Join the Discord.

[![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite]

[⛳liberapay-img]: https://img.shields.io/liberapay/goal/pboling.svg?logo=liberapay&color=a51611
[⛳liberapay]: https://liberapay.com/pboling/donate
[🖇sponsor-img]: https://img.shields.io/badge/Sponsor_Me!-pboling.svg?style=social&logo=github
[🖇sponsor]: https://github.com/sponsors/pboling
[🖇polar-img]: https://img.shields.io/badge/polar-donate-a51611.svg
[🖇polar]: https://polar.sh/pboling
[🖇kofi-img]: https://img.shields.io/badge/ko--fi-✓-a51611.svg
[🖇kofi]: https://ko-fi.com/O5O86SNP4
[🖇patreon-img]: https://img.shields.io/badge/patreon-donate-a51611.svg
[🖇patreon]: https://patreon.com/galtzo
[🖇buyme-small-img]: https://img.shields.io/badge/buy_me_a_coffee-✓-a51611.svg?style=flat
[🖇buyme-img]: https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20latte&emoji=&slug=pboling&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff
[🖇buyme]: https://www.buymeacoffee.com/pboling
[🖇paypal-img]: https://img.shields.io/badge/donate-paypal-a51611.svg?style=flat&logo=paypal
[🖇paypal]: https://www.paypal.com/paypalme/peterboling
[🖇floss-funding.dev]: https://floss-funding.dev
[🖇floss-funding-gem]: https://github.com/galtzo-floss/floss_funding
[✉️discord-invite]: https://discord.gg/3qme4XHNKN
[✉️discord-invite-img]: https://img.shields.io/discord/1373797679469170758?style=for-the-badge

[✇bundle-group-pattern]: https://gist.github.com/pboling/4564780
[⛳️gem-namespace]: https://github.com/galtzo-floss/floss_funding
[⛳️namespace-img]: https://img.shields.io/badge/namespace-FlossFunding-brightgreen.svg?style=flat&logo=ruby&logoColor=white
[⛳️gem-name]: https://rubygems.org/gems/floss_funding
[⛳️name-img]: https://img.shields.io/badge/name-floss__funding-brightgreen.svg?style=flat&logo=rubygems&logoColor=red
[🚂maint-blog]: http://www.railsbling.com/tags/floss_funding
[🚂maint-blog-img]: https://img.shields.io/badge/blog-railsbling-0093D0.svg?style=for-the-badge&logo=rubyonrails&logoColor=orange
[🚂maint-contact]: http://www.railsbling.com/contact
[🚂maint-contact-img]: https://img.shields.io/badge/Contact-Maintainer-0093D0.svg?style=flat&logo=rubyonrails&logoColor=red
[💖🖇linkedin]: http://www.linkedin.com/in/peterboling
[💖🖇linkedin-img]: https://img.shields.io/badge/PeterBoling-LinkedIn-0B66C2?style=flat&logo=newjapanprowrestling
[💖✌️wellfound]: https://wellfound.com/u/peter-boling/u/peter-boling
[💖✌️wellfound-img]: https://img.shields.io/badge/peter--boling-orange?style=flat&logo=wellfound
[💖💲crunchbase]: https://www.crunchbase.com/person/peter-boling
[💖💲crunchbase-img]: https://img.shields.io/badge/peter--boling-purple?style=flat&logo=crunchbase
[💖🐘ruby-mast]: https://ruby.social/@galtzo
[💖🐘ruby-mast-img]: https://img.shields.io/mastodon/follow/109447111526622197?domain=https%3A%2F%2Fruby.social&style=flat&logo=mastodon&label=Ruby%20%40galtzo
[💖🦋bluesky]: https://bsky.app/profile/galtzo.com
[💖🦋bluesky-img]: https://img.shields.io/badge/@galtzo.com-0285FF?style=flat&logo=bluesky&logoColor=white
[💖🌳linktree]: https://linktr.ee/galtzo
[💖🌳linktree-img]: https://img.shields.io/badge/galtzo-purple?style=flat&logo=linktree
[💖💁🏼‍♂️devto]: https://dev.to/galtzo
[💖💁🏼‍♂️devto-img]: https://img.shields.io/badge/dev.to-0A0A0A?style=flat&logo=devdotto&logoColor=white
[💖💁🏼‍♂️aboutme]: https://about.me/peter.boling
[💖💁🏼‍♂️aboutme-img]: https://img.shields.io/badge/about.me-0A0A0A?style=flat&logo=aboutme&logoColor=white
[💖🧊berg]: https://codeberg.org/pboling
[💖🐙hub]: https://github.org/pboling
[💖🛖hut]: https://sr.ht/~galtzo/
[💖🧪lab]: https://gitlab.com/pboling
[👨🏼‍🏫expsup-upwork]: https://www.upwork.com/freelancers/~014942e9b056abdf86?mp_source=share
[👨🏼‍🏫expsup-upwork-img]: https://img.shields.io/badge/UpWork-13544E?style=for-the-badge&logo=Upwork&logoColor=white
[👨🏼‍🏫expsup-codementor]: https://www.codementor.io/peterboling?utm_source=github&utm_medium=button&utm_term=peterboling&utm_campaign=github
[👨🏼‍🏫expsup-codementor-img]: https://img.shields.io/badge/CodeMentor-Get_Help-1abc9c?style=for-the-badge&logo=CodeMentor&logoColor=white
[🏙️entsup-tidelift]: https://tidelift.com/subscription
[🏙️entsup-tidelift-img]: https://img.shields.io/badge/Tidelift_and_Sonar-Enterprise_Support-FD3456?style=for-the-badge&logo=sonar&logoColor=white
[🏙️entsup-tidelift-sonar]: https://blog.tidelift.com/tidelift-joins-sonar
[💁🏼‍♂️peterboling]: http://www.peterboling.com
[🚂railsbling]: http://www.railsbling.com
[📜src-gl-img]: https://img.shields.io/badge/GitLab-FBA326?style=for-the-badge&logo=Gitlab&logoColor=orange
[📜src-gl]: https://gitlab.com/galtzo-floss/floss_funding/
[📜src-cb-img]: https://img.shields.io/badge/CodeBerg-4893CC?style=for-the-badge&logo=CodeBerg&logoColor=blue
[📜src-cb]: https://codeberg.org/galtzo-floss/floss_funding
[📜src-gh-img]: https://img.shields.io/badge/GitHub-238636?style=for-the-badge&logo=Github&logoColor=green
[📜src-gh]: https://github.com/galtzo-floss/floss_funding
[📜docs-cr-rd-img]: https://img.shields.io/badge/RubyDoc-Current_Release-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜docs-head-rd-img]: https://img.shields.io/badge/YARD_on_Galtzo.com-HEAD-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜wiki]: https://gitlab.com/galtzo-floss/floss_funding/-/wikis/home
[📜wiki-img]: https://img.shields.io/badge/wiki-examples-943CD2.svg?style=for-the-badge&logo=Wiki&logoColor=white
[👽dl-rank]: https://rubygems.org/gems/floss_funding
[👽dl-ranki]: https://img.shields.io/gem/rd/floss_funding.svg
[👽oss-help]: https://www.codetriage.com/galtzo-floss/floss_funding
[👽oss-helpi]: https://www.codetriage.com/galtzo-floss/floss_funding/badges/users.svg
[👽version]: https://rubygems.org/gems/floss_funding
[👽versioni]: https://img.shields.io/gem/v/floss_funding.svg
[🔑qlty-mnt]: https://qlty.sh/gh/galtzo-floss/projects/floss_funding
[🔑qlty-mnti]: https://qlty.sh/gh/galtzo-floss/projects/floss_funding/maintainability.svg
[🔑qlty-cov]: https://qlty.sh/gh/galtzo-floss/projects/floss_funding/metrics/code?sort=coverageRating
[🔑qlty-covi]: https://qlty.sh/gh/galtzo-floss/projects/floss_funding/coverage.svg
[🔑codecov]: https://codecov.io/gh/galtzo-floss/floss_funding
[🔑codecovi♻️]: https://codecov.io/gh/galtzo-floss/floss_funding/graph/badge.svg?token=hRnUCPqxMu
[🔑coveralls]: https://coveralls.io/github/galtzo-floss/floss_funding?branch=main
[🔑coveralls-img]: https://coveralls.io/repos/github/galtzo-floss/floss_funding/badge.svg?branch=main
[🖐codeQL]: https://github.com/galtzo-floss/floss_funding/security/code-scanning
[🖐codeQL-img]: https://github.com/galtzo-floss/floss_funding/actions/workflows/codeql-analysis.yml/badge.svg
[🚎1-an-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/ancient.yml
[🚎1-an-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/ancient.yml/badge.svg
[🚎2-cov-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/coverage.yml
[🚎2-cov-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/coverage.yml/badge.svg
[🚎3-hd-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/heads.yml
[🚎3-hd-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/heads.yml/badge.svg
[🚎4-lg-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/legacy.yml
[🚎4-lg-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/legacy.yml/badge.svg
[🚎5-st-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/style.yml
[🚎5-st-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/style.yml/badge.svg
[🚎6-s-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/supported.yml
[🚎6-s-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/supported.yml/badge.svg
[🚎7-us-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/unsupported.yml
[🚎7-us-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/unsupported.yml/badge.svg
[🚎8-ho-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/hoary.yml
[🚎8-ho-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/hoary.yml/badge.svg
[🚎9-t-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/truffle.yml
[🚎9-t-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/truffle.yml/badge.svg
[🚎10-j-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/jruby.yml
[🚎10-j-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/jruby.yml/badge.svg
[🚎11-c-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/current.yml
[🚎11-c-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/current.yml/badge.svg
[🚎13-🔒️-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/deps_locked.yml
[🚎13-🔒️-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/deps_locked.yml/badge.svg
[🚎14-🔓️-wf]: https://github.com/galtzo-floss/floss_funding/actions/workflows/deps_unlocked.yml
[🚎14-🔓️-wfi]: https://github.com/galtzo-floss/floss_funding/actions/workflows/deps_unlocked.yml/badge.svg
[💎ruby-1.9i]: https://img.shields.io/badge/Ruby-1.9_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.0i]: https://img.shields.io/badge/Ruby-2.0_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.1i]: https://img.shields.io/badge/Ruby-2.1_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.2i]: https://img.shields.io/badge/Ruby-2.2_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.3i]: https://img.shields.io/badge/Ruby-2.3-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.4i]: https://img.shields.io/badge/Ruby-2.4-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.5i]: https://img.shields.io/badge/Ruby-2.5-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.6i]: https://img.shields.io/badge/Ruby-2.6-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.7i]: https://img.shields.io/badge/Ruby-2.7-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.0i]: https://img.shields.io/badge/Ruby-3.0-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.1i]: https://img.shields.io/badge/Ruby-3.1-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.2i]: https://img.shields.io/badge/Ruby-3.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.3i]: https://img.shields.io/badge/Ruby-3.3-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-c-i]: https://img.shields.io/badge/Ruby-current-CC342D?style=for-the-badge&logo=ruby&logoColor=green
[💎ruby-headi]: https://img.shields.io/badge/Ruby-HEAD-CC342D?style=for-the-badge&logo=ruby&logoColor=blue
[💎truby-22.3i]: https://img.shields.io/badge/Truffle_Ruby-22.3_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=pink
[💎truby-23.0i]: https://img.shields.io/badge/Truffle_Ruby-23.0-34BCB1?style=for-the-badge&logo=ruby&logoColor=pink
[💎truby-23.1i]: https://img.shields.io/badge/Truffle_Ruby-23.1-34BCB1?style=for-the-badge&logo=ruby&logoColor=pink
[💎truby-c-i]: https://img.shields.io/badge/Truffle_Ruby-current-34BCB1?style=for-the-badge&logo=ruby&logoColor=green
[💎truby-headi]: https://img.shields.io/badge/Truffle_Ruby-HEAD-34BCB1?style=for-the-badge&logo=ruby&logoColor=blue
[💎jruby-9.1i]: https://img.shields.io/badge/JRuby-9.1_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-9.2i]: https://img.shields.io/badge/JRuby-9.2_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-9.3i]: https://img.shields.io/badge/JRuby-9.3-FBE742?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-9.4i]: https://img.shields.io/badge/JRuby-9.4-FBE742?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-c-i]: https://img.shields.io/badge/JRuby-current-FBE742?style=for-the-badge&logo=ruby&logoColor=green
[💎jruby-headi]: https://img.shields.io/badge/JRuby-HEAD-FBE742?style=for-the-badge&logo=ruby&logoColor=blue
[🤝gh-issues]: https://github.com/galtzo-floss/floss_funding/issues
[🤝gh-pulls]: https://github.com/galtzo-floss/floss_funding/pulls
[🤝gl-issues]: https://gitlab.com/galtzo-floss/floss_funding/-/issues
[🤝gl-pulls]: https://gitlab.com/galtzo-floss/floss_funding/-/merge_requests
[🤝cb-issues]: https://codeberg.org/galtzo-floss/floss_funding/issues
[🤝cb-pulls]: https://codeberg.org/galtzo-floss/floss_funding/pulls
[🤝cb-donate]: https://donate.codeberg.org/
[🤝contributing]: CONTRIBUTING.md
[🔑codecov-g♻️]: https://codecov.io/gh/galtzo-floss/floss_funding/graphs/tree.svg?token=hRnUCPqxMu
[🖐contrib-rocks]: https://contrib.rocks
[🖐contributors]: https://github.com/galtzo-floss/floss_funding/graphs/contributors
[🖐contributors-img]: https://contrib.rocks/image?repo=galtzo-floss/floss_funding
[🚎contributors-gl]: https://gitlab.com/galtzo-floss/floss_funding/-/graphs/main
[🪇conduct]: CODE_OF_CONDUCT.md
[🪇conduct-img]: https://img.shields.io/badge/Contributor_Covenant-2.1-259D6C.svg
[📌pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-259D6C.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📌changelog]: CHANGELOG.md
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-34495e.svg?style=flat
[📌gitmoji]:https://gitmoji.dev
[📌gitmoji-img]:https://img.shields.io/badge/gitmoji_commits-%20😜%20😍-34495e.svg?style=flat-square
[🧮kloc]: https://www.youtube.com/watch?v=dQw4w9WgXcQ
[🧮kloc-img]: https://img.shields.io/badge/KLOC-0.262-FFDD67.svg?style=for-the-badge&logo=YouTube&logoColor=blue
[🔐security]: SECURITY.md
[🔐security-img]: https://img.shields.io/badge/security-policy-259D6C.svg?style=flat
[📄copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year
[📄license]: LICENSE.txt
[📄license-ref]: https://opensource.org/licenses/MIT
[📄license-img]: https://img.shields.io/badge/License-MIT-259D6C.svg
[📄ilo-declaration]: https://www.ilo.org/declaration/lang--en/index.htm
[📄ilo-declaration-img]: https://img.shields.io/badge/ILO_Fundamental_Principles-✓-259D6C.svg?style=flat
[🚎yard-current]: http://rubydoc.info/gems/floss_funding
[🚎yard-head]: https://rspec-stubbed-env.galtzo.com
[💎stone_checksums]: https://github.com/galtzo-floss/stone_checksums
[💎SHA_checksums]: https://gitlab.com/galtzo-floss/floss_funding/-/tree/main/checksums
[💎rlts]: https://github.com/rubocop-lts/rubocop-lts
[💎rlts-img]: https://img.shields.io/badge/code_style_%26_linting-rubocop--lts-34495e.svg?plastic&logo=ruby&logoColor=white
[💎appraisal2]: https://github.com/appraisal-rb/appraisal2
[💎appraisal2-img]: https://img.shields.io/badge/appraised_by-appraisal2-34495e.svg?plastic&logo=ruby&logoColor=white
[💎d-in-dvcs]: https://railsbling.com/posts/dvcs/put_the_d_in_dvcs/
