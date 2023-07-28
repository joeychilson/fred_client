defmodule FredClientTest do
  use ExUnit.Case
  doctest FredClient

  test "greets the world" do
    assert FredClient.hello() == :world
  end
end
