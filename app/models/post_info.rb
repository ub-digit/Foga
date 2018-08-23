class PostInfo < ApplicationRecord

   validates :title, 
      :presence => {message: 'Du måste fylla in Titel.'}

   validates :publisher,
      :presence => {message: 'Du måste fylla i Utgivare.'}
   
   validates :operation_id, 
      :presence => {message: 'Du måste välja en Åtgärd.'}

	belongs_to :operation


end
