# Watch Tower [![Build Status](http://travis-ci.org/TechnoGate/watch_tower.png)](http://travis-ci.org/TechnoGate/watch_tower) ![Still Maintained](http://stillmaintained.com/TechnoGate/watch_tower.png)

[![Click here to lend your support to: Open Source Projects and make a donation at www.pledgie.com !](http://www.pledgie.com/campaigns/16123.png?skin_name=chrome)](http://www.pledgie.com/campaigns/16123)

WatchTower helps you track the time you spend on each project.

# Introduction

Are you tired of not-knowing how much each of your projects really costs? Watch Tower
comes to the rescue.

WatchTower runs in the background and it monitors your editors (see Supported
Editors) and records the time you spend on each file and thus on the project
in total, and using a web interface, it presents you with statistics on each
project

# Installation

The installation has been made as simple as possible, here's the steps required:

```bash
$ gem install watch_tower
$ watchtower intall
```

This creates a configuration file which you __should__ review before invoking
__WatchTower__, located at __~/.watch_tower/config.yml__ the configuration file
is self explanatory.

# Usage

The installation process should create a launcher on login which starts
__WatchTower__ you can open the web interface by going to
http://localhost:9282 or using the command

```bash
$ watchtower open
```

# Screenshots

## Home page

[!Home page](http://cloud.github.com/downloads/TechnoGate/watch_tower/home_page.png)

## Project page

[!Project page](http://cloud.github.com/downloads/TechnoGate/watch_tower/project_page.png)

# License

## This code is free to use under the terms of the MIT license.

Copyright (c) 2011 Wael Nasreddine <wael.nasreddine@gmail.com>

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