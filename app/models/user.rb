class User < ApplicationRecord
  has_many :collections, dependent: :destroy
end
