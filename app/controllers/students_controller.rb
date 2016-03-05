class StudentsController < ApplicationController
  def index
    choice = params[:major]
    @students = choice.nil? || choice == "all majors" ? Student.all : Student.where(major: choice)
    @majors = Student.majors
  end
end
