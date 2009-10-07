Easy MapReduce with Mandy
=========================


Installation Instructions
=========================

We'll need to install a few pre-requisites ([Hadoop](http://hadoop.apache.org/), [RubyGems](http://docs.rubygems.org/),
[Mandy](http://github.com/trafficbroker/mandy)) first. We also expect you already have Java 1.6 installed, Ruby 1.8.6
(or 1.8.7) and some recent-ish version of RubyGems.

Hadoop
------

1. Install Hadoop
	1. Download [http://mirrors.dedipower.com/ftp.apache.org/hadoop/core/hadoop-0.20.1/](http://mirrors.dedipower.com/ftp.apache.org/hadoop/core/hadoop-0.20.1/)
	2. Unpack into `~/Tools` (or somewhere similar). We'll update the path next.

2. Update your PATH and profile
	1. Edit `~/.profile` (or other) and add the lines from `./PROFILE`. This contains lines to set `JAVA_HOME`,
	`HADOOP_HOME` and add Hadoop to your path.

3. Check it's working
	1. Reload your profile by executing `source ~/.profile`
	2.	Show the Hadoop version by executing `hadoop version`. If this fails with an error:
	`Exception in thread "main" java.lang.UnsupportedClassVersionError: Bad version number in .class file` you'll need
	to make sure you're running Java 1.6 (`java -version`).
	
		You should see the following: `Hadoop 0.20.1
	Subversion http://svn.apache.org/repos/asf/hadoop/common/tags/release-0.20.1-rc1 -r 810220
	Compiled by oom on Tue Sep  1 20:55:56 UTC 2009`
	
RubyGems
--------

Mandy uses Gem Bundler which requires the latest release of RubyGems (at least 1.3.5). To update:

1. `sudo gem update --system`

Mandy
-----

Mandy is hosted by GemCutter.org, it can be installed in two ways:

1. Install the Gem Cutter gem: `sudo gem install gemcutter`
2. Add gemcutter.org to sources: `gem tumble`
3. Install Mandy: `sudo gem install mandy`

or, install directly from gemcutter.org

1. `sudo gem install mandy --source http://gemcutter.org`

You should be able to run the following command to confirm Mandy is now installed: `mandy`