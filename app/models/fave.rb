class Fave < ApplicationRecord
  belongs_to :list, required: false
end
