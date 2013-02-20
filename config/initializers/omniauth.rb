Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'DaJZpTSc9GGu3AB2Y8xBw', 'XqdJulQb26AsCYAS99RaH88gMi86nPl81sjBzJ7WhGE'
  provider :facebook, '519961638027321', '0a583c7ebc8eb6079812c37627b6dcec'
end