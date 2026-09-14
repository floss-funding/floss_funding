# frozen_string_literal: true

module BenchGem98
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_9", "0") != "0"
  require "floss_funding"
  BenchGem98::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem98"))
end
