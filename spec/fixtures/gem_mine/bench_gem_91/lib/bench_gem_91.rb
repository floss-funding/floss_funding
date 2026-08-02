# frozen_string_literal: true

module BenchGem91
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_9", "0") != "0"
  require "floss_funding"
  BenchGem91::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem91"))
end
