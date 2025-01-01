defmodule StudyElixirTest do
  use ExUnit.Case
  doctest StudyElixir

  test "greets the world" do
    assert StudyElixir.hello() == :world
  end
end
