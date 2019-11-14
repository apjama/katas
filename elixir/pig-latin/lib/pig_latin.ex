defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @consonants ["ch", "qu", "squ", "thr", "th", "sch"]
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_to_pig_latin(&1, String.starts_with?(&1, @consonants)))
    |> Enum.join(" ")
  end

  def translate_to_pig_latin(phrase, true) do
    [consonant, rest] =
      @consonants
      |> Enum.join("|")
      |> Regex.compile!()
      |> Regex.split(phrase, include_captures: true)
      |> Enum.reject(&(&1 == ""))

    rest <> consonant <> "ay"
  end

  def translate_to_pig_latin(phrase, false) do
    [consonants | rest] =
      Regex.split(~r/[aeiou]|x[^aeiou]|y[^aeiou]/, phrase, include_captures: true)

    Enum.join(rest, "") <> consonants <> "ay"
  end
end
