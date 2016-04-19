module WatchifyRails
  class Runner
    attr_accessor :config

    def initialize(config)
      @config = config
    end

    def run
      if watching?
        pids = @config.targets.map {|target|
          run_with_watchify(target)
        }
        at_exit do
          pids.each {|pid| Process.exit(pid)}
        end
      else
        @config.targets.map {|target|
          run_with_browserify(target)
        }
      end
    end

    private
    def watching?
      @config.watch
    end

    def run_with_watchify(target)
      ensure_output_dir!
      spawn watchify_cmd(target), chdir: Rails.root
    end

    def run_with_browserify(target)
      ensure_output_dir!
      spawn browserify_cmd(target), chdir: Rails.root
    end

    def browserify_cmd(target)
      "browserify #{cmd target}"
    end

    def watchify_cmd(target)
      "watchify #{cmd target} #{verbose? ? "-v" : ""}"
    end

    def cmd(target)
      "#{@config.browserify_opts} -o #{output_path(target)} #{src_path(target)}"
    end

    def output_dir
      Rails.root.join(@config.tmpdir)
    end

    def output_path(target)
      # TODO: Consider nested dir
      # Use relative path later
      output_dir.join(File.basename target)
    end

    def src_path(target)
      Rails.root.join(target)
    end

    # TODO: Add ensure_target_dir!(target) later
    def ensure_output_dir!
      FileUtils.mkdir_p(output_dir) unless FileTest.exist?(output_dir)
    end

    def verbose?
      @config.verbose
    end
  end
end
