class PagesController < ApplicationController
  
  def home
  end

  def portfolio
    @page_description = 'we offer Saas solutions for small to medium sized business, catered to industry need and company budget.'
    @page_keywords    = 'tribic, halifax, nova, scotia, SaaS, development, eventx, event, management, amie, fudge, callie, boyles, software, solution, saas, cloud, small, business'
  end

  def about
    @page_description = 'Amie Fudge and Callie Boyles founded Tribic Software to create solutions for small businesses.'
    @page_keywords    = 'tribic, halifax, professional, services, amie, fudge, callie, boyles, software, solution, saas, cloud, small, business'
  end

  def careers
    @page_description = 'We are hiring junior and senior software developers.'
    @page_keywords    = 'tribic, halifax, software, developer, ruby, rails, cloud, agile, heroku, jira, GCP, dockers'    
  end

  def home
    @page_description = 'Software solutions for small businesses.'
    @page_keywords    = 'software, solution, saas, cloud, small, business'

  end

  def contact
    @page_description = 'Are you a small business looking to streamline your business processe.'
    @page_keywords    = 'tribic, halifax, professional, services, software, solution, saas, cloud, small, business, agile'
  end
  
  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end

end
