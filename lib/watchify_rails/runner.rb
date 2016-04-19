module WatchifyRails
  class Runner
    attr_accessor :config

    def initialize(config)
      @config = config
    end

    def output_dir
      Rails.root.join(@config.tmpdir)
    end

    def src_path
      Rails.root.join(@config.tmpdir)
    end

    def ensure_output_dir!
      FileUtils.mkdir_p(output_dir) unless FileTest.exist?(output_dir)
    end

    def browserify_cmd(target)
      src_path = Rails.root.join(target)
      output_path = output_dir.join(File.basename target)
      "watchify #{@config.browserify_opts} #{if @config.verbose then "-v" else "" end} -o #{output_path} #{src_path}"
    end

    def run_with_watchify(target)
      ensure_output_dir!
      spawn browserify_cmd(target), chdir: Rails.root
    end
  end
end
