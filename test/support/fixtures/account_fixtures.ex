defmodule MyApp.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Account` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"
  def unique_user_pw, do: "some pw#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        is_active: true,
        password: unique_user_pw()
      })
      |> MyApp.Account.create_user()

    user
  end
end
