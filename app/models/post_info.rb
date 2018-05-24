class PostInfo < ApplicationRecord

	belongs_to :operation

	validates :title, 
		:presence => {message: 'Du måste fylla in titel.'},
		:uniqueness => {message: 'Denna post finns redan.'}
	
	validates :operation_id, 
		:presence => {message: 'Du måste välja en operation.'}


	# User validation may be redundant once authentication works.
	validates :created_by, 
		:presence => {message: 'Skapad av får inte vara tom.'}
	
	validates :updated_by, 
		:presence => {message: 'Updaterad av får inte vara tom.'}

end
