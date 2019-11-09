defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    string_nucleotide = <<nucleotide::utf8>>

    strand |> to_string() |> String.graphemes() |> Enum.count(&(&1 == string_nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  # return a map that gives me how many times each thing occured
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    strand
    |> Enum.reduce(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn nucleotide, hist ->
      Map.update(hist, nucleotide, 1, &(&1 + 1))
    end)

    # Enum.reduce(chars, %{}, fn x, acc -> Map.put(acc, x, x) end)
  end
end
