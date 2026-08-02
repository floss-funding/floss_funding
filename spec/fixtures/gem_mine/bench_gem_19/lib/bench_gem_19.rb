# frozen_string_literal: true

module BenchGem19
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_1", "0") != "0"
  require "floss_funding"
  BenchGem19::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem19"))
end
