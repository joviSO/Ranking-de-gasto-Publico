class Budget < ApplicationRecord
  belongs_to :congressman, optional: true

end
