# frozen_string_literal: true

module BenchGem65
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_6", "0") != "0"
  require "floss_funding"
  BenchGem65::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem65"))
end
