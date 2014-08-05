require "rails_helper"

describe Settings::Amqp do
  it "should have a uri value" do
    expect(Settings::Amqp.uri).not_to be_blank
  end
end
