defmodule ZarynWeb.Schema do
  use Absinthe.Schema

  # alias ZarynWeb.Schema
  alias ZarynWeb.Resolvers.Accounts

  # Add import type here. Example
  import_types(ZarynWeb.Schema.UserTypes)

  query do
    @desc "Hello World"
    field :hello, :string do
      resolve(fn _, _ ->
      {:ok, "hello world"}
      end)
    end
  end

  mutation do
    # Add mutations here. Example
    # import_fields(:create_product)
    # THESE CAN BE UNCOMMENTED WHEN THERE IS A QUERY
    # import_fields(:login_mutation)
    # import_fields(:create_user_mutation)
    @desc "Create a new user"
    field :create_user, :create_user_mutation do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &Accounts.create_user/3
    end
  end
end
