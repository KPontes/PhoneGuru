class Number < ApplicationRecord
    validates_presence_of :countrycode, :cn, :prefix, :mcdu
    validates_length_of :cn, :maximum => 2, :minimum => 2
    validates_length_of :countrycode, :maximum => 2, :minimum => 2
    validates_length_of :prefix, :maximum => 5, :minimum => 5
    validates_length_of :mcdu, :maximum => 4, :minimum => 4
end
