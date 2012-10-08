OmniAuth.config.logger = Rails.logger


if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '538500719499004', '0e264b9e3a36bfceb0a626e9e253f5a8', :display => "popup", scope: "email,publish_stream,user_photos,offline_access"
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '538500719499004', '0e264b9e3a36bfceb0a626e9e253f5a8', :display => "popup", scope: "email,publish_stream,user_photos,offline_access"
  end
end