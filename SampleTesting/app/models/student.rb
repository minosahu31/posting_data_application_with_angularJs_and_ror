class Student < ActiveRecord::Base

    validates :name, presence: true, format: { with: /\A[a-zA-Z+\s]+\z/ }
    validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: 'The format of Email is invalid'}
    #  validates :dob, presence: true
    #  validates :dob, format: { with: /\A(19|20)\d\d[\-\.\/](0[1-9]|1[012])[\-\/\.](0[1-9]|[12][0-9]|3[01])+\z/, message: 'The format of Date of birth is invalid' }
    #  validates :age, presence: true
    #  #validates :age, numericality: true
    #  validates_numericality_of :age, :only_integer => true, :greater_than_or_equal_to => 20, :less_than_or_equal_to => 25, :message => "can only be whole number between 20 and 50."

end
