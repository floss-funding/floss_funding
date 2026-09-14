# frozen_string_literal: true

module BenchGem25
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_2", "0") != "0"
  require "floss_funding"
  BenchGem25::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem25"))
end
