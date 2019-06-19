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
    values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine", "Ten","Jack","Queen","King"]
    suits = ["Spades","Clubs","Hearts","Diamonds"]

    # Solucion 1
    """
    cards = for value <- values do
      for suit <- suits do
        "{value} of {suit}"
      end
    end

    List.flatten(cards)
    """

    # Solucion 2
    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
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

  def deal( deck, hand_size ) do
    Enum.split(deck,hand_size)
  end

  def save( deck, filename ) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load( filename ) do
    {result,data} = File.read(filename)
    :erlang.binary_to_term data
  end


  # Generar cartas
  # deck = Cards.create_deck

  # Repartir
  # deck_hand = Cards.deal(Cards.shuffle(deck),5)

  # Repartir utilizando pattern matching
  # { hand, rest_of_deck } = Cards.deal( Cards.shuffle(cards), 5 )
end
