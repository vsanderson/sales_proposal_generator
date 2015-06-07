class ProposalsController < ApplicationController
  before_action :require_user
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = current_user.proposals
  end

  def show
  end

  def new
    @proposal = current_user.proposals.build
  end

  def edit
  end

  def create
    @proposal = current_user.proposals.build(proposal_params)
    if @proposal.save
      redirect_to @proposal, notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal, notice: 'Proposal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_url, notice: 'Proposal was successfully destroyed.'
  end

  private
  def set_proposal
    @proposal = Proposal.where(user_id: current_user).includes(:line_items).find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:name, :customer_id, :line_items_attributes => [:id, :product_id, :proposal_id, :quantity, :discount, :notes, :_destroy])
  end
end
