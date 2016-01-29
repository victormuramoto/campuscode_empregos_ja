require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "#recent?" do
    
    context 'created today' do
      it 'is recent' do
        expect(create_job).to be_recent
      end
    end

    context 'created 4 days ago' do
      it 'is recent' do
        expect(create_job).to be_recent
      end
    end

    context 'created 6 days ago' do
      it 'is not recent' do
        expect(create_job).to_not be_recent
      end
    end


  end

end
