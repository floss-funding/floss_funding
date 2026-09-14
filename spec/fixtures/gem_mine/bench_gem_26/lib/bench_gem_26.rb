# frozen_string_literal: true

module BenchGem26
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_2", "0") != "0"
  require "floss_funding"
  BenchGem26::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem26"))
end
