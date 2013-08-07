class ComitesController < ApplicationController
  before_filter :authenticate_user!

  def index
    # or, use an explicit "per page" limit:
    @comites = Comite.paginate(:page => params[:page], :per_page => 30)
  end

  def show
     @comite = Comite.find(params[:id])
     @title = "Detalles del comite"
  end

  def new
    @comite = Comite.new
    @localidades = Localidad.where(:habilitado => true)
    @title = "Ingreso de Comite"
  end

  def create
    @comite = Comite.new(params[:comite])
    @localidades = Localidad.where(:habilitado => true)
    if @comite.save()
      flash[:success] = "Comite Guardado"
      redirect_to comites_path()
    else
      flash[:error] = "Ocurrio un error al guardar el Comite"
      render 'new'
    end
  end

  def edit
    @comite = Comite.find(params[:id])
    @localidades = Localidad.where(:habilitado => true)
    @title = "Editar Comite"

    render 'new'
  end

  def update
    @comite = Comite.find(params[:id])
    @localidades = Localidad.where(:habilitado => true)

    if @comite.update_attributes(params[:comite])
      flash[:success] = "Comite correctamente modificado"
      redirect_to comites_path(@comite)
    else
      flash[:error] = "Ocurrieron errores al modificar el comite. Reintentelo"
      @title = "Editar Comite"
      render 'new'
    end
  end

  def destroy
  end

  def search
    texto = params[:text]
    if texto.empty?
      @comites = Comite.paginate(:page => params[:page], :per_page => 30)
    else
      @comites = buscador('Comite', texto).paginate(:page => params[:page], :per_page => 30)
    end
    render 'index'
  end
end