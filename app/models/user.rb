class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        primary_key: :id, #user's id
        foreign_key: :artist_id, 
        class_name: :Artwork,
        dependent: :destroy
end