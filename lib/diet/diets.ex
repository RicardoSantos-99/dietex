defmodule Diet.Diets do
  @moduledoc """
  The Diets context.
  """

  import Ecto.Query, warn: false
  alias Diet.Repo

  alias Diet.Diets.ClientDiets

  @doc """
  Returns the list of user_foods.

  ## Examples

      iex> list_user_foods()
      [%ClientDiets{}, ...]

  """
  def list_user_foods do
    Repo.all(ClientDiets)
  end

  @doc """
  Gets a single client_diets.

  Raises `Ecto.NoResultsError` if the Client diets does not exist.

  ## Examples

      iex> get_client_diets!(123)
      %ClientDiets{}

      iex> get_client_diets!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client_diets!(id), do: Repo.get!(ClientDiets, id)

  @doc """
  Creates a client_diets.

  ## Examples

      iex> create_client_diets(%{field: value})
      {:ok, %ClientDiets{}}

      iex> create_client_diets(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client_diets(attrs \\ %{}) do
    %ClientDiets{}
    |> ClientDiets.changeset(attrs)
    |> IO.inspect()
    |> Repo.insert()
  end

  @doc """
  Updates a client_diets.

  ## Examples

      iex> update_client_diets(client_diets, %{field: new_value})
      {:ok, %ClientDiets{}}

      iex> update_client_diets(client_diets, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client_diets(%ClientDiets{} = client_diets, attrs) do
    client_diets
    |> ClientDiets.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client_diets.

  ## Examples

      iex> delete_client_diets(client_diets)
      {:ok, %ClientDiets{}}

      iex> delete_client_diets(client_diets)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client_diets(%ClientDiets{} = client_diets) do
    Repo.delete(client_diets)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client_diets changes.

  ## Examples

      iex> change_client_diets(client_diets)
      %Ecto.Changeset{data: %ClientDiets{}}

  """
  def change_client_diets(%ClientDiets{} = client_diets, attrs \\ %{}) do
    ClientDiets.changeset(client_diets, attrs)
  end
end
