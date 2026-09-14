# frozen_string_literal: true

module BenchGem14
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_1", "0") != "0"
  require "floss_funding"
  BenchGem14::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem14"))
end
