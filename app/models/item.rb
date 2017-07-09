class Item < ApplicationRecord
  belongs_to :user

  validates_presence_of :text
  validates_inclusion_of :done, in: [true, false]

end
