defmodule Diet.Profile do
  @moduledoc """
  The Profile context.
  """

  import Ecto.Query, warn: false
  alias Diet.Repo

  alias Diet.Profile.Imc

  @doc """
  Returns the list of imc.

  ## Examples

      iex> list_imc()
      [%Imc{}, ...]

  """
  def list_imc do
    Repo.all(Imc)
  end

  @doc """
  Gets a single imc.

  Raises `Ecto.NoResultsError` if the Imc does not exist.

  ## Examples

      iex> get_imc!(123)
      %Imc{}

      iex> get_imc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_imc!(id), do: Repo.get_by(Imc, user: id)

  def list_imc_by_user(user_id) do
    Imc
    |> where([i], i.user == ^user_id)
    |> limit(10)
    |> Repo.all()
  end

  @doc """
  Creates a imc.

  ## Examples

      iex> create_imc(%{field: value})
      {:ok, %Imc{}}

      iex> create_imc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_imc(attrs \\ %{}) do
    %Imc{}
    |> Imc.changeset(attrs)
    |> Repo.insert()
    |> IO.inspect()
  end

  @doc """
  Updates a imc.

  ## Examples

      iex> update_imc(imc, %{field: new_value})
      {:ok, %Imc{}}

      iex> update_imc(imc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_imc(%Imc{} = imc, attrs) do
    imc
    |> Imc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a imc.

  ## Examples

      iex> delete_imc(imc)
      {:ok, %Imc{}}

      iex> delete_imc(imc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_imc(%Imc{} = imc) do
    Repo.delete(imc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking imc changes.

  ## Examples

      iex> change_imc(imc)
      %Ecto.Changeset{data: %Imc{}}

  """
  def change_imc(%Imc{} = imc, attrs \\ %{}) do
    Imc.changeset(imc, attrs)
  end
end
