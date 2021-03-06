module Barron::Tmpfile

  require 'digest/md5'

  class << self

    def lock name, options={}
      options = {
        :block => true,
        :tmpdir => '/tmp'
      }.merge(options)
      value = nil
      open("#{options[:tmpdir]}/barron-#{Digest::MD5.hexdigest("#{name}")}", File::RDWR|File::CREAT, 0666) do |f|
        begin
          if options[:block]
            f.flock(File::LOCK_EX)
            begin
              f.chmod(0666)
            rescue Errno::EPERM
            end
            value = yield f
          elsif f.flock(File::LOCK_EX|File::LOCK_NB)
            begin
              f.chmod(0666)
            rescue Errno::EPERM
            end
            value = yield f
          end
        ensure
          f.flock(File::LOCK_UN)
        end
      end
      value
    end

  end

end
