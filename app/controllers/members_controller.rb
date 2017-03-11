class MembersController < ApplicationController
  def index
    @members = Member.order('number')
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to @member, notice: '会員情報を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: '会員を削除しました'
  end

  def search
    @members = Member.search(params[:q])
    render 'index'
  end

  private
  def member_params
    params.require(:member).permit(:number, :name, :full_name, :email, :birthday, :gender, :administrator)
  end
end
