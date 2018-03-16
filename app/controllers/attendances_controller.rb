class AttendancesController < ApplicationController
  before_action :procura_atendimento, only: [:show, :edit, :update ]

  def index
    @atendimentos = Attendance.all
    authorize @atendimentos
  end

  def show
  end

  def new
    @atendimento = Attendance.new
    if params.has_key?(:cidadao_id)
      @cidadao = Person.find(params[:cidadao_id])
    end
    authorize @atendimento
  end

  def edit
  end

  def create
    @atendimento = Attendance.new(attendance_params)
    authorize @atendimento

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

  private
    def procura_atendimento
      @atendimento = Attendance.find(params[:id])
      #authorize @atendimento
    end

    def attendance_params
      params.require(:attendance).permit( :service_id, :person_id, :technician_id, :assistance_id, :descricao)
    end
end
