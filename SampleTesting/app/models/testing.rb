class Testing < ActiveRecord::Base
  validates :title, presence: true, format: { with: /\A[A-Za-z0-9+\s]+\z/ }
  validates :description, presence: true
end
