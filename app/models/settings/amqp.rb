module Settings
  class Amqp < Settingslogic
    source "#{Rails.root}/config/amqp.yml"
    namespace Rails.env
  end
end
