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
    letter = String.split_at(nucleotide, 1)
    count(strand, fn x -> x == letter end)
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
    map = Enum.reduce(chars, %{}, fn x, acc -> Map.put(acc, x, x) end)
  end
end
