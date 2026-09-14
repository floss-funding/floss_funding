# frozen_string_literal: true

module BenchGem33
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_3", "0") != "0"
  require "floss_funding"
  BenchGem33::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem33"))
end
