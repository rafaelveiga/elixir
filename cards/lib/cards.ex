defmodule Cards do
  def start() do
    create_deck()
    |> shuffle()
    |> deal_cards(3)
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

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def deal_cards(deck, qty) do
    Enum.split(deck, qty)
  end
end
