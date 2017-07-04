if Rails.env.test? || Rails.env.development?
  Rails.application.configure do
    config.after_initialize do
      Bullet.enable = true
      Bullet.rails_logger = false
      Bullet.bullet_logger = true
      Bullet.add_footer = true
      Bullet.raise = Rails.env.test?
    end
  end
end
