class Paver < ActiveRecord::Base
	validates :Email,  presence: true, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } #, :on => :purchase_create
   
    def self.search(search)
    where("Name LIKE ?", "%#{search}%")
    end
end

