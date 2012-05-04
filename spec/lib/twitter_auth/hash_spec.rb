# encoding: UTF-8

require 'spec_helper'

describe TwitterAuth::User do
  let(:dummy_hash) { TwitterAuth::Hash.new ({ a: { b: 3 } }) }
  it { dummy_hash.should respond_to(:a) }
  it { dummy_hash.a.should respond_to(:b) }
  it { dummy_hash.a.b.should eq(3) }
  it "should raise NoMethodError" do
    expect {
      dummy_hash.b
    }.should raise_error(NoMethodError)
  end
end