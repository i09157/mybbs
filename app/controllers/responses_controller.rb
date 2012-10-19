#encoding:utf-8
class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new

    @response = Response.new
    @response.name = session[:name] if session[:name]
    @response.email = session[:email] if session[:email]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.json
  def create
    #    @article = Article.find(params[:id])
    session[:updated_at] = Time.now unless session[:updated_at]
    if Time.now - session[:updated_at] < 5
      redirect_to root_path,notice: '5秒待ってください'
    else
      @response = Response.new(params[:response])
      session[:name] = @response.name
      session[:email] = @response.email

      respond_to do |format|
        if @response.save
          session[:updated_at] = Time.now
           flash[:notice] = 'Tip was successfully updated.'
          format.html { #redirect_to :controller=>'articles', :action => 'show', :id => @article.id
                        redirect_to articles_path }
          format.json { render json: @response, status: :created, location: @response }
        else
        format.html { render action: "new"}
        format.json { render json: @response.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :ok }
    end
  end
end
