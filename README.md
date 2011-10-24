# Watch Tower [![Build Status](http://travis-ci.org/TechnoGate/watch_tower.png)](http://travis-ci.org/TechnoGate/watch_tower) [![Still Maintained](http://stillmaintained.com/TechnoGate/watch_tower.png)](http://stillmaintained.com/TechnoGate/watch_tower)

[![Click here to lend your support to: Open Source Projects and make a donation at www.pledgie.com !](http://www.pledgie.com/campaigns/16123.png?skin_name=chrome)](http://www.pledgie.com/campaigns/16123)

WatchTower not only helps you track how much time is spent on all of your projects, it even tells you how much time is spent on each file in every project.

# Introduction

Did you ever want to keep track of how much time you _really_ spend on all of your projects?
Sure, you can try to remember to keep running estimates of your time in the hope that you can aggregate 
those estimates later into some meaningfull data. But sometimes you forget, or an error creeps into your estimate.
And those errors add up. Quickly.

Watch Tower comes to the rescue.

WatchTower runs in the background and keeps track of the time spent editing each file with one of the 
supported editors (listed below). Since WatchTower keeps track of the time spent on each file, and it knows which
project each file belongs to, you can view details and statistics on each project, right down to the file level.

# Features

- Track editors (see Supported Editors) and record all files tracked under
  git or placed under __code_path__ defined in the config file.
- Display all projects on the home page that has been worked on the current
  month, the date range can be changed using the date picker on the home page
- For each project, a detailed overview of each file with the elapsed time
  within the selected date range

# Supported Editors

- TextMate
- Xcode

# Supported Operating Systems

- Mac OS X

# Getting Started

1. Install the Transmuter gem:

    ```bash
    $ gem install watch_tower --pre
    ```
2. Followed by:

    ```bash
    $ watchtower install
    $ watchtower load_bootloader
    ```

3. __Review the configuration file__ located at __~/.watch_tower/config.yml__ and make any changes necessary.

# Update

It is important to run

```bash
$ watchtower install_bootloader
$ watchtower reload_bootloader
```

because the path to watchtower binary file is hardcoded in the boot loader.

# Usage

The installation process should create a launcher on login which starts
__WatchTower__ you can open the web interface by going to
http://localhost:9282 or using the command

```bash
$ watchtower open
```

# Screenshots

## Home page

[![Home page](http://cloud.github.com/downloads/TechnoGate/watch_tower/home_page.png)](http://cloud.github.com/downloads/TechnoGate/watch_tower/home_page.png)

## Project page

[![Project page](http://cloud.github.com/downloads/TechnoGate/watch_tower/project_page.png)](http://cloud.github.com/downloads/TechnoGate/watch_tower/project_page.png)

# Contributing

Please feel free to fork and send pull requests, but please follow the
following guidelines:

- Prefix each commit message with the filename or the module followed by a
  colon and a space, for example 'README: fix a typo' or 'Server/Project: Fix
  a typo'.
- Include tests.
- Do not change the version, We will take care of that.

You can also take a look at the [TODO
list](https://github.com/TechnoGate/watch_tower/blob/master/TODO) for what's
in mind for the project

# Credits

This projects is heavily inspired by
[timetap](https://github.com/elia/timetap) created by [Elia
Schito](https://github.com/elia), it also uses a number of open source
projects including but not limited to:

- [rb-appscript](http://appscript.sourceforge.net/)
- [activesupport](https://github.com/rails/rails)
- [activerecord](https://github.com/rails/rails)
- [sinatra](https://github.com/sinatra/sinatra)
- [sinatra-snap](http://github.com/bcarlso/snap)
- [haml](http://haml-lang.com)
- [grit](https://github.com/mojombo/grit)
- [coffee-script](http://github.com/josh/ruby-coffee-script)
- [uglifier](https://github.com/lautis/uglifier)
- [sass](http://sass-lang.com)
- [sprockets](http://getsprockets.org/)
- [guard](https://github.com/guard/guard)
- [guard-bundler](https://github.com/guard/guard-bundler)
- [guard-rspec](https://github.com/guard/guard-rspec)
- [guard-sprockets2](https://github.com/stevehodgkiss/guard-sprockets2)
- [yard](http://github.com/lsegal/yard)
- [rspec](http://github.com/rspec/rspec)
- [rspec-rails](http://github.com/rspec/rspec-rails)
- [capybara](https://github.com/jnicklas/capybara)
- [launchy](https://github.com/copiousfreetime/launchy)
- [mocha](https://github.com/floehopper/mocha)
- [factory_girl](https://github.com/thoughtbot/factory_girl)
- [timecop](https://github.com/jtrupiano/timecop)
- [pry](https://github.com/pry/pry)

# License

## This code is free to use under the terms of the MIT license.

Copyright (c) 2011 TechnoGate &lt;support@technogate.fr&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.