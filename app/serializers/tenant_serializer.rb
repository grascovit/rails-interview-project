class TenantSerializer < ActiveModel::Serializer
  attributes :id, :api_key, :created_at, :updated_at
end
