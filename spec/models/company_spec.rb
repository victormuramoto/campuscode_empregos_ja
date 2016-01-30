require 'rails_helper'

RSpec.describe Company, type: :model do
    before do
      @company  = create_company
      @category = create_category
    end

    describe '#premium?' do

      context 'have no job' do
        it 'is not premium' do
          expect(@company).to_not be_premium
        end
      end

      context 'have 1 job' do
        it 'is not premium' do
          1.times do
            create_job(company:@company,category:@category)
          end
          expect(@company).to_not be_premium
        end
      end

      context 'have 4 job' do
        it 'is not premium' do
          4.times do
            create_job(company:@company,category:@category)
          end
          expect(@company).to_not be_premium
        end
      end

      context 'have 5 job' do
        it 'is premium' do
          5.times do
            create_job(company:@company,category:@category)
          end
          expect(@company).to_not be_premium
        end
      end

      context 'have 6 job' do
        it 'is premium' do
          6.times do
            create_job(company:@company,category:@category)
          end
          expect(@company).to_not be_premium
        end
      end

    end
end
