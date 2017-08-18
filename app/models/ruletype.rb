class Ruletype < ApplicationRecord
    has_many :number_ruletype
    has_many :numbers, through: :number_ruletype
end
