module Definitions exposing (Definitions, Entry, Spec, fromSpec, usedKanji)

import DefinitionData
import DefinitionTypes exposing (OnlyKanji, entryStrings)
import Set exposing (Set)


type alias Entry =
    DefinitionTypes.Entry


type alias Spec =
    DefinitionTypes.Spec


type alias Definitions =
    List Entry


fromSpec : Spec -> Definitions
fromSpec spec =
    DefinitionData.all
        |> List.filter (matchesSearch spec.search)


matchesSearch : String -> Entry -> Bool
matchesSearch search entry =
    if search == "" then
        True

    else
        entryStrings entry
            |> List.any (String.contains search)


usedKanji : Definitions -> Set OnlyKanji
usedKanji definitions =
    definitions
        |> List.filterMap
            (\entry ->
                case String.filter isKanji entry.includesKanji of
                    "" ->
                        Nothing

                    other ->
                        Just other
            )
        |> Set.fromList


isKanji : Char -> Bool
isKanji char =
    -- For the purposes of geemu-nihongo we are, in some sense, only
    -- interested in the subset of kani used in Japanese. However,
    -- Unicode doesn't make it easy to track that distinction. This is
    -- understandable becasue the Japanese language is still alive and
    -- could very well stop using certain ones or borrow additional
    -- kanji from other languages in the future.
    -- Futhermore, it's conceivable that a Japanese game may include
    -- words that contain non-japanese kanji, as a flavour element or
    -- even as something the playe is expected to learn to recognize.
    -- It's also worth noting that Unicode does change over time, so
    -- whatever we do here won't necessarily be correct forever.
    -- All in all, it seems best to simply include all the current kanji
    -- unicode blocks, whether they currently contain Japanese Kanji,
    -- or not.
    --
    -- There are some Unicode blocks that contain some Kanji characters
    -- but also other symbols. For example, the CJK Compatibility block
    -- contains both "㍺" (not really kanji) and "㍻" (arguably Kanji).
    -- It's quite likely that this function will never actually be
    -- passed any of these symbols. Until such time that it seems worth
    -- it to dig into these blocks and define which symbols inside them
    -- are considered Kanji or not, it seems best to aim to remove false
    -- negatives (returning False for any kanji) but accept false
    -- positives (returning True for non-kanji). So we will include the
    -- entire block in question in this and similar cases.
    --
    -- As of this writing only Unicode 15.0 has been published, so only
    -- the following blocks are known to contain Kanji:
    --
    -- CJK Unified Ideographs (4E00-62FF, 6300-77FF, 7800-8CFF, 8D00-9FFF)
    -- CJK Unified Ideographs Extension A (3400-4DBF)
    -- CJK Unified Ideographs Extension B (20000-215FF, 21600-230FF, 23100-245FF, 24600-260FF, 26100-275FF, 27600-290FF, 29100-2A6DF)
    -- CJK Unified Ideographs Extension C (2A700-2B73F)
    -- CJK Unified Ideographs Extension D (2B740–2B81F)
    -- CJK Unified Ideographs Extension E (2B820–2CEAF)
    -- CJK Unified Ideographs Extension F (2CEB0–2EBEF)
    -- CJK Unified Ideographs Extension G (30000–3134F)
    -- CJK Unified Ideographs Extension H (31350–323AF)
    -- CJK Compatibility (3300–33FF)
    -- CJK Compatibility Ideographs (F900–FAFF)
    -- CJK Compatibility Ideographs Supplement (2F800–2FA1F)
    --
    (char
        > '㌀'
        && char
        <= '\u{4DBF}'
     -- '\u{3300}' - '\u{4DBF}': CJK Compatibility, CJK Unified Ideographs Extension A
     -- We intentionally leave out the Yijing Hexagram Symbols (4DC0-4DFF)
    )
        || (char
                > '一'
                && char
                <= '\u{9FFF}'
            -- '\u{4E00}' - '\u{9FFF}': CJK Unified Ideographs
           )
        || (char
                > '豈'
                && char
                <= '\u{FAFF}'
            -- '\u{F900}' - '\u{FAFF}': CJK Compatibility Ideographs
           )
        || (char
                > '𠀀'
                && char
                <= '\u{2EBEF}'
            -- '\u{20000}' - '\u{2EBEF}': CJK Unified Ideographs Extension B, C, D, E, F,
           )
        || (char
                > '丽'
                && char
                <= '\u{2FA1F}'
            -- '\u{2F800}' - '\u{2FA1F}': CJK Compatibility Ideographs Supplement
           )
        || (char
                > '\u{30000}'
                && char
                <= '\u{323AF}'
            -- '\u{30000}' - '\u{323AF}': CJK Unified Ideographs Extension G, H
           )
