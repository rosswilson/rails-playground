class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Make ordering by the id field consistent since we're using UUIDs
  self.implicit_order_column = "created_at"
end
