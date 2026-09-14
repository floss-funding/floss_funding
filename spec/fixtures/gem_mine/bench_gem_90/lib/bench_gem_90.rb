# frozen_string_literal: true

module BenchGem90
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_8", "0") != "0"
  require "floss_funding"
  BenchGem90::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem90"))
end
