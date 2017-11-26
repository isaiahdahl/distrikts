class ActsAsFavoritorMigration < ActiveRecord::Migration[5.1]
    def self.up
        create_table :favorites, force: true do |t|
            t.references :favoritable, polymorphic: true, null: false
            t.references :favoritor, polymorphic: true, null: false
            t.string :scope, default: ActsAsFavoritor.default_scope, null: false, index: true
            t.boolean :blocked, default: false, null: false, index: true
            t.timestamps
        end

        add_index :favorites, ['favoritor_id', 'favoritor_type'], name: 'fk_favorites'
        add_index :favorites, ['favoritable_id', 'favoritable_type'], name: 'fk_favoritables'
    end

    def self.down
        drop_table :favorites
    end
end
