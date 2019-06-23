defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "greets the world" do
    assert Cards.hello() == "Hi there!"
  end

  test "create_deck debe crear 52 cartas " do
    deck_length = length( Cards.create_deck() )
    assert deck_length == 52
  end

  test "verificar que barajar no retorna las mismas cartas" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end
