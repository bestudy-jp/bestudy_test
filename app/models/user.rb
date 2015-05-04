# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  email                  :string(255)
#  icon                   :string(255)
#  oauth_token            :string(255)
#  oauth_expires_at       :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  detail_hash            :text
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :lockable
  validates :password, presence: false, on: :facebook_login
  has_many :genre_user_relation
  has_many :genre, through: :genre_user_relation

  def self.find_for_facebook_oauth(auth)
    # emailの提供は必須とする
    user = User.where('email = ?', auth.info.email).first
    if user.blank?
      user = User.new
    end
    user.uid   = auth.uid
    user.name  = auth.info.name
    user.email = auth.info.email
    user.icon  = auth.info.image
    user.provider = auth.provider
    user.password = Devise.friendly_token[0, 20]
    user.oauth_token      = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user
  end

  def profile_hash
    graph = Koala::Facebook::API.new(oauth_token)
    profile = graph.get_object('me', fields: 'id,bio,birthday,education,email,name,first_name,last_name,gender,hometown,interested_in,languages,link,location,locale,relationship_status,quotes,timezone,verified')
    JSON.generate(profile)
  end

  def update_profile
    self.detail_hash = profile_hash
  end

  def update_profile!
    update_profile
    save!
  end
end
