class Cover < ActiveRecord::Base
  belongs_to :movie
  mount_uploader :path, CoverUploader
  resourcify
end
