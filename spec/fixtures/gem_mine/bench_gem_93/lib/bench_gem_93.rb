# frozen_string_literal: true

module BenchGem93
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_9", "0") != "0"
  require "floss_funding"
  BenchGem93::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem93"))
end
