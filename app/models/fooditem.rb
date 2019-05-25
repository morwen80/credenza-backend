class Fooditem < ApplicationRecord
  belongs_to :list, required: false
  # I've added the required: false - also on the listx model
end
