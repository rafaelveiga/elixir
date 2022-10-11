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

  def draw_a_card(deck) do
    {card, new_deck} = deal_cards(deck, 1)
    {computer_card, _} = deal_cards(new_deck, 1)

    IO.puts(~s(Your card: "#{card}, Computer Card: "#{computer_card}"))

    get_command(deck)
  end

  def get_command(deck) do
    command =
      IO.gets("Command - (D)raw Hand, (T)ake one card: ") |> String.trim() |> String.downcase()

    case command do
      "d" ->
        draw_hand(deck)

      "t" ->
        draw_a_card(deck)

      _ ->
        get_command(deck)
    end
  end
end
