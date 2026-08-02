# frozen_string_literal: true

module BenchGem74
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_7", "0") != "0"
  require "floss_funding"
  BenchGem74::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem74"))
end
