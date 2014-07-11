module Trekky
  class Parser
    attr_reader :source, :source_dir, :target_dir

    def initialize(source, source_dir, target_dir)
      @source = source
      @source_dir = source_dir
      @target_dir = target_dir
    end

    def render
      raise NotImplementedError
    end

    private

    def prepare(type, extension)
      target = source.gsub(source_dir, target_dir).gsub(/\.#{type}/, '')
      if File.extname(target) == ''
        target += ".#{extension}"
      end
      puts "Compiling #{source} to #{target} with #{type.upcase}"
      File.open(target, 'w') do |f|
        yield(f)
      end
    end

  end
end
