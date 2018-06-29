class User < ApplicationRecord
  has_secure_password

   validates :xname, 
      :presence => {message: 'Du måste fylla in kontonamn. (t.ex. xsvesv)'},
      :uniqueness => {message: 'Detta kontonamn finns redan.'}

   validates :password,
      :presence => {message: 'Lösenord krävs.'}


end
