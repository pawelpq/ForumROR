json.array!(@f_threads) do |f_thread|
  json.extract! f_thread, :id, :subject, :date, :sub_category_id
  json.url f_thread_url(f_thread, format: :json)
end
