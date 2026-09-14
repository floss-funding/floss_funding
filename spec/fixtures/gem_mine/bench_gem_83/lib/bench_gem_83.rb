# frozen_string_literal: true

module BenchGem83
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_8", "0") != "0"
  require "floss_funding"
  BenchGem83::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem83"))
end
