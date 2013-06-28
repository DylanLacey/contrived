contrived
=========

An Example showing how Sauce Labs can enhance your testing.

NOTE:  This example is extremely contrived.


Pre-requisites
--------------------

First, you'll need a Sauce Labs username and password, which you can get for free at (https://saucelabs.com/signup).  Don't forget to add a promo code if you have one!

Next, set the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables to your username and access key, respectively.  Your access key can be found on the lower left hand side of your Sauce Labs jobs page.

Have or install Ruby (I use [RVM](https://rvm.io/)).  OS X Comes with an OLD version of Ruby... I recommend updating to 1.9

Have or install [git](http://git-scm.com/).

Install bundler with `gem install bundler`

Lastly, clone the example repository `git clone https://github.com/DylanLacey/contrived.git` and cd into its directory.


Examples
--------

### No Sauce

The first example shows a test, running on your local copy of firefox.  It opens Firefox and performs each test sequentially.

1.  Check the example out: `git checkout no-sauce`
2.  Install all required gems:  `bundle update`
3.  Run the example:  `bundle exec rspec`


### Sequential Sauce

The second example shows both tests being run sequentially on Sauce Labs' infrastructure.  The examples are run using IE 10 on Windows 8.

1.  Check the example out:  `git checkout sequential-sauce`
2.  Install all required gems:  `bundle update`
3.  Run the example:  `bundle exec rspec`
4.  Log into your Sauce Labs account once the test completes, and check it out

If you compare this code with the previous examples, you'll see just how easy it is to run tests on Sauce Labs.

The major change is that we registered a new driver for Capybara (the tool allowing us to write simple directions for driving browsers), and that driver uses a remote Selenium server.  You can see it in `spec/sauce_driver.rb` line 7 - 9.  It's a simple matter of telling the WebDriver object to use a remote browser, pointing it at Sauce Labs' service, and requesting IE.

This example also illustrates one of the caveats for Selenium.  It doesn't have a concept of "passing" or "failing" tests, all it's concerned with is whether or not certain actions and content are available.  When you log into our serivce, you'll see that the job is un-named, and the result is "Finished".  You could fix this using our [REST API](http://saucelabs.com/docs/rest).


### Parallel Sauce

The third example shows the power of abstracting away your infrastructure and using Sauce Labs to run your integration tests.

Four browsers are used:

* IE 10 on Windows 8
* Safari 5 on iPad
* Opera 12 on Linux
* Safari 6 on OSX 10.8

We're going to see 8 tests in total, one for each test on every browser.

We're also using the sauce gem to give us automatic parallelization, result reporting and test naming.

1.  Check the example out:  `git checkout parallel-sauce`
2.  Install all required gems:  `bundle update`
3.  Run the example:  `bundle exec sauce:spec`
4.  Log into your Sauce Labs account and watch your tests run

You'll notice you can load tests while they're running, and watch the test taking place.  It's even possible to interrupt tests and take them over, which helps immensely with debugging.
