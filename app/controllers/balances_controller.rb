class BalancesController < ApplicationController
	before_action :set_balance, only: [:show, :destroy]

	def index
		@balances = Balance.all
	end

	def show
		@balance = Balance.includes(:entries).find(params[:id])
	end

	def upload
		@file = params[:attachment][:filename] unless params[:attachment].nil?

		if not @file.blank? and Attachment.archive("public/attachments", @file)
			@data = Entry.import("public/attachments/#{@file.original_filename}")
			@balance = Balance.create(balance_params.merge(total: @data[:total]))
			@balance.entries.create(@data[:entries])
		end
		redirect_to balances_url
	end


	private


	def set_balance
		@balance = Balance.find(params[:id])
	end

	def balance_params
		params.require(:balance).permit(:description, :total, entries_attributes: Entry.attribute_names)
	end
end
