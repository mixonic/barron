module Barron
  require 'barron/tmpfile'

  VERSION = '0.1.1'

  def lock *args, &block
    Barron.lock *args, &block
  end

  class << self

    def lock *args, &block
      Barron::Tmpfile.lock *args, &block
    end

  end

end
