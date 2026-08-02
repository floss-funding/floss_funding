# frozen_string_literal: true

module BenchGem61
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_6", "0") != "0"
  require "floss_funding"
  BenchGem61::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem61"))
end
