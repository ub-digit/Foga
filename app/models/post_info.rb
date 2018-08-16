class PostInfo < ApplicationRecord

	belongs_to :operation

	validates :title, 
		:presence => {message: 'Du måste fylla in titel.'}
	
	validates :operation_id, 
		:presence => {message: 'Du måste välja en operation.'}

	validates :publisher,
		:presence => {message: 'Du måste fylla i utgivare.'}

	
end
