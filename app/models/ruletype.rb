class Ruletype < ApplicationRecord
    has_many :number_ruletypes
    has_many :numbers, through: :number_ruletypes
    accepts_nested_attributes_for :numbers
    accepts_nested_attributes_for :number_ruletypes
end
