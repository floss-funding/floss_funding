# frozen_string_literal: true

module BenchGem42
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_4", "0") != "0"
  require "floss_funding"
  BenchGem42::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem42"))
end
