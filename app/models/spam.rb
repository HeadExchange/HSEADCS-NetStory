class Spam < ApplicationRecord
  mount_uploader :video, VideoUploader
end
