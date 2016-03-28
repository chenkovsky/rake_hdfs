require "webhdfs"
module WebHDFS
  module FileUtils
    def exist?(file, options={})
      begin
        client.stat(path, options)
        return true
      rescue FileNotFoundError => e
        return false
      end
    end
    module_function :exist?
    def ls(path, options={})
      opts = options.dup
      fu_log "ls #{path}" if opts.delete(:verbose)
      client.list(path, options)
    end
    module_function :ls

    def stat(path, options={})
      opts = options.dup
      fu_log "stat #{path}" if opts.delete(:verbose)
      client.stat(path, options)
    end
    module_function :stat

    def uptodate?(new, old_list, options = {})
      return false unless exist?(new)
      new_time = mtime(new)
      old_list.each do |old|
        if exist?(old)
          return false unless new_time > mtime(old)
        end
      end
      true
    end
    module_function :uptodate?

    def mtime(path, options = {})
      file_stat = stat(path, options)
      file_stat["FileStatus"]["modificationTime"]
    end
    module_function :mtime
  end
end

module FileUtils
  def hdfs_copy_from_local(file, path, options={})
    WebHDFS::FileUtils.copy_from_local(file, path, options)
  end
  module_function :hdfs_copy_from_local

  alias :hcopy_from_local :hdfs_copy_from_local
  module_function :hcopy_from_local

  def hdfs_copy_from_local_via_stream(file, path, options={})
    WebHDFS::FileUtils.copy_from_local_via_stream(file, path, options)
  end
  module_function :hdfs_copy_from_local_via_stream
  alias :hcopy_from_local_via_stream :hdfs_copy_from_local_via_stream
  module_function :hcopy_from_local_via_stream

  def hdfs_copy_to_local(path, file, options={})
    WebHDFS::FileUtils.copy_to_local(path, file, options)
  end

  module_function :hdfs_copy_to_local

  alias :hcopy_to_local :hdfs_copy_to_local
  module_function :hcopy_to_local

  def hdfs_append(path, body, options={})
    WebHDFS::FileUtils.append(path,body,options)
  end
  module_function :hdfs_append

  alias :happend :hdfs_append
  module_function :happend

  def hdfs_mkdir(list, options={})
    WebHDFS::FileUtils.mkdir(list, options)
  end

  module_function :hdfs_mkdir

  alias :hmkdir :hdfs_mkdir
  module_function :hmkdir

  alias :hdfs_mkdir_p :hdfs_mkdir
  module_function :hdfs_mkdir_p

  alias :hmkdir_p :hdfs_mkdir
  module_function :hmkdir_p

  def hdfs_rm(list, options={})
    WebHDFS::FileUtils.rm(list, options)
  end
  module_function :hdfs_rm
  alias :hrm :hdfs_rm
  module_function :hrm

  def hdfs_rmr(list, options={})
    WebHDFS::FileUtils.rmr(list, options)
  end
  module_function :hdfs_rmr

  alias :hrmr :hdfs_rmr
  module_function :hrmr

  def hdfs_rename(src, dst, options={})
    WebHDFS::FileUtils.rename(src, dst, options)
  end

  module_function :hdfs_rename

  alias :hrename :hdfs_rename
  module_function :hrename

  def hdfs_chmod(mode, list, options={})
    WebHDFS::FileUtils.chmod(mode, list, options)
  end

  module_function :hdfs_chmod

  alias :hchmod :hdfs_chmod
  module_function :hchmod

  def hdfs_chown(user, group, list, options={})
    WebHDFS::FileUtils.chown(user, group, list, options)
  end

  module_function :hdfs_chown

  alias :hchown :hdfs_chown
  module_function :hchown

  def hdfs_set_repl_factor(list, num, options={})
    WebHDFS::FileUtils.set_repl_factor(list, num, options)
  end
  module_function :hdfs_set_repl_factor

  alias :hset_repl_factor :hdfs_set_repl_factor
  module_function :hset_repl_factor

  def hdfs_set_atime(list, time, options={})
    WebHDFS::FileUtils.set_atime(list, time, options)
  end

  module_function :hdfs_set_atime

  alias :hset_atime :hdfs_set_atime
  module_function :hset_atime

  def  hdfs_set_mtime(list, time, options={})
    WebHDFS::FileUtils.set_mtime(list, time, options)
  end

  module_function :hdfs_set_mtime

  alias :hset_mtime :hdfs_set_mtime
  module_function :hset_mtime

  def hdfs_ls(path, options={})
    WebHDFS::FileUtils.ls(path, options)
  end

  module_function :hdfs_ls
  alias :hls :hdfs_ls
  module_function :hls

  def hdfs_stat(path, options={})
    WebHDFS::FileUtils.stat(path, options)
  end

  module_function :hdfs_stat
  alias :hstat :hdfs_stat
  module_function :hstat

  def hdfs_exist?(path, options={})
     WebHDFS::FileUtils.exist?(path, options)
  end

  module_function :hdfs_exist?
  alias :hexist? :hdfs_exist?
  module_function :hexist?

  def hdfs_uptodate?(new, old_list, options={})
     WebHDFS::FileUtils.uptodate?(new, old_list, options)
  end

  module_function :hdfs_uptodate?
  alias :huptodate? :hdfs_uptodate?
  module_function :huptodate?

  def hdfs_mtime(path, options={})
    WebHDFS::FileUtils.mtime(path, options)
  end

  module_function :hdfs_mtime
  alias :hmtime :hdfs_mtime
  module_function :hmtime

end
