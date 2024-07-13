# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  token                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_secure_token

  has_many :games
  has_many :game_versions

  has_many :access_grants,
           class_name: "Doorkeeper::AccessGrant",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks\

  validate do 
    errors.add(:gemini_key, "Not a valid api key") unless gemini_key_valid?
  end

  def gemini_key_valid?
    p "Checking if key valid"
    return true unless gemini_key.present?
    
    content = ConversationContent.new(text: "ACK")
    gemini_client.count_tokens(content.for_request)
    true
  rescue Faraday::BadRequestError
    p "Caught error"
    false
  end

  def gemini_client
    if gemini_key.present?
      GeminiClient.new(key: gemini_key)
    else
      GeminiClient.instance
    end
  end
end
