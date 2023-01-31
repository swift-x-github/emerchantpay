# frozen_string_literal: true

class MerchantSerializer
    include FastJsonapi::ObjectSerializer
  
    attribute :allow_refund do |record, params|
      params[:amount].to_f <= record.balance.to_f
    end
  end
  