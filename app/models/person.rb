class Person < ApplicationRecord
  has_many :seizures, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true


  def name
    "#{first_name} #{last_name}"
  end
end
