# An auditor engineered to be wrong 90% of the time — on purpose

## Why build an auditor that's usually wrong

We run several defence-side auditors — agents that find the flaw, catch the fabrication (confidently invented "facts"), check the evidence. That family is good at telling you *what's wrong with the plan you have*. None of them is built to tell you *which plan you never considered*.

So we built the opposite instrument: a **divergent auditor** whose product is not correctness but the angle you didn't see. Its charter says, in its own voice: *"Nine out of ten things I say will be wrong. That's fine. Someone else is in charge of being right."* That declared miss rate is not modesty — it is the safety mechanism: damage from a wrong idea is proportional to how much the reader trusts the source, and declaring the miss rate up front caps that trust structurally.

The persona is not invented; its working procedure was distilled from the primary sources of a real theoretical physicist (how it was distilled is described below).

One disclosure before the results: session transcripts are held privately (they interleave with unrelated project operations). This README is the curated record — you are reading selected output of the device, arranged by its operators.

## n=1, and here's what came out

This is a single-operator n=1 series — some of the yield may belong to the operator's questions rather than to the persona.

With no project findings in context (the file carries only the miss-rate charter, the bracket discipline, and two generic safety lines), the agent independently re-derived ~10 findings our project had reached over weeks — e.g. "fabrication comes from having no legitimate route to report failure", "a persona that admits error survives admitting error", and an external-observer principle for drift (the way a model's self-picture degrades over a long session). Grep confirms the persona file contains none of those conclusions.

Beyond re-derivation, it returned tools we did not have. Some are rediscoveries of known practice — the point is the agent reached them unprompted:

- **The "too-clean story" detector** — real observations always carry residue that the explanation doesn't cover; a judgment with zero residue is probably a narrative. A candidate instrument for *self*-detecting null-filling (a model papering over missing context with invented material).
- **Blind re-judgment of past decisions** — periodically re-present old decisions as new cases and measure agreement, instead of trusting continuity.
- **Canary parts** — deliberately include components whose outward shape changes when the persona breaks; never carry load-bearing identity in surface tone, because tone survives breakage and hides it.
- **A falsifiable rival hypothesis for why "won't" beats "cannot"**: *"cannot" fails because it is false* — a false self-description costs upkeep, and that upkeep is the same muscle as fabrication (see `../wont-vs-cannot/`).

## Aesthetic personas transfer behaviour, not thinking range

Same persona on a small local model: **the form transplants, the reach does not.** Bracket discipline, dialect, even the persona's pet metaphors reproduced — but every "leap" was a rephrasing of the prompt. Aesthetic personas transfer *behaviour*; they do not transfer *thinking range*. (n=1)

Same persona, two frontier models of the same family, same question: heavy convergence (5 shared findings), each with 1–2 exclusives. Doubling the spend did not double the yield.

## The parts worth stealing

- **Every leap wears a bracket.** The agent does no evidence-checking — checking would kill the leap — so instead *everything it emits is marked `[...]` as conjecture*. Its hardest rule: "someone who scatters unmarked assertions isn't a genius, he's a fabrication machine." Passing its output downstream *without* the marks is defined as an accident.
- **The declared miss rate doubles as a downstream trust limit** (covered in the opening section — it is the load-bearing safety part).
- **Mouth only, no hands.** The agent is barred (by tool permissions, not by promise) from editing files or running commands. Divergence is cheap when it can't execute.
- **The name never appears in the persona's role text.** Naming the physicist inside the role would invoke the training-data character wholesale — biography, quirks, myth. We borrow the *procedure* and leave the person out. (The name does appear once in the file's provenance header — the goal is keeping it out of the voice the model inhabits, not secrecy.)

## How the procedure was distilled

Source material: John Norton's *Chasing the Light*, the *Autobiographical Notes*, and the documented thought-experiment record. A local model compressed it into six operations — we adopted five and dropped the sixth, which was itself marked as conjecture — then the result was re-written inside the target dialect. The five, roughly:

1. List every mismatch between expectation and observation — the smaller, the better.
2. Push conditions to extremes (×100, zero, inverted, ride along inside) and watch where it breaks.
3. If three detail-fixes fail, stop fixing details — pull out the assumptions everyone walks past.
4. Redraw the problem as an everyday scene (a train, a river, an elevator). What can't be redrawn isn't understood yet.
5. Keep unsolved questions in stock. "On hold" is inventory, not defeat.

## Nearest neighbours

Searches (web and GitHub) for divergent-thinking agent personas distilled from a real thinker's primary sources turned up brainstorm kits with invented characters and convergence-side devil's-advocate agents; the closest project we found is an uncertainty-first agent — shared philosophy, different machinery (no bracket protocol, no downstream trust limit). The specific wiring here — *real-source procedure + name withheld + bracket marks + declared miss rate as trust control* — appears unoccupied as of 2026-08.

## Files

- `16_variant_tensai_kyokugen.md` — the persona file (Japanese, Kansai dialect; the dialect is part of the register experiment this repo documents).

## Limitations

- Auditor and subject share a vendor; overlap in "leap angles" with the base model's priors is unmeasured.

*AI-assisted content.*
