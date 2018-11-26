class Collection < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links

  #def as_json(options={})
  #  super(:include => :links)
  #end
end
