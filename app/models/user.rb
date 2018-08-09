class User < ApplicationRecord
  has_secure_password

   validates :xname, 
      :presence => {message: ' | Du måste fylla in kontonamn. (t.ex. xsvesv)'},
      :uniqueness => {message: ' | Detta kontonamn finns redan.'},
      length: {on: :create, minimum: 6, message: ' | Kontonamnet måste vara minst 6 tecken långt.'}

   validates :password,
      :presence => {on: :create, message: ' | Lösenord krävs.'},
      length: {on: :create, is: 6, message: ' | Lösenord måste vara 6 tecken långt.'},
      :confirmation => {on: :create, message: ' | Lösenord matchar ej.'}


end



#    validates :password,
#       #presence: {on: :create, message: 'Lösenord krävs.'},
#       confirmation: true,
#       #length: {is: 6, message: 'Lösenord måste vara 6 tecken långt.'}
   
#    validates :password_confirmation, 
#       presence: {on: :create, message: 'Lösenord matchar ej.'}
