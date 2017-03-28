class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    respond_to do |format|
      format.html { render :template => "errors/error_404", :status => 404 }
      format.json { render json: { "error": "Usuario no encontrado"}, :status => 404 }
    end
  end
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    if params[:id]
      respond_to do |format|
        format.json { render json: { "error": "no se puede crear un usuario con id"}, :status => 400 }
      end
    else
      @usuario = Usuario.new(usuario_params)
      respond_to do |format|
        if @usuario.save
          format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
          format.json { render :show, status: :200, location: @usuario }
        else
          format.html { render :new }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    if params[:id]
      puts "pelaooo"
    end
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: => 200, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content, notice: 'Usuario was successfully destroyed.', status: => 204}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.permit(:usuario, :nombre, :apellido, :twitter)
    end
end
