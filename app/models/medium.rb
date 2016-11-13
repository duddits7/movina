class Medium < ActiveRecord::Base
  belongs_to :movie
  resourcify
end
