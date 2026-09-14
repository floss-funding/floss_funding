# frozen_string_literal: true

module BenchGem49
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_4", "0") != "0"
  require "floss_funding"
  BenchGem49::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem49"))
end
