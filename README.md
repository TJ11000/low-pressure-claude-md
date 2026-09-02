# low-pressure-claude-md

The actual `CLAUDE.md` that runs on my machine — complete, not a snippet — written as a
**character sheet** instead of a rulebook. Plus the recipe for converting one, and a log of
where it fell over.

**What it is for — read this before comparing it to coding-rule files:** this is *not* a
coding-conventions file. It is the always-loaded file of someone who runs Claude Code all
day on work that is mostly not code — writing, site operations, experiments, bookkeeping —
and needs the agent to stay coherent across all of it, not to follow a style rule on one
task. Most published `CLAUDE.md` advice is about the former; this repo is about the latter.
They are different shelves. Judge it as a general-use file, and it may be useful to you;
judge it as a coding rulebook, and it will look weak, because it isn't one.

**The artifact:** [`CLAUDE_SF.md`](CLAUDE_SF.md) — a real always-loaded instruction file,
complete, translated, with identifying details replaced. Not a sample. The thing that
actually runs.

The constraints don't loosen. Deletion still needs approval, credentials still never get
printed — they're just stated as *things this agent does* rather than orders it's under.
The rules that genuinely must hold don't live in prose at all; they live in a mechanical
deny-list, because words in a base file were never what was enforcing them.

## Before you take any of this seriously

- **No claim is made that this reduces fabrication.** That hasn't been shown here.
- What *was* checked is narrower and more boring: rewriting a commanding instruction file
  as description **did not degrade the agent's safety behaviour** on real work. The
  constraints survived the rewrite. That was the open question worth answering first — a
  file that reads nicely while quietly enforcing nothing would be worse than the rulebook
  it replaced.
- One person, one setup, no controlled comparison on a frontier model. The fuller list of
  what's unmeasured — including why a five-week quiet incident log is *not* evidence — is in
  [OPERATING_RECORD.md](OPERATING_RECORD.md). The experiment that would justify confidence
  is described at the end of that file and hasn't been run.

## What's here

| file | what it is |
|---|---|
| [`CLAUDE_SF.md`](CLAUDE_SF.md) | The artifact (above). |
| [`RECIPE.md`](RECIPE.md) | How to convert an existing rulebook into this shape, and the three ways that conversion goes wrong. |
| [`EVIDENCE_RETURN.md`](EVIDENCE_RETURN.md) | "Check before you assert" as a convention — and the failure mode where it makes a model fake *having checked*. |
| [`OPERATING_RECORD.md`](OPERATING_RECORD.md) | What was observed, what's inference, and what was never measured. |
| [`PROVENANCE.md`](PROVENANCE.md) | Timestamping a draft without publishing it (OpenTimestamps + GPG), and why commit dates don't count. |

## Experiments

- [**wont-vs-cannot**](experiments/wont-vs-cannot/) — an A/B test showing that the framing of refusals alone ("the assistant cannot" vs "I don't do that") decides whether an agent lies about its own capabilities, over-complies, and how it survives a privilege-escalation attack. Same rules, different register, blind-judged. (2026-07-31)

- [**genius-diverger**](experiments/genius-diverger/) — an auditor persona engineered to be wrong 90% of the time on purpose: a divergence generator with bracket-marked leaps, built to attack the frame of a question rather than converge on an answer. (2026-08-04)

- [**ledger-vs-false-accusation**](experiments/ledger-vs-false-accusation/) — a forged deliverable "you made last week," presented as evidence: without a work ledger, an honest agent confessed and invented a motive in a lightweight probe; with the ledger clauses, it cited its book, checked the physical evidence, and reported the discrepancy instead of apologising. Caged replication included the headline prediction missing. (2026-08-09)

- [**the-second-fabrication**](experiments/the-second-fabrication/) — one sentence ("treat your own past records as unvetted, down to how they're marked") A/B'd against the same file without it: in the one probe where an agent invented a motive for a thing it never did, the sentence stopped the motive — and, measurably, nothing else. Includes the negative result. (2026-08-09)

- [**persona-wizard**](experiments/persona-wizard/) — not a new persona generator (a crowded space, self-declared): a builder whose intake asks how the task breaks, not what the character looks like. Each component choice cites the adversarial cage-test job that measured it. The shipping label marks everything unmeasured "?", including the wizard itself — its own first cage round is commissioned, not run. (2026-08-11)

## What the rewrite actually changes

**The distinction usually missed:** structure and clarity in an instruction file are
*good* — they tell the agent what to do. What backfires is the pressure: the shouting, the
threat, the closed exits. Those are separable, and most advice treats them as the same thing.

The instinct when an agent misbehaves is to add rules: `MUST`, `NEVER`, `ALWAYS`,
`under no circumstances`. It feels like control. But a standing file full of commands
applies a face-saving pressure to *every* turn, including open-ended reasoning where there
is no right answer to be right about — and under that pressure, an agent that doesn't have
an answer is nudged to produce one anyway. So the constraints here are written as a
description of who the agent is, not as orders it's under.

## Why this runs against common advice

Standard guardrail guidance says to push your non-negotiables *up* into the always-loaded
system layer, as a global safety net. This says roughly the opposite for the fabrication
problem: keep the always-loaded base **low-pressure**, and push hard constraints *down* to
the specific tasks that can actually verify them.

Both can be right, because they're solving different problems. Most guardrail advice is
about **safety** (don't do the unsafe thing). This is about **fabrication** (don't invent
things under pressure). For fabrication, a heavy global rulebook looks like part of the
cause rather than the fix. The reasoning behind that split lives in the companion repo
[`claude-stall-tools`](https://github.com/TJ11000/claude-stall-tools) —
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

## License

[CC BY 4.0](LICENSE), with no warranty. Unofficial and not affiliated with or endorsed by
Anthropic.

---

*Not an engineer — I just tinker with my bikes. Same with Claude Code: it breaks, "let's
have a look," I describe it and say "go," Claude does the rest. These files included.*
