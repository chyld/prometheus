class CommerceController < ApplicationController
  def plans
  end

  def purchase
  end

  def transaction
    begin
      plan = Plan.where(name: params[:plan]).first
      is_group = plan.name == 'group' if plan.present?
      size = is_group ? params[:'group-size'].to_i : 1

      raise "Selected plan was not found" if plan.nil?
      raise "Group size must be greater than 1" if is_group && size < 2

      if @auth.customer_id.blank?
        customer = Stripe::Customer.create(email: @auth.email, card: params[:'token-id'], plan: plan.name, quantity: size)
        @auth.customer_id = customer.id
        @auth.plan = plan
        @auth.save
        Notifications.plan_purchased(@auth).deliver
      end
    rescue Stripe::CardError => @error
    rescue => @error
    end

    if @error.nil?
      redirect_to(@auth)
    else
      render :purchase
    end
  end
end
