# frozen_string_literal: true

class ClientSerializer
  include FastJsonapi::ObjectSerializer

  attribute :allow_authorize do |record, params|
    params[:amount].to_f <= record.balance.to_f
  end

  attribute :allow_capture do |record, params|
    params[:amount].to_f <= record.captured_amount.to_f
  end
end
