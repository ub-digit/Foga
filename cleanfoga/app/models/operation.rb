class Operation < ApplicationRecord
	
	has_many :post_infos

	validates_uniqueness_of :operation_type #, message: 'Denna åtgärd finns redan.'

end
