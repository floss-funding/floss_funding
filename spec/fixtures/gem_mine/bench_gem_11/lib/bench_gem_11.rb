# frozen_string_literal: true

module BenchGem11
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_1", "0") != "0"
  require "floss_funding"
  BenchGem11::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem11"))
end
