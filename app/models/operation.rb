class Operation < ApplicationRecord
	
	has_many :post_infos


	validates_uniqueness_of :operation_type, {message: 'Denna åtgärd finns redan.'}

   validates :description, length: {in: 0..60}

   validates :operation_type, length: {in: 0..20}

end
