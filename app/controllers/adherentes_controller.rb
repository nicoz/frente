class AdherentesController < ApplicationController
  before_filter :authenticate_user!

  def index
    # or, use an explicit "per page" limit:
    @adherentes = Adherente.paginate(:page => params[:page], :per_page => 30)
  end

  def show
     @adherente = Adherente.find(params[:id])
     @title = "Detalles del adherente"
  end

  def new
    @adherente = Adherente.new
    @localidades = Localidad.activos
    @comites = Comite.activos.comite_por_localidad(@adherente.localidad.id) if !@adherente.localidad.nil?
    @title = "Ingreso de Adherente"
  end

  def create
    @adherente = Adherente.new
    #cargo los valores
    @adherente = cargar_valores(params, @adherente)

    @localidades = Localidad.activos
    @comites = Comite.activos.comite_por_localidad(@adherente.localidad_id) if !@adherente.localidad_id.nil?
    if @adherente.save()
      flash[:success] = "Adherente Guardado"
      
      redirect_to adherentes_path()
    else
      flash[:error] = "Ocurrio un error al guardar el Adherente"
      render 'new'
    end
  end

  def edit
    @adherente = Adherente.find(params[:id])
    @localidades = Localidad.activos

    @comites = Comite.comite_por_localidad(@adherente.localidad_id) if !@adherente.localidad_id.nil?
    @title = "Editar Adherente"

    render 'new'
  end

  def update  
    @adherente = Adherente.find(params[:id])  
    @adherente = cargar_valores(params, @adherente)
    @localidades = Localidad.activos
    @comites = Comite.comite_por_localidad(@adherente.localidad_id) if !@adherente.localidad_id.nil?

    mensaje = "Adherente correctamente modificado"
    
    if @adherente.save
      flash[:success] = mensaje
      
      redirect_to adherentes_path(@adherente)
    else
      flash[:error] = @adherente.id
      #"Ocurrieron errores al modificar el adherente. Reintentelo"
      @title = "Editar Adherente"
      render 'new'
    end
  end

  def destroy
  end

  def search
    texto = params[:text]
    if texto.empty?
      @adherentes = Adherente.paginate(:page => params[:page], :per_page => 30)
    else
      @adherentes = buscador('Adherente', texto).paginate(:page => params[:page], :per_page => 30)
    end
    render 'index'
  end

  def dar_comites
    localidad_id = params[:localidad]

    @comites = Comite.where(:localidad_id => localidad_id) if !localidad_id.nil?

    @comites = [] if @comites.nil?

    @resultado = {:items => @comites}
    render :json => @resultado
  end

  
def cargar_valores(params, adherente)   
    adherente.apellidos = params[:adherente][:apellidos]
    adherente.nombres = params[:adherente][:nombres]
    adherente.ci = params[:adherente][:ci]
    adherente.cc = params[:adherente][:cc]
    adherente.fecha_nacimiento = params[:adherente][:fecha_nacimiento]
   
    adherente.email = params[:adherente][:email]
    adherente.coordinadora = params[:adherente][:coordinadora]
    adherente.comite_id = params[:adherente][:comite_id]
    adherente.coordinadora = params[:adherente][:coordinadora]
    adherente.fecha_solicitud = params[:adherente][:fecha_solicitud]
    adherente.cotizacion = params[:adherente][:cotizacion]
    
    if not( params[:adherente][:localidad_id].nil? or params[:adherente][:localidad_id].empty? )
      adherente.localidad = Localidad.find(params[:adherente][:localidad_id])

      adherente.calle_principal = cargar_calle(adherente.localidad, params[:adherente][:calle_principal_nombre]).first
      Rails.logger.info '-------------------sjafdjsgj-----------------'
      Rails.logger.info params[:adherente][:calle_principal_nombre]
      adherente.primera_lateral = cargar_calle(adherente.localidad, params[:adherente][:primera_lateral_nombre]).first            
      adherente.segunda_lateral = cargar_calle(adherente.localidad, params[:adherente][:segunda_lateral_nombre]).first
      adherente.calle_principal_cobro = cargar_calle(adherente.localidad, params[:adherente][:calle_principal_cobro_nombre]).first
      adherente.primera_lateral_cobro = cargar_calle(adherente.localidad, params[:adherente][:primera_lateral_cobro_nombre]).first
      adherente.segunda_lateral_cobro = cargar_calle(adherente.localidad, params[:adherente][:segunda_lateral_cobro_nombre]).first
    end
    
    adherente.domicilio = params[:adherente][:domicilio]
    adherente.telefono = params[:adherente][:telefono]


    adherente.domicilio_cobro = params[:adherente][:domicilio_cobro]
    adherente.telefono_cobro = params[:adherente][:telefono_cobro]

    adherente
  end

  def cargar_calle(localidad, nombre)
    Calle.activas.por_localidad_y_nombre(localidad.id, nombre)
  end
  
end
