class CreateLawyers < ActiveRecord::Migration[7.1]
  def change
    create_table :lawyers do |t|
      t.string :city
      t.string :UF
      t.string :OAB
      t.text :group, array: true
      t.text :category, array: true
      t.string :faculty
      t.string :detail
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end

    # Adiciona uma restrição de verificação para aceitar apenas os valores "Aguardando aprovação" ou "Aprovado"
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE lawyers
          ADD CONSTRAINT check_status
          CHECK (status IN ('Aguardando aprovação', 'Aprovado'));
        SQL
      end
    end
  end
end
