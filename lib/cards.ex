defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    "Hi there!"
  end


  def create_deck do
    ["Ace","Two","Three"]
  end

  @doc """
    Barajar las cartas
  """
  def shuffle( deck ) do
    Enum.shuffle(deck)
  end

  def contains?( deck, hand ) do
    Enum.member?(deck,hand)
  end
end
