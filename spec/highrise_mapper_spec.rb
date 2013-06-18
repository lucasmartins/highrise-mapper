require "spec_helper"
require 'pry'
require 'pry-nav'

describe HighriseMapper, "::config" do
  it "returns a valid configuration Hash" do
    config = HighriseMapper.config('templates')
    config.should be_a_kind_of(Hash)
    config.should have_key('person')
  end
end