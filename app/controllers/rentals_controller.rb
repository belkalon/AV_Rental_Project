class RentalsController < ApplicationController
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rentals }
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
    @rental = Rental.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/new
  # GET /rentals/new.json
  def new

    @rental = Rental.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/1/edit
  def edit
    @rental = Rental.find(params[:id])
  end

  # POST /rentals
  # POST /rentals.json
  def create
		#do this check before we create any new object
		if params[:customer_id] and params[:inventory_id]
			#note that if either of these are nil, we'll have SEVERE errors when trying to list any rentals
			@cust = Customer.find(params[:customer_id])
			@item = Inventory.find(params[:inventory_id])
		else
			flash[:error] = "Please supply BOTH the customer_id and inventory_id parameters!"
			redirect_to :customers and return
		end

		#now check we can actually rent the # of items requested

		@rental = Rental.new
		
		rent = params[:rental]
		@rental.return_date = Date.today + 14.days #default rental time of 2 weeks
		@rental.event_name = rent[:event_name]
		@rental.quantity = rent[:quantity]

		@rental.customer = @cust
		@rental.inventory = @item

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render json: @rental, status: :created, location: @rental }
      else
        format.html { render action: "new" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rentals/1
  # PUT /rentals/1.json
  def update
    @rental = Rental.find(params[:id])

    respond_to do |format|
      if @rental.update_attributes(params[:rental])
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to rentals_url }
      format.json { head :no_content }
    end
  end
end
