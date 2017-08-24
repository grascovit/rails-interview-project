class DashboardController < ApplicationController
  def index
    @users_count = User.count
    @questions_count = Question.count
    @answers_count = Answer.count
    @tenants_count = Tenant.count
    @tenants_requests_count = Tenant.sum(:requests_count)
  end
end
