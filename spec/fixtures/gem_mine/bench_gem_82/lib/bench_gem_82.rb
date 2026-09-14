# frozen_string_literal: true

module BenchGem82
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_8", "0") != "0"
  require "floss_funding"
  BenchGem82::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem82"))
end
