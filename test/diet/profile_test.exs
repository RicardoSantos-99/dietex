defmodule Diet.ProfileTest do
  use Diet.DataCase

  alias Diet.Profile

  describe "imc" do
    alias Diet.Profile.Imc

    import Diet.ProfileFixtures

    @invalid_attrs %{user: nil, age: nil, height: nil, weight: nil}

    test "list_imc/0 returns all imc" do
      imc = imc_fixture()
      assert Profile.list_imc() == [imc]
    end

    test "get_imc!/1 returns the imc with given id" do
      imc = imc_fixture()
      assert Profile.get_imc!(imc.id) == imc
    end

    test "create_imc/1 with valid data creates a imc" do
      valid_attrs = %{user: "some user", age: 42, height: 120.5, weight: 120.5}

      assert {:ok, %Imc{} = imc} = Profile.create_imc(valid_attrs)
      assert imc.user == "some user"
      assert imc.age == 42
      assert imc.height == 120.5
      assert imc.weight == 120.5
    end

    test "create_imc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_imc(@invalid_attrs)
    end

    test "update_imc/2 with valid data updates the imc" do
      imc = imc_fixture()
      update_attrs = %{user: "some updated user", age: 43, height: 456.7, weight: 456.7}

      assert {:ok, %Imc{} = imc} = Profile.update_imc(imc, update_attrs)
      assert imc.user == "some updated user"
      assert imc.age == 43
      assert imc.height == 456.7
      assert imc.weight == 456.7
    end

    test "update_imc/2 with invalid data returns error changeset" do
      imc = imc_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_imc(imc, @invalid_attrs)
      assert imc == Profile.get_imc!(imc.id)
    end

    test "delete_imc/1 deletes the imc" do
      imc = imc_fixture()
      assert {:ok, %Imc{}} = Profile.delete_imc(imc)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_imc!(imc.id) end
    end

    test "change_imc/1 returns a imc changeset" do
      imc = imc_fixture()
      assert %Ecto.Changeset{} = Profile.change_imc(imc)
    end
  end
end
