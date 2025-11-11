# app/controllers/schedules_controller.rb
class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]

  def index
    @schedules = Schedule.order(updated_at: :desc)
    @today     = Time.zone.today
    @total     = Schedule.count
  end

  def show; end

  def new
    @schedule = Schedule.new
  end

  def edit; end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to @schedule, notice: '予定を作成しました。'
    else
      flash.now[:alert] = '作成に失敗しました。入力内容を確認してください。'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: '予定を更新しました。'
    else
      flash.now[:alert] = '更新に失敗しました。入力内容を確認してください。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_url, notice: '予定を削除しました。'
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_on, :end_on, :all_day, :memo)
  end
end
