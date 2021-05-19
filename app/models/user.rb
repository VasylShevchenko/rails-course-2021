class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  validates :email,       presence: true
  validates :password,    presence: false
  validates :age,         presence: false
  validates :card_number, presence: false
  # validate :validate_card_number

  has_many :articles

  private

  def validate_card_number
    return errors.add :card_number, message: 'must be number' unless card_number.scan(/\D/).empty?
    return errors.add :card_number, message: 'must be 10 number' if card_number.size < 10

    cart_number_valid = (card_number.reverse.chars.map(&:to_i).map.with_index do |element, index|
      element *= 2 if (index + 1).even?
      element -= 9 if element > 9
      element
    end.sum % 10).zero?
    errors.add :card_number, message: 'is invalid' unless cart_number_valid
  end
end
