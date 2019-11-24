class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        primary_key: :id, #user's id
        foreign_key: :artist_id, 
        class_name: :Artwork,
        dependent: :destroy

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :likes,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: :Comment

    has_many :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: :Artwork

    has_many :collections

    def favorite_artworks
        artworks.where(favorite: true)
    end

    def favorite_shared_artworks
        shared_artworks.where('artwork_shares.favorite = true')
    end
end