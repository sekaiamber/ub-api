class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def err_pack
    return if errors.blank?

    err_items = errors.full_messages.map do |message|
      ErrItem.new(model_name.singular, "validation", :message => message)
    end

    ErrPack.new(*err_items, :http_status_code => 200)
  end
end
