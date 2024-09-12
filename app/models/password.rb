class Password < ApplicationRecord
  validates :website, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
  validates :website, format: {
    with: /\A(https?:\/\/)?(www\.)?[\w\-]+\.[a-z]{2,}(\/[\w\-\.\/?%&=]*)?\z/i,
    message: "Must be a valid website URL"
  }
end
