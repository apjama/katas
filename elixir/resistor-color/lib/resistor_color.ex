defmodule ResistorColor do
  @moduledoc false

  @spec colors() :: list(String.t())
  def colors do
    colors = [
      "black",
      "brown",
      "red",
      "orange",
      "yellow",
      "green",
      "blue",
      "violet",
      "grey",
      "white"
    ]
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    color_tuple = Enum.with_index(colors())
    color_map = Enum.into(color_tuple, %{})
    {:ok, color_code} = Map.fetch(color_map, color)
    color_code
  end
end
