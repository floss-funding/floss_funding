# frozen_string_literal: true

module BenchGem52
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_5", "0") != "0"
  require "floss_funding"
  BenchGem52::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem52"))
end
