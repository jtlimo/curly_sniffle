defmodule CurlySniffleTest do
  use ExUnit.Case
  doctest CurlySniffle

  test "greets the world" do
    assert CurlySniffle.hello() == :world
  end
end
