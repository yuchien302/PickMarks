class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :name, :email, :oauth_expires_at, :oauth_token, :provider, :uid, :password, :password_confirmation
  has_many :bookmarks

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :confirmation => true


  @@save_from_oauth = false
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.from_omniauth(auth)
    # where(auth.slice(:provider, :uid)).first_or_create do |user|
    #   user.provider = auth.provider
    #   user.uid = auth.uid
    #   user.name = auth.info.name #unless user.name
    #   user.oauth_token = auth.credentials.token
    #   user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    #   user.avatar = auth.info.image
    #   user.email = auth.info.email unless user.email
    #   # user.password = "" unless user.encrypted_password
    # end

    user = where(auth.slice(:provider, :uid)).first

    if user.nil?
      user = self.new()
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.avatar = auth.info.image
      user.email = auth.info.email 
      user.password = "pickmarks"
      user.save!
    else
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.avatar = auth.info.image
      @@save_from_oauth = true
      user.save!
    end
    user
  end



  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end

  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size }
  end

  def user_gravatar
    facebook { |fb| fb.get_picture("me", :type => :square) }
  end

  def user_object(uid)
    facebook { |fb| fb.get_object(uid) }
  end




  
  
  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end
    
    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end
  
  private
  
    def encrypt_password
      if @@save_from_oauth == false
        self.salt = make_salt unless has_password?(password)
        self.encrypted_password = encrypt(password)
      end
      @@save_from_oauth = false
      true
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end




end
