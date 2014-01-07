#class WebhookProcessor < ActiveRecord::Base
  # attr_accessible :title, :body

  def process(event)
    data_json = JSON.parse(event)
    event_type = data_json['type']
    case event_type
    when "invoice.payment_succeeded"
      make_active(data_json) # Business logic, when payment succeeds
    when "invoice.payment_failed"
      make_inactive(data_json) # Business logic, when payment fails.
  end
  #def make_active(data_json)
  #   u = User.find_by_email(data_json["email"])
  #  u.role = "Paid"
  # end
  # def make_inactive(data_json)
  # end  

#end
