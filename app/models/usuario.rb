class Usuario < ActiveRecord::Base
	validates :nombre, presence: true
	validates :usuario, presence: true
end
