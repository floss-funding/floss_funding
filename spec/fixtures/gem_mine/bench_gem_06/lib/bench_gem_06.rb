# frozen_string_literal: true

module BenchGem06
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_0", "0") != "0"
  require "floss_funding"
  BenchGem06::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem06"))
end
