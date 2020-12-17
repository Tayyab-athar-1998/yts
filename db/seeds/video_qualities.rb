VideoQuality.where(resolution: '480p').first_or_create!(resolution: '480p')
VideoQuality.where(resolution: '720p').first_or_create!(resolution: '720p')
VideoQuality.where(resolution: '1080p').first_or_create!(resolution: '1080p')
