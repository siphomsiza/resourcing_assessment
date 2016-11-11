class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes,
           :class_name => "Note",
           :foreign_key => "user_id",
           :dependent => :destroy

  validates :firstname,:lastname,:email,presence: true

  def to_s
    [firstname,lastname].join(" ")
  end
end
