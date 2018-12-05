class Collection < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links

  def as_json(options)
    super(options.merge({ include: { links: { only: [:name, :url, :comment] } }, except: [:user_id, :created_at, :updated_at] }))
  end
end
