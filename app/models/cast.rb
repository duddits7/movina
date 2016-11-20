class Cast < ApplicationRecord
  belongs_to :person
  belongs_to :movie
  belongs_to :rrole
end
