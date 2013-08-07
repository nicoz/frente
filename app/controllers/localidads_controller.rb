class LocalidadsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # or, use an explicit "per page" limit:
    @localidades = Localidad.paginate(:page => params[:page], :per_page => 30)
  end

  def show
     @localidad = Localidad.find(params[:id])
     @title = "Detalles de la localidad"
  end

  def new
    @localidad = Localidad.new
    @title = "Ingreso de Localidad"
  end

  def create
    @localidad = Localidad.new(params[:localidad])
    if @localidad.save()
      flash[:success] = "Localidad Guardado"
      redirect_to localidads_path()
    else
      flash[:error] = "Ocurrio un error al guardar la Localidad"
      render 'new'
    end
  end

  def edit
    @localidad = Localidad.find(params[:id])
    @title = "Editar Localidad"

    render 'new'
  end

  def update
    @localidad = Localidad.find(params[:id])

    if @localidad.update_attributes(params[:localidad])
      flash[:success] = "Localidad correctamente modificada"
      redirect_to localidads_path(@localidad)
    else
      flash[:error] = "Ocurrieron errores al modificar la localidad. Reintentelo"
      @title = "Editar Localidad"
      render 'new'
    end
  end

  def destroy
  end

  def search
    texto = params[:text]
    if texto.empty?
      @localidades = Localidad.paginate(:page => params[:page], :per_page => 30)
    else
      @localidades = buscador('Localidad', texto).paginate(:page => params[:page], :per_page => 30)
    end
    render 'index'
  end
end