# frozen_string_literal: true

module BenchGem80
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_7", "0") != "0"
  require "floss_funding"
  BenchGem80::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem80"))
end
