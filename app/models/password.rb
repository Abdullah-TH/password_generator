class Password < ApplicationRecord
  validates :website, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
  validates :website, format: {
    with: /\A(https?:\/\/)?(www\.)?[\w\-]+\.[a-z]{2,}(\/[\w\-\.\/?%&=]*)?\z/i,
    message: "Must be a valid website URL"
  }

  def self.generate(
    length: 16,
    include_uppercase_letters: true,
    include_lowercase_letters: true,
    include_digits: true,
    include_symbols: true
  )
    uppercase_letters = ("A".."Z").to_a
    lowercase_letters = ("a".."z").to_a
    digits = ("0".."9").to_a
    symbols = %w(! @ # $ % ^ & * ( ) _ - [ ] { } | \\ ? / > < ~)

    # Initialize the pool of characters based on input options
    character_pool = []
    character_pool += uppercase_letters if include_uppercase_letters
    character_pool += lowercase_letters if include_lowercase_letters
    character_pool += digits if include_digits
    character_pool += symbols if include_symbols

    # Raise an error if no character set is selected
    if character_pool.empty?
      raise ArgumentError, "At least one character set must be included"
    end

    # Generate the random string from the character pool
    (0...length).map { character_pool.sample }.join
  end
end
