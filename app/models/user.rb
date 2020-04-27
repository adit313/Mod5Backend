class User < ApplicationRecord
    has_many :sessions, :dependent => :destroy
    has_many :rounds, through: :sessions
end
