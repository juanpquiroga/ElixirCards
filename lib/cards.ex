defmodule Cards do
  @moduledoc """
  Provee métodos para crear y gestionar un conjunto de cartas
  """

  @doc """
  Método base

  ## Ejemplos

      iex> Cards.hello()
      "Hi there!"

  """
  def hello do
    "Hi there!"
  end


  @doc """
  Crea el conjunto de cartas de todas las figuras

  ## Ejemplos

      iex> deck = Cards.create_deck
      iex> length(deck)
      52
  """
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

  ## Ejemplo

      iex> deck = Cards.create_deck
      iex> shuffled_deck = Cards.shuffle( deck )
      iex> length( shuffled_deck )
      52
  """
  def shuffle( deck ) do
    Enum.shuffle(deck)
  end

  @doc """
  Indica si una mano esta dentro de un conjunto de cartas

  ## Ejemplo

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Ace of Spades")
      true
  """
  def contains?( deck, hand ) do
    Enum.member?(deck,hand)
  end

  @doc """
  Repartir las cartas retornando la mano y las cartas restantes.
  El argumento `hand_size` indica cuantas cartas debe tener la mano.

  ## Ejemplo

  Repartir las cartas sin barajar:

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  Otro ejemplo barajando las cartas previamente:

      iex> deck = Cards.create_deck
      iex> { hand, _rest_of_deck } = Cards.deal( Cards.shuffle(deck), 5 )
      iex> length(hand)
      5

  """
  def deal( deck, hand_size ) do
    Enum.split(deck,hand_size)
  end

  @doc """
  Guarda las cartas en un archivo con el nombre `filename`
  """
  def save( deck, filename ) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  @doc """
  Carga las cartas en un archivo con el nombre `filename`
  """
  def load( filename ) do
    #{status,data} = File.read(filename)

    case File.read(filename) do
      {:ok, data} -> :erlang.binary_to_term data
      {:error, _reason} -> "No existe el archivo"
    end
  end

  @doc """
  Crea una mano realizando la creación del conjunto de cartas,
  barajando y finalmente entregando una mano de tamaño `hand_size`

  ## Ejemplo

      iex> { hand, _deck } = Cards.create_hand( 3 )
      iex> length(hand)
      3
  """
  def create_hand( hand_size ) do
    #deck = Cards.create_deck
    #deck = Cards.shuffle deck
    #hand = Cards.deal(deck,hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal( hand_size )
  end
  
end
