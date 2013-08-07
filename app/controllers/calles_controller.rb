class CallesController < ApplicationController
  before_filter :authenticate_user!

  def index
    # or, use an explicit "per page" limit:
    @calles = Calle.paginate(:page => params[:page], :per_page => 30)
  end

  def show
     @calle = Calle.find(params[:id])
     @title = "Detalles de la calle"
  end

  def new
    @calle = Calle.new
    @localidades = Localidad.where(:habilitado => true)
    @title = "Ingreso de Calle"
  end

  def create
    @calle = Calle.new(params[:calle])
    @localidades = Localidad.where(:habilitado => true)
    if @calle.save()
      flash[:success] = "Calle Guardado"
      redirect_to calles_path()
    else
      flash[:error] = "Ocurrio un error al guardar la Calle"
      render 'new'
    end
  end

  def edit
    @calle = Calle.find(params[:id])
    @localidades = Localidad.where(:habilitado => true)
    @title = "Editar Calle"

    render 'new'
  end

  def update
    @calle = Calle.find(params[:id])
    @localidades = Localidad.where(:habilitado => true)

    if @calle.update_attributes(params[:calle])
      flash[:success] = "Calle correctamente modificada"
      redirect_to calles_path(@calle)
    else
      flash[:error] = "Ocurrieron errores al modificar la calle. Reintentelo"
      @title = "Editar Calle"
      render 'new'
    end
  end

  def destroy
  end

  def search
    texto = params[:text]
    if texto.empty?
      @calles = Calle.paginate(:page => params[:page], :per_page => 30)
    else
      @calles = buscador('Calle', texto).paginate(:page => params[:page], :per_page => 30)
    end
    render 'index'
  end

  def por_nombre
    render :json => Calle.activas.por_nombre(params[:term]).map(&:nombre)
  end

  def por_localidad_y_nombre
    render :json => Calle.activas.por_localidad_y_nombre(params[:localidad], params[:calle]).map(&:id)
  end

  def por_localidad_y_nombre_filtrado
    termino = params[:term]
    localidad = params[:localidad]
    campo = params[:campo]
    calle_principal = params[:calle_principal]
    primera_lateral = params[:primera_lateral]
    segunda_lateral = params[:segunda_lateral]
    distinto1 = ''
    distinto2 = ''
    if campo == 'adherente_calle_principal_nombre' or campo == 'adherente_calle_principal_cobro_nombre'
      distinto1 = primera_lateral
      distinto2 = segunda_lateral
    end

    if campo == 'adherente_primera_lateral_nombre' or campo == 'adherente_primera_lateral_cobro_nombre'
      distinto1 = calle_principal
      distinto2 = segunda_lateral
    end

    if campo == 'adherente_segunda_lateral_nombre' or campo == 'adherente_segunda_lateral_cobro_nombre'
      distinto1 = calle_principal
      distinto2 = primera_lateral
    end

    render :json => Calle.activas.por_localidad_y_nombre_filtrado(params[:localidad], termino, distinto1, distinto2).map(&:nombre)
  end
end
