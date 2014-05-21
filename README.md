Acts As HTML Sanitized
======================

[![Gem Version](https://badge.fury.io/rb/acts_as_html_sanitized.svg)](http://badge.fury.io/rb/acts_as_html_sanitized)
[![Build Status](https://travis-ci.org/sgerrand/acts_as_html_sanitizer.svg?branch=master)](https://travis-ci.org/sgerrand/acts_as_html_sanitizer)
[![Code Climate](https://codeclimate.com/github/sgerrand/acts_as_html_sanitizer.png)](https://codeclimate.com/github/sgerrand/acts_as_html_sanitizer)

![...and I hope you've learned to sanitize your database inputs](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)

Sanitize your database inputs!

Requirements
------------

### Ruby and Rails

Acts As HTML Sanitized requires Ruby version **>= 1.9.3** and Rails
version **>= 3.2**. That's it.

Installation
------------

Acts As HTML Sanitized is distributed as a gem, which is how it should be used in
your app.

```ruby
gem 'acts_as_html_sanitized'
```

Quick Start
-----------

### Models

```ruby
class User < ActiveRecord::Base
  acts_as_html_sanitized
end
```

This will cause the content of any attribute in the `User` model being
stripped of HTML prior to being validated.

Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Post a [pull request](https://github.com/sgerrand/acts_as_html_sanitized/compare/).
2. Make sure there are tests! We will not accept any patch that is not
   tested. It's a rare time when explicit tests aren't needed. If you have
   questions about writing tests for paperclip, please open a
   [GitHub issue](https://github.com/sgerrand/acts_as_html_sanitized/issues/new).

Please see `CONTRIBUTING.md` for more details on contributing and
running tests.

License
-------

Acts As HTML Sanitized is Copyright © 2014 Sasha Gerrand. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.
