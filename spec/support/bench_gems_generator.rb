# frozen_string_literal: true

require "gem_mine"
require "fileutils"

module FlossFunding
  module BenchGemsGenerator
    module_function

    # Generate benchmark fixture gems through the released GemMine API.
    def generate_all(count = 100)
      root_dir = File.expand_path("../fixtures/gem_mine", __dir__)
      return if fixtures_complete?(root_dir, count)

      lock_path = File.expand_path("../../tmp/floss_funding-bench-gems.lock", __dir__)
      FileUtils.mkdir_p(File.dirname(lock_path))
      File.open(lock_path, "w") do |lock|
        lock.flock(File::LOCK_EX)
        next if fixtures_complete?(root_dir, count)

        GemMine.clean(root_dir)
        FileUtils.mkdir_p(root_dir)

        count.times do |offset|
          index = offset + 1
          name = format("bench_gem_%02d", index)
          namespace = GemMine::Helpers.camelize(name)
          group = offset / 10
          scaffold = GemMine.scaffold(name, root: File.join(root_dir, name), build: false, install: false)

          File.write(scaffold.lib_path, benchmark_fixture_source(namespace, group))
        end
      end
    end

    def fixtures_complete?(root_dir, count)
      count.times.all? do |offset|
        index = offset + 1
        name = format("bench_gem_%02d", index)
        File.file?(File.join(root_dir, name, "lib", "#{name}.rb"))
      end
    end

    def benchmark_fixture_source(namespace, group)
      <<-RUBY
        # frozen_string_literal: true

        module #{namespace}
          module Core; end
        end

        if ENV.fetch("GEM_MINE_GROUP_#{group}", "0") != "0"
          require "floss_funding"
          #{namespace}::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: #{namespace.inspect}))
        end
      RUBY
    end
  end
end
