class Service < ActiveRecord::Base
  belongs_to :category
  has_many :crafters
end
