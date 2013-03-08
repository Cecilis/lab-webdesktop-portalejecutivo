class MenuAdminController < ApplicationController
  def index
    if(session[:nombre_login]==nil)
      redirect_to '/inicio'
    elsif(session[:id_rol]=='1')
      redirect_to '/cli_comprador'
    elsif(session[:id_rol]=='2')
      redirect_to '/concesionario'
    elsif(session[:id_rol]=='3')
      redirect_to '/menu_ensambladora'
    end
  end

  def generar_menu
    @tipo=params[:tipo]
    @arbols = Portal_ejecutivo_desktops.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end

  def grabar_marca
    @marca= Marca.new
    @nombre=params[:nombre]
    @imagen=params[:imagen]
    @mision=params[:mision]
    @vision=params[:vision]
    @valores=params[:valores]
    @contacto=params[:contacto]
    @marca.grabar_marca(@nombre,@imagen,@mision,@vision,@valores,@contacto)
    render :text => $tirajson
  end
end