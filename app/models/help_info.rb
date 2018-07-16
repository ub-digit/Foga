class HelpInfo < ApplicationRecord
   validates :updated_by, 
      :presence => {message: 'Updaterad av får inte vara tom.'}

   validates :helptext, 
      #:presence => {message: 'Du måste fylla in titel.'},
      :uniqueness => {message: 'Du kan bara redigera det hjälp avsnitt som finns.'}


end
