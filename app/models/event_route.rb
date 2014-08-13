class EventRoute
  include ActiveModel::Model
  attr_accessor :exchange_name, :exchange_kind, :routing_key

  def resolve_exchange(channel)
    if "default" == self.exchange_kind.to_s.downcase
      return channel.default_exchange
    end
    channel.send(*[self.exchange_kind.to_s, self.exchange_name.to_s])
  end
end
