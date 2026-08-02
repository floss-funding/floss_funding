# frozen_string_literal: true

module BenchGem28
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_2", "0") != "0"
  require "floss_funding"
  BenchGem28::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem28"))
end
