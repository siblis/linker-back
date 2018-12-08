class Collection < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links

  def as_json(options = {})
    super(options.deep_merge(include: { links: { only: [:name, :url, :comment] } }, except: [:user_id, :created_at, :updated_at]) { |key, val, opt_val| val + opt_val })
  end
end
