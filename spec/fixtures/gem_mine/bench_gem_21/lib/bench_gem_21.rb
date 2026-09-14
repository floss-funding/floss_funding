# frozen_string_literal: true

module BenchGem21
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_2", "0") != "0"
  require "floss_funding"
  BenchGem21::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem21"))
end
