# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord

    TYPES = [
    'fire',
    'electric',
    'normal',
    'ghost',
    'psychic',
    'water',
    'bug',
    'dragon',
    'grass',
    'fighting',
    'ice',
    'flying',
    'poison',
    'ground',
    'rock',
    'steel'
  ].sort.freeze


    validates :image_url, presence: true 
    validates :captured, inclusion: {in: [true, false], message: "captured status not provided"}
    validates :name, uniqueness: { message: "'%{value}' is already in use" }, length: {minimum:3, maximum:255}
    validates :number, uniqueness: {message: "'%{value}' is already in use"}
    validates :number, :attack, :defense, numericality: { only_integer: true }
    validates :attack, :defense, numericality: {in: 0..100}
    validates :number, numericality: {greater_than: 0 }
    validates :poke_type, inclusion: {in: TYPES, message: "'%{value}' is not a valid Pokemon type"}

    has_many :poke_moves

    has_many :items

    has_many :moves,
    through: :poke_moves,
    source: :move

    
end
