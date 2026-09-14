# frozen_string_literal: true

module BenchGem84
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_8", "0") != "0"
  require "floss_funding"
  BenchGem84::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem84"))
end
