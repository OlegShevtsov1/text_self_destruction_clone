RSpec.describe Message, type: :model do
  context 'with database columns' do
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:visit).of_type(:boolean) }
  end
end
