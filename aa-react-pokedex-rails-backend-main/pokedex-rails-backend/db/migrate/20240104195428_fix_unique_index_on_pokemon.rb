class FixUniqueIndexOnPokemon < ActiveRecord::Migration[7.0]
  def change
    remove_index :items, name: :index_items_on_pokemon_id
  end
end
