class EventsController < ApplicationController
  def create
    respond_to do |format|
      format.xml { 
        handle_xml_response(params, request)
      }
    end
  end

  def handle_xml_create(pars, req)
    document = Nokogiri::XML(req.body.read)
    notification = EventNotification.new(document)
    if notification.save
      xml_accepted(notification)
    else
      xml_invalid(notification)
    end
  end

  def xml_invalid(notification)
    render :xml => notification.errors, :status => :unprocessable_entity
  end

  def xml_accepted(notification)
    render :nothing => true, :status => :accepted 
  end
end
