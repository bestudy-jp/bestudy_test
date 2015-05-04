Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :facebook, '820404027996736', '4d8d760f4c3ea0313afefe38794a25ec'
  else
    provider :facebook, '835790176458121', 'cc6ddf8b380f611d16155fab0a5f190e'
  end
end
