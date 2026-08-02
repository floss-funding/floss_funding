# frozen_string_literal: true

module BenchGem32
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_3", "0") != "0"
  require "floss_funding"
  BenchGem32::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem32"))
end
