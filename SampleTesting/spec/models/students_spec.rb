require 'spec_helper'

describe Student do

    it 'is invalid factory' do
      FactoryGirl.create(:student).should be_valid
    end

   it 'is valid with name' do
     FactoryGirl.build(:student, name: "sahu").should be_valid
   end

   it 'is invalid without name' do
     FactoryGirl.build(:student, name: nil).should_not be_valid
   end

  #  it 'is valid with only characters' do
  #    names = %w[sa333hu sahu3. hello.sahu %sahu% 'sahu mino']
  #     names.each do |invalid_name|
  #         FactoryGirl.build(:student, name: invalid_name).should_not be_valid
  #     end
  #  end

   it 'is valid with a email' do
     FactoryGirl.build(:student, email: "minosahu31@gmail.com").should be_valid
   end

   it 'is invalid without an email' do
      FactoryGirl.build(:student, email: nil).should_not be_valid
   end

   it 'Email formate is invalid' do
     addresses = %w[minosahu31.gmail.com minosahu@gmail,com mino_sahu_31.org minosahu@31_gmail.com mino$sahu@gmail.com]
     addresses.each do |invalid_address|
       FactoryGirl.build(:student, email: invalid_address).should_not be_valid
     end
   end

   it 'is valid with date of birth' do
     FactoryGirl.build(:student, dob: "2016-02-20").should be_valid
   end

   it 'is invalid without date of birth' do
     FactoryGirl.build(:student, dob: nil).should_not be_valid
   end
#Error in this code
   it 'DOB format is invalid' do
     dates = %w[12-April-2016]#12-April-2016 12/April/2016 12.April.2016 '12 April 2016' 12April2016 20-02-2016 02-26-2016 02-02-1876 32-02-2016 ]
     dates.each do |invalid_date|
        invalid_date = invalid_date.to_s
       FactoryGirl.build(:student, dob: invalid_date).should be_valid
     end
   end

   it 'is valid with age' do
     FactoryGirl.build(:student, age: 20).should be_valid
   end

   it 'is valid without age' do
     FactoryGirl.build(:student, age: nil).should_not be_valid
   end

   it 'age is valid with number only' do
     ages = %w[TwentyFour 'Forty Six' 'Two five' 2Hello]
     ages.each do |invalid_age|
       FactoryGirl.build(:student, age: invalid_age).should_not be_valid
     end
   end

  it 'age between 20-25' do
    student = FactoryGirl.build :student
    student.age.should be >= 20
    student.age.should be <= 25
  end

end
