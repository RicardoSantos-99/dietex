defmodule DietWeb.ImcControllerTest do
  use DietWeb.ConnCase

  import Diet.ProfileFixtures

  alias Diet.Profile.Imc

  @create_attrs %{
    user: "some user",
    age: 42,
    height: 120.5,
    weight: 120.5
  }
  @update_attrs %{
    user: "some updated user",
    age: 43,
    height: 456.7,
    weight: 456.7
  }
  @invalid_attrs %{user: nil, age: nil, height: nil, weight: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all imc", %{conn: conn} do
      conn = get(conn, ~p"/api/imc")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create imc" do
    test "renders imc when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/imc", imc: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/imc/#{id}")

      assert %{
               "id" => ^id,
               "age" => 42,
               "height" => 120.5,
               "user" => "some user",
               "weight" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/imc", imc: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update imc" do
    setup [:create_imc]

    test "renders imc when data is valid", %{conn: conn, imc: %Imc{id: id} = imc} do
      conn = put(conn, ~p"/api/imc/#{imc}", imc: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/imc/#{id}")

      assert %{
               "id" => ^id,
               "age" => 43,
               "height" => 456.7,
               "user" => "some updated user",
               "weight" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, imc: imc} do
      conn = put(conn, ~p"/api/imc/#{imc}", imc: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete imc" do
    setup [:create_imc]

    test "deletes chosen imc", %{conn: conn, imc: imc} do
      conn = delete(conn, ~p"/api/imc/#{imc}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/imc/#{imc}")
      end
    end
  end

  defp create_imc(_) do
    imc = imc_fixture()
    %{imc: imc}
  end
end
