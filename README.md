# RakeHdfs

this gem makes rake run on hdfs file system. it's based on webhdfs.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake_hdfs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_hdfs

## Usage

```ruby
require "webhdfs/fileutils"
require "rake_hdfs"
$dir = "/user/chenkovsky.chen"

WebHDFS::FileUtils.set_server("localhost", 50070, "chenkovsky", nil)

hdirectory "#{$dir}/tmp_dir"
desc "test hdfs rake"
hfile "#{$dir}/tmp_dir/tmp.txt" => ["#{$dir}/tmp_dir"] do
  raise "tmp file should not exist." if hexist? "#{$dir}/tmp_dir/tmp.txt"
  files = hls $dir
  puts files
  dir_mtime = hmtime $dir
  puts dir_mtime
  hcopy_from_local "tmp.txt", "#{$dir}/tmp_dir/tmp.txt"
  hcopy_from_local_via_stream "tmp.txt", "#{$dir}/tmp_dir/tmp2.txt"

  hcopy_to_local "#{$dir}/tmp_dir/tmp.txt", "tmp3.txt"

  happend("#{$dir}/tmp_dir/tmp2.txt", "hahaha")

  hmkdir "#{$dir}/tmp2_dir"

  raise "tmp2_dir should not exist." if not hexist? "#{$dir}/tmp2_dir"

  hrm "#{$dir}/tmp2_dir"
  hmkdir "#{$dir}/tmp3_dir"
  hcopy_from_local "tmp.txt", "#{$dir}/tmp3_dir/tmp.txt"

  hrmr "#{$dir}/tmp3_dir"

  hrename "#{$dir}/tmp_dir/tmp2.txt", "#{$dir}/tmp_dir/tmp4.txt"

  hchmod 0755, "#{$dir}/tmp_dir/tmp4.txt"

  puts (hstat "#{$dir}/tmp_dir/tmp4.txt")
  raise "not correct uptodate" unless huptodate? "#{$dir}/tmp_dir/tmp4.txt", ["#{$dir}/tmp_dir/tmp.txt"]
end
```

## Contributing

1. Fork it ( https://github.com/chenkovsky/rake_hdfs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
