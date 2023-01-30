class ClientSerializer
  include FastJsonapi::ObjectSerializer

  attribute :allow_authorize do |record, params|
    params[:amount].to_f <= record.balance.to_f ? true : false
  end

  attribute :allow_capture do |record, params|
    params[:amount].to_f <= record.captured_amount.to_f ? true : false
  end

end
