# RakeHadoop

this gem makes rake run on hdfs file system. it's based on webhdfs.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake_hadoop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_hadoop

## Usage

```ruby
hfile "file_name_on_hdfs" do 
    # use it like file, except it's on hdfs
end

hdirectory "directory_on_hdfs"

task "a" do
    unless huptodate? "file_on_hdfs", ["file_on_hdfs1",...]
        hstat "filename"
        hmkdir_p "dir_name"
        hrm "dir_name"
        hexist? "filename"
        hchmod mode, "file"
        hls "dir_name"
    end
end
```

## Contributing

1. Fork it ( https://github.com/chenkovsky/rake_hadoop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
