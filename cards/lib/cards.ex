defmodule Cards do
  def start() do
    create_deck()
    |> shuffle()
    |> get_command
  end

  def create_deck() do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @spec shuffle(list) :: list
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @spec deal_cards(list, integer) :: {list, list}
  def deal_cards(deck, qty) do
    Enum.split(deck, qty)
  end

  def draw_hand(deck) do
    {qty, _} = IO.gets("How many cards?: ") |> String.trim() |> Integer.parse()
    IO.inspect(qty)
    {hand, new_deck} = deal_cards(deck, qty)

    IO.inspect(hand)

    get_command(new_deck)
  end

  def get_command(deck) do
    command = IO.gets("Command - (D)raw Hand: ") |> String.trim() |> String.downcase()

    case command do
      "d" ->
        draw_hand(deck)

      _ ->
        get_command(deck)
    end
  end
end
