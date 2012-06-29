class CandidatesController < ApplicationController
  before_filter :voter_rights, :only => :show
  before_filter :keys_to_kingdom, :only => [:new, :create, :edit, :update, :destroy]
  
    
    def vote_up_voter
      @candidate = Candidate.find(params[:id])
      unless current_voter.voted_for?(@candidate)
        current_voter.vote_for(@candidate)
        redirect_to :action => :index
      else
        redirect_to :action => :index
      end
    end
  
    def vote_up_admin
      @candidate = Candidate.find(params[:id])
      unless current_admin.voted_for?(@candidate)
        current_admin.vote_for(@candidate)
        redirect_to :action => :index
      else
        redirect_to :action => :index
      end
    end
  
  
  def index
    @candidates = Candidate.find( :all, :order => "id ASC" )


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.json
  def new
    @candidate = Candidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render json: @candidate, status: :created, location: @candidate }
      else
        format.html { render action: "new" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.json
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end
end
