# frozen_string_literal: true

module BenchGem39
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_3", "0") != "0"
  require "floss_funding"
  BenchGem39::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem39"))
end
