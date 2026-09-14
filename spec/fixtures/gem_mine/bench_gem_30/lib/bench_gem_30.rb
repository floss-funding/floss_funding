# frozen_string_literal: true

module BenchGem30
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_2", "0") != "0"
  require "floss_funding"
  BenchGem30::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem30"))
end
