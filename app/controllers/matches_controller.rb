class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches or /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @players = Player.all
  end

  # GET /matches/1/edit
  def edit
    @players = Player.all
  end

  # POST /matches or /matches.json
def create
  @match = Match.new(match_params)

  respond_to do |format|
    if @match.save
      # update winner
      winner = Player.find(@match.winner_id)
      winner.increment!(:total_win)
      winner.increment!(:points, 4)

      # update runner up
      runner_up = Player.find(@match.runner_up_id)
      runner_up.increment!(:points, 2)

      # update second runner up
      second_runner_up = Player.find(@match.second_runner_up_id)
      second_runner_up.increment!(:points, 1)

      # last place (no points, but you could track losses if you add that field)
      last_player = Player.find(@match.last_id)
      # last_player.increment!(:losses) if you add a column later

      format.html { redirect_to root_path, notice: "Match was successfully created." }
      format.json { render :show, status: :created, location: @match }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @match.errors, status: :unprocessable_entity }
    end
  end
end


  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: "Match was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
# DELETE /matches/1 or /matches/1.json
def destroy
  # rollback player stats before destroying match
  winner = Player.find(@match.winner_id)
  winner.decrement!(:total_win)
  winner.decrement!(:points, 4)

  runner_up = Player.find(@match.runner_up_id)
  runner_up.decrement!(:points, 2)

  second_runner_up = Player.find(@match.second_runner_up_id)
  second_runner_up.decrement!(:points, 1)

  last_player = Player.find(@match.last_id)
  # last_player.decrement!(:losses) if you add a losses column later

  @match.destroy!

  respond_to do |format|
    format.html { redirect_to matches_path, notice: "Match was successfully destroyed.", status: :see_other }
    format.json { head :no_content }
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params.require(:id))
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:winner_id, :runner_up_id, :second_runner_up_id, :last_id)
    end
end
