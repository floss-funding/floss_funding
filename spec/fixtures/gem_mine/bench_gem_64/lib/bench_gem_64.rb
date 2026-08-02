# frozen_string_literal: true

module BenchGem64
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_6", "0") != "0"
  require "floss_funding"
  BenchGem64::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem64"))
end
