class Invoice < ActiveRecord::Base
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant
end
