# frozen_string_literal: true

module BenchGem94
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_9", "0") != "0"
  require "floss_funding"
  BenchGem94::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem94"))
end
