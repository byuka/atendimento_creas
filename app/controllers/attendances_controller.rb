class AttendancesController < ApplicationController
  before_action :procura_atendimento, only: [:show, :edit, :update ]

  def index
    @atendimentos = Attendance.all
  end

  def show
  end

  def new
    @atendimento = Attendance.new
  end

  def edit
  end

  def create
    @atendimento = Attendance.new(attendance_params)

    if @atendimento.save
      redirect_to @atendimento, notice: "Cadastrado com sucesso!"
    else 
      render :new
    end
  end


  def update
    if @atendimento.update(attendance_params)
      redirect_to attendances_url, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end   
  end

  def destroy
    Technician.find(params[:id]).destroy
    redirect_to attendance_url, notice: "Excluído com sucesso!"
  end

  private
    def procura_atendimento
      @atendimento = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit( :service_id, :person_id, :technician_id, :assistance_id, :descricao)
    end
end
