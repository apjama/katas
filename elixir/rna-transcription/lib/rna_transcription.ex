defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  def convert_dna(dna) do
    dna_to_rna_mapping = %{71 => 67, 67 => 71, 84 => 65, 65 => 85}
    dna_to_rna_mapping[dna]
  end

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &convert_dna/1)
  end
end
