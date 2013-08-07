class CuentasController < ApplicationController
  before_filter :authenticate_user!

  def index
    @adherentes = Adherente.con_cuenta.activos.paginate(:page => params[:page], :per_page => 30)

    @title = 'Cuenta Corriente'
  end

  def search
    texto = params[:text]
    if texto.empty?
      @adherentes = Adherente.con_cuenta.activos.paginate(:page => params[:page], :per_page => 30)
    else
      @adherentes = buscador_con_cuenta('Adherente', texto).paginate(:page => params[:page], :per_page => 30)
    end
    render 'index'
  end

  def generar_mes
    @title = "Generacion de deudas de un mes"
  end

  def confirmar_generacion_mes

    if Cuenta.generarMes(params[:anio], params[:mes])
      url = "#{factura_mes_path(params[:anio], params[:mes])}.pdf"
      redirect_to url
    else
      @title = "Generacion de deudas de un mes"
      render 'generar_mes'
    end
  end

  def factura_mes
    @cuentas = Cuenta.por_fecha(params[:anio], params[:mes])
    respond_to do |format|
      format.pdf {
        factura = FacturaMes.new
        factura.prepararDocMeses(@cuentas)
        send_data factura.render
      }
    end
  end

  def factura
    @cuenta = Cuenta.por_adherente_y_fecha(params[:adherente], params[:anio], params[:mes]).first
    respond_to do |format|
      format.pdf {
        #render :layout => false
        factura = FacturaMes.new
        factura.prepararDocMes(@cuenta)
        send_data factura.render
      }
    end
  end

  def detalle
    @adherente = Adherente.find(params[:id])
    @cuentas = @adherente.cuentas.deudora.orden_fecha.paginate(:page => params[:page], :per_page => 30)
    @historico = @adherente.cuentas.historico.orden_fecha.paginate(:page => params[:page], :per_page => 30)
  end

  def pagar
    cuenta = Cuenta.find(params[:id])
    cuenta.pagado = true
    if cuenta.save()
      flash[:success] = "Cuenta pagada"
    else
      flash[:error] = "Error al pagar la cuenta"
    end
    redirect_to detalle_cuentas_path(cuenta.adherente)
  end

  def deber
    cuenta = Cuenta.find(params[:id])
    cuenta.pagado = false
    if cuenta.save()
      flash[:success] = "La cuenta se debe"
    else
      flash[:error] = "Error al marcar la deuda como no paga"
    end
    redirect_to detalle_cuentas_path(cuenta.adherente)
  end

  def anular
    cuenta = Cuenta.find(params[:id])
    #cuenta.habilitada = true
    cuenta.save()
    redirect_to detalle_cuentas_path(cuenta.adherente)
  end
end
