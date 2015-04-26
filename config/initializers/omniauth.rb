Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '820404027996736', '4d8d760f4c3ea0313afefe38794a25ec'
end
