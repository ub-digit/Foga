class Operation < ApplicationRecord
	
	has_many :post_infos

	validates_uniqueness_of :operation_type #, message: 'Denna åtgärd finns redan.'

   validates :description, :length => {:minimum => 0, :maximum => 60}

   validates :operation_type, :length => {:minimum => 0, :maximum => 20}

end
