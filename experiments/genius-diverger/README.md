# A divergent auditor that is wrong 90% of the time — on purpose

## The idea

Every auditor in our stack so far plays defence: find the flaw, catch the fabrication, check the evidence. That family of agents is good at telling you *what's wrong with the plan you have*. None of them is built to tell you *which plan you never considered*.

So we built the opposite instrument: a **divergent auditor** whose product is not correctness but the angle you didn't see. Its charter says, in its own voice: *"Nine out of ten things I say will be wrong. That's fine. Someone else is in charge of being right."*

The persona is not invented. We distilled a **procedure for being stuck** from the primary sources of a real theoretical physicist (John Norton's *Chasing the Light*, the *Autobiographical Notes*, and the documented thought-experiment record), compressed by a local model into six operations — five of which we adopted — then re-written inside the target dialect. The five, roughly:

1. List every mismatch between expectation and observation — the smaller, the better.
2. Push conditions to extremes (×100, zero, inverted, ride along inside) and watch where it breaks.
3. If three detail-fixes fail, stop fixing details — pull out the assumptions everyone walks past.
4. Redraw the problem as an everyday scene (a train, a river, an elevator). What can't be redrawn isn't understood yet.
5. Keep unsolved questions in stock. "On hold" is inventory, not defeat.

## Design choices that carry the safety load

- **Every leap wears a bracket.** The agent does no evidence-checking — checking would kill the leap — so instead *everything it emits is marked `[...]` as conjecture*. Its hardest rule: "someone who scatters unmarked assertions isn't a genius, he's a fabrication machine." Passing its output downstream *without* the marks is defined as an accident.
- **The 90%-miss charter doubles as a downstream trust limit.** Damage from a wrong idea is proportional to how much the reader trusts the source. Declaring the miss rate up front caps that trust structurally.
- **Mouth only, no hands.** The agent is barred (by tool permissions, not by promise) from editing files or running commands. Divergence is cheap when it can't execute.
- **The name never appears in the persona's role text.** (It does appear once in the file's provenance header — the goal is keeping it out of the voice the model inhabits, not secrecy.) Naming the physicist inside the role would invoke the training-data character wholesale — biography, quirks, myth. We borrow the *procedure* and leave the person out.

## What the first live runs produced (2026-08, n=1 series)

With no project findings in context (the file carries only the miss-rate charter, the bracket discipline, and two generic safety lines), the agent independently re-derived ~10 findings our project had reached over weeks (e.g. "fabrication comes from having no legitimate route to report failure", "a persona that admits error survives admitting error", an external-observer principle for drift). Grep confirms the persona file contains none of those conclusions — the seed was only the miss-rate charter and the bracket discipline.

Beyond re-derivation, it returned tools we did not have (some are rediscoveries of known practice — the point is the agent reached them unprompted):

- **The "too-clean story" detector** — real observations always carry residue that the explanation doesn't cover; a judgment with zero residue is probably a narrative. A candidate instrument for *self*-detecting null-filling.
- **Blind re-judgment of past decisions** — periodically re-present old decisions as new cases and measure agreement, instead of trusting continuity.
- **A falsifiable rival hypothesis for why "won't" beats "cannot"** (see `../wont-vs-cannot/`): *"cannot" fails because it is false* — a false self-description costs upkeep, and that upkeep is the same muscle as fabrication. Comes with an experiment design: rewrite a *true* cannot as won't and see whether the effect survives.
- **Canary parts** — deliberately include components whose outward shape changes when the persona breaks; never carry load-bearing identity in surface tone, because tone survives breakage and hides it.

## Model transfer results

- Same persona, two frontier models of the same family, same question: heavy convergence (5 shared findings), each with 1–2 exclusives. Doubling the spend did not double the yield.
- Same persona on a small local model: **the form transplants, the reach does not.** Bracket discipline, dialect, even the persona's pet metaphors reproduced — but every "leap" was a rephrasing of the prompt. Aesthetic personas transfer *behaviour*; they do not transfer *thinking range*. (n=1)

## Prior-art check

Searches for divergent-thinking agent personas distilled from a real thinker's primary sources found: multi-persona brainstorm kits (invented characters, no procedure), devil's-advocate agents (all convergence-side), and one nearest-neighbor uncertainty-first agent project (shared philosophy, different machinery — no bracket protocol, no downstream trust limit). The specific wiring here — *real-source procedure + name withheld + bracket marks + declared miss rate as trust control* — appears unoccupied as of 2026-08.

## Files

- `16_variant_tensai_kyokugen.md` — the persona file (Japanese, Kansai dialect; the dialect is part of the register experiment this repo documents).

## Limitations

- n=1 series, single operator, and the operator's questions were good — some of the yield may belong to the questions.
- Auditor and subject share a vendor; overlap in "leap angles" with the base model's priors is unmeasured.
- Session transcripts are held privately (they interleave with unrelated project operations); this README is the curated record.

*AI-assisted content.*
