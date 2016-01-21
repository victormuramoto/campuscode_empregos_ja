require 'rails_helper'

feature 'Visitor do not view expired jobs' do
  scenario 'successfully show jobs passed  5 days' do
    travel_to 5.days.ago do
      create_job()
    end

    visit root_path

    expect(page).to have_content("Desenvolvedor Rails")
  end

  scenario 'successfully show jobs passed  89 days' do
    travel_to 89.days.ago do
      create_job()
    end

    visit root_path

    expect(page).to have_content("Desenvolvedor Rails")
  end

  scenario 'successfully show jobs passed  90 days' do
    travel_to 90.days.ago do
      create_job()
    end

    visit root_path

    expect(page).to_not have_content("Desenvolvedor Rails")
  end

  scenario 'successfully show jobs passed  91 days' do
    travel_to 91.days.ago do
      create_job()
    end

    visit root_path

    expect(page).to_not have_content("Desenvolvedor Rails")
  end

  scenario 'successfully show jobs passed  100 days' do
    travel_to 100.days.ago do
      create_job()
    end

    visit root_path

    expect(page).to_not have_content("Desenvolvedor Rails")
  end

  scenario 'show expired job' do
    job = nil
    travel_to 100.days.ago do
      job = create_job()
    end

    visit job_path(job)

    expect(page).to have_content("Vaga Expirada!")
  end

  scenario 'show not expired job' do
    job = create_job()

    visit job_path(job)

    expect(page).to_not have_content("Vaga Expirada!")
  end
end
