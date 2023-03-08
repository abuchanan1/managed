class Property < ApplicationRecord
  # belongs_to :owner
belongs_to :owner, class_name: "User"
end
