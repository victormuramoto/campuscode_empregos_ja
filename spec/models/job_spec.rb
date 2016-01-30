require 'rails_helper'

RSpec.describe Job, type: :model do

  describe "#recent?" do

    context "created today" do
      it "is recent" do
        job = create_job(company:create_company,category:create_category)
        expect(job).to be_recent
      end
    end


    context "created 4 days ago" do
      it "is recent" do
        job = nil
        travel_to 4.days.ago do
          job = create_job(company:create_company,category:create_category)
        end
        expect(job).to be_recent
      end
    end

    context "created 5 days ago" do
      it "is not recent" do
        job = nil
        travel_to 5.days.ago do
          job = create_job(company:create_company,category:create_category)
        end
        expect(job).to_not be_recent
      end
    end

    context "created 6 days ago" do
      it "is not recent" do
        job = nil
        travel_to 6.days.ago do
          job = create_job(company:create_company,category:create_category)
        end
        expect(job).to_not be_recent
      end
    end

  end

  describe '#expired?' do

    context "created 85 days ago" do
      it "is not expired" do
        job = nil
        travel_to 85.days.ago do
          job = create_job(company:create_company,category:create_category)
        end
        expect(job).to_not be_expired
      end
    end

    context "created 90 days ago" do
      it "is expired" do
        job = nil
        travel_to 90.days.ago do
          job = create_job(company:create_company,category:create_category)
        end
        expect(job).to be_expired
      end
    end

    context "created 95 days ago" do
      it "is expired" do
        job = nil
        travel_to 95.days.ago do
          job = create_job(company:create_company,category:create_category)
        end
        expect(job).to be_expired
      end
    end
  end

end
