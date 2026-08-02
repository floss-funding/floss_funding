# frozen_string_literal: true

module BenchGem22
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_2", "0") != "0"
  require "floss_funding"
  BenchGem22::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem22"))
end
