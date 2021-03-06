class Subclass < ActiveRecord::Base
  belongs_to :catalog
  has_many :subclass_products, dependent: :destroy
  has_many :classified_products, :through => :subclass_products, :source => :product

  validates_presence_of :name, :description, :catalog_id
end
