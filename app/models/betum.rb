class Betum < ActiveRecord::Base
  attr_accessible :email, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :presence => {:message => 'Name cannot be blank.'}
  validates :email, :presence => {:message => 'Email cannot be blank.'}
end
