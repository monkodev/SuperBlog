class Post < ActiveRecord::Base
	validates :titulo, presence: true
	validates :texto, presence: true, length: { minimum: 250 }
	belongs_to :user
	has_many :comentarios, dependent: :destroy
end
