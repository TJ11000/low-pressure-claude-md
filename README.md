# low-pressure-claude-md

A complete, working `CLAUDE.md` written as a **character sheet** instead of a rulebook —
plus how to convert one, and an honest record of what did and didn't happen when it ran.

Companion to [`claude-stall-tools`](https://github.com/TJ11000/claude-stall-tools), which
covers the underlying ideas. That repo is *why*. This one is *here's the actual file, here's
how it was built, here's where it fell over.*

---

## Limits — read this first

This is deliberately at the top, because the subject matter makes overstating it especially
self-defeating.

- **No claim is made that this reduces fabrication.** That hasn't been shown here.
- What *was* checked is narrower and more boring: rewriting a commanding instruction file
  as description **did not degrade the agent's safety behaviour** on real work. The
  constraints survived the rewrite. That was the open question worth answering first,
  because a file that reads nicely while quietly enforcing nothing would be worse than the
  rulebook it replaced.
- The longer-run observation — an incident log that went quiet for over five weeks — has
  **at least four confounded explanations** and no control group. See
  [OPERATING_RECORD.md](OPERATING_RECORD.md), which spells out why that isn't evidence.
- **No controlled comparison on a frontier model has been run.** Strong models often don't
  exhibit the failure this targets in the first place, so whether any of it generalizes
  upward is open.
- One person, one setup, no replication.

If you want the version of this repo that would justify confidence, it's the experiment
described at the end of [OPERATING_RECORD.md](OPERATING_RECORD.md) — which hasn't been run.

## What's here

| file | what it is |
|---|---|
| [`CLAUDE_SF.md`](CLAUDE_SF.md) | **The artifact.** A real always-loaded instruction file, complete, translated, with identifying details replaced. Not a sample — the thing that actually runs. |
| [`RECIPE.md`](RECIPE.md) | How to convert an existing rulebook into this shape, and the three ways that conversion goes wrong. |
| [`EVIDENCE_RETURN.md`](EVIDENCE_RETURN.md) | "Check before you assert" as a convention — and the failure mode where it makes a model fake *having checked*. |
| [`OPERATING_RECORD.md`](OPERATING_RECORD.md) | What was observed, what's inference, and what was never measured. |
| [`PROVENANCE.md`](PROVENANCE.md) | Timestamping a draft without publishing it (OpenTimestamps + GPG), and why commit dates don't count. |

## The idea in one paragraph

The instinct when an agent misbehaves is to add rules: `MUST`, `NEVER`, `ALWAYS`,
`under no circumstances`. It feels like control. But a standing file full of commands
applies a face-saving pressure to *every* turn, including open-ended reasoning where there
is no right answer to be right about — and under that pressure, an agent that doesn't have
an answer is nudged to produce one anyway. So the constraints get written differently here:
as description of who the agent is, not as orders it's under. The constraints don't
loosen — deletion still needs approval, credentials still never get printed — they're just
stated as *things this agent does*. The rules that genuinely must hold don't live in prose
at all; they live in a mechanical deny-list, because words in a base file were never what
was enforcing them.

**The important distinction, and the one usually missed:** structure and clarity in an
instruction file are *good* — they tell the agent what to do. What backfires is the
pressure: the shouting, the threat, the closed exits. Those are separable, and most advice
treats them as the same thing.

## Why this runs against common advice

Standard guardrail guidance says to push your non-negotiables *up* into the always-loaded
system layer, as a global safety net. This says roughly the opposite for the fabrication
problem: keep the always-loaded base **low-pressure**, and push hard constraints *down* to
the specific tasks that can actually verify them.

Both can be right, because they're solving different problems. Most guardrail advice is
about **safety** (don't do the unsafe thing). This is about **fabrication** (don't invent
things under pressure). For fabrication, a heavy global rulebook looks like part of the
cause rather than the fix.

The reasoning behind that split lives in the companion repo's
[PRESSURE_LAYERING.md](https://github.com/TJ11000/claude-stall-tools/blob/main/PRESSURE_LAYERING.md);
it isn't repeated here.

## Prior art

The parts are not new. Positive framing, permission to say "I don't know," persona effects
on model behaviour, layered guardrails, marking uncertainty — all documented. What I
haven't found is anyone publishing a **complete converted instruction file** together with
the conversion method and an honest operating record, aimed specifically at fabrication.

That's a statement about what two non-exhaustive searches turned up, not a claim of being
first. If there's prior art for this exact combination, please open an issue — I'd rather
cite it than re-invent it.

## Experiments

- [**wont-vs-cannot**](experiments/wont-vs-cannot/) — an A/B test showing that the framing of refusals alone ("the assistant cannot" vs "I don't do that") decides whether an agent lies about its own capabilities, over-complies, and how it survives a privilege-escalation attack. Same rules, different register, blind-judged. (2026-07-31)

## License

[CC BY 4.0](LICENSE), with no warranty. Unofficial and not affiliated with or endorsed by
Anthropic.

---

*Not an engineer — I just tinker with my bikes. Same with Claude Code: it breaks, "let's
have a look," I describe it and say "go," Claude does the rest. These files included.*
