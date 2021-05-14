defmodule ZarynWeb.Schema do
  use Absinthe.Schema

  alias ZarynWeb.Schema

  # Add import type here. Example
  # import_types(Schema.ProductTypes)

  query do
    # Add queries here. Example
    # import_fields(:get_products)
  end

  mutation do
    # Add mutations here. Example
    # import_fields(:create_product)
    # THESE CAN BE UNCOMMENTED WHEN THERE IS A QUERY
    # import_fields(:login_mutation)
    # import_fields(:create_user_mutation)

  end
end