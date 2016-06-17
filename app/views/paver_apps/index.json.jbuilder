json.array!(@paver_apps) do |paver_app|
  json.extract! paver_app, :id, :Name, :Line1, :Line2, :Line3, :Line4, :Paver, :Placement, :Row, :Col
  json.url paver_app_url(paver_app, format: :json)
end
