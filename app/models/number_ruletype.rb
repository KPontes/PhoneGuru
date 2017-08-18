class NumberRuletype < ApplicationRecord
    self.table_name = 'numbers_ruletypes'
    belongs_to :number
    belongs_to :ruletype
end
