# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  
         :recoverable, :rememberable, :registerable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
