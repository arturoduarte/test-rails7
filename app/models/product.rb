class Product < ApplicationRecord
  include ::PgSearch::Model
  pg_search_scope :search_full_text,
                  against: {
                    # las letras(A-B) son la prioridad de busqueda
                    title: 'A',
                    description: 'B'
                  }

  ORDER_BY = { newest: 'created_at desc', expensive: 'price desc', cheapest: 'price ASC' }.freeze
  public_constant :ORDER_BY

  has_one_attached :photo
  validates :title, :description, :price, presence: true
  belongs_to :category
  belongs_to :user, default: -> { ::Current.user }

  def owner?
    user == ::Current.user
  end
end
