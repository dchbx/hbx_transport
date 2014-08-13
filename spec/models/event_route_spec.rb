require 'rails_helper'

describe EventRoute do

  subject { 
    EventRoute.new(
      exchange_kind: exchange_kind,
      exchange_name: exchange_name,
      routing_key: ""
    )
  }
  
  describe "With a default exchange specified" do
    let(:exchange_name) { "whutever" }
    let(:exchange_kind) { "default" }
    let(:default_exchange) { double }

    it "should resolve the correct exchange" do
      channel = double(:default_exchange => default_exchange)
      expect(subject.resolve_exchange(channel)).to eql(default_exchange)
    end
  end

  describe "With a topic exchange specified" do
    let(:exchange_name) { "whutever" }
    let(:exchange_kind) { "topic" }
    let(:topic_exchange) { double }

    it "should resolve the correct exchange" do
      channel = double
      allow(channel).to receive(:topic).with(exchange_name).and_return(topic_exchange)
      expect(subject.resolve_exchange(channel)).to eql(topic_exchange)
    end
  end

end
