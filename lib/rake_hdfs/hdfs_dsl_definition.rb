require 'rake/file_utils_ext'
module Rake
    module DSL
        def hfile(*args, &block) # :doc:
          Rake::HDFSFileTask.define_task(*args, &block)
        end

        def hfile_create(*args, &block)
          Rake::HDFSFileCreationTask.define_task(*args, &block)
        end

        def hdirectory(*args, &block) # :doc:
          result = hfile_create(*args, &block)
          dir, _ = *Rake.application.resolve_args(args)
          dir = Rake.from_pathname(dir)
          Rake.each_dir_parent(dir) do |d|
            hfile_create d do |t|
              hmkdir_p t.name unless WebHDFS::FileUtils.exist?(t.name)
            end
          end
          result
        end
    end
end