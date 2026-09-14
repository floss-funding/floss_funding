# frozen_string_literal: true

module BenchGem54
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_5", "0") != "0"
  require "floss_funding"
  BenchGem54::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem54"))
end
