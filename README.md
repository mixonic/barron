Barron
------

Barron provides a Ruby API and simple command-line interface
for checking locks on a given system. Currently it uses filesystem
locks, but eventually a system-wide configurable setup would be
ideal.

Barron can check for a lock, or wait until a resource becomes
free.

``` bash
barron my-resource # Will return success if available, or an error code if locked elsewhere
barron my-resource --block # Will wait until the resource becomes free
```

You can check locks on those same resources in Ruby:

``` ruby
class MyClass
  # You can call `Barron.lock` directly,
  # or include the method into your namespace.
  include Barron

  def my_work

    lock "my-resource", block: false do
      # This will only run if the resource
      # is free when `lock` is called.
    end

    lock "my-resource" do
      # `lock` will wait until the resource
      # is free, then perform this work.
    end

  end
end
```

--
**Installation**

``` bash
gem install barron
```

And you're done!

--
**Additional Info**

Barron is licensed under the MIT License.

[Robert Barron](http://en.wikipedia.org/wiki/Robert_Barron_(locksmith\)) invented the double–acting tumbler lock in 1778.

Written by Matthew Beale (matt.beale@madhatted.com).
