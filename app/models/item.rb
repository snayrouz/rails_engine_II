class Item < ApplicationRecord
  validates_presence_of :name, :description

  belongs_to :merchant
end
