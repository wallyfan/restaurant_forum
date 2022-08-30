class Category < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :restaurants, dependent: :restrict_with_exception
end
