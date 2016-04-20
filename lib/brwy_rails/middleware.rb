module BrwyRails
  class Middleware
    def initialize(app)
      @app = app
    end

    def is_asset_js?(path)
      path.start_with?("/assets/") && File.extname(path) == ".js"
    end

    def to_asset_path(target)
      target_suffix = Rails.application.config.brwy_rails.target_suffix
      extname = File.extname(target)
      "/assets/" + File.basename(target).sub(extname, "") + target_suffix
    end

    def in_targets?(path)
      targets = Rails.application.config.brwy_rails.targets
      canditates = targets.map {|t| to_asset_path(t)}
      puts canditates
      canditates.any? {|c| path.start_with?(c)}
    end

    def get_tmp_path path
      target_suffix = Rails.application.config.brwy_rails.target_suffix
      m = /assets\/(.*)#{target_suffix.sub(".", "\.")}/.match path
      name = m[1]
      "#{Rails.root.to_s}/#{Rails.application.config.brwy_rails.tmpdir}/#{name}#{target_suffix}.js"
    end

    def file_is_readable?(path)
      File.exists?(path) && File.size(path) > 0
    end

    def is_target_js?(path)
      is_asset_js?(path) && in_targets?(path)
    end

    def call(env)
      req = Rack::Request.new env
      if is_target_js? req.path
        tmp_path = get_tmp_path(req.path)
        loop do
          if file_is_readable? tmp_path
            break
          else
            sleep 1
          end
        end
      end
      @app.call(env)
    end
  end
end
