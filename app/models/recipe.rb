class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 20, maximum: 500 }
  validates :description, presence: true, length: { minimum: 10, maximum: 150 }
end