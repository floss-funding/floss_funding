# frozen_string_literal: true

module BenchGem05
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_0", "0") != "0"
  require "floss_funding"
  BenchGem05::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem05"))
end
