class PaverApp < ActiveRecord::Base
    def self.search(search)
    where("Name LIKE ?", "%#{search}%")
    end
end
