class EventNotification < DocumentValidator
  validate :verify_is_event

  def initialize(doc, s = Schemas::OpenHbx.get)
    super(document: doc, schema: s)
  end

  def save
    return false unless valid?
    true
  end

  def verify_is_event
    unless document.xpath("//cv:event/cv:event_name", XML_NS).any?
      errors.add(:document, "is not an event")
    end
  end

end
