defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "greets the world" do
    assert Cards.hello() == "Hi there!"
  end

end
