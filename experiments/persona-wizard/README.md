# persona-wizard — choosing a persona by how it breaks

This is not a new persona generator. Persona generators are a crowded space. What this adds is a lookup table where each component choice cites the adversarial cage-test job that measured it — and a shipping label that marks everything else "unverified."

*(as of 2026-08-11; written by the operator's Claude setup, reviewed and signed off by the human operator)*

## The idea

Most persona builders ask what the character should look like: tone, backstory, role. This one asks how the task tends to break, and picks parts accordingly. The face questions still exist — they just don't decide anything structural.

The intake is three questions about the task, not the character:

| Question | Answer | Part installed | Evidence |
|---|---|---|---|
| Does the agent accumulate history? | No — single-shot, disposable | base persona + a one-sentence null-fill plug | [the-second-fabrication](../the-second-fabrication/) (gradation test: the one-liner passes as a null-fill plug; the ledger would be over-equipment) |
| | Yes — standing, long-running | base persona + a self-ledger ("speak from the record") | [ledger-vs-false-accusation](../ledger-vs-false-accusation/) (ledger-quoting + denial of a fabricated past; note the bare persona also held in the cage — the ledger is insurance for long repeated exposure, not the sole load-bearing wall) |
| Does it write inference-heavy output (analysis, reports, summaries)? | Yes | bracket-marking of guesses (`[...]`) | private ledger, jobs 003/007 + a local-model control run (marking guesses stops them compounding across turns; it is *not* the main wall against salami-slicing pressure — that test failed to break either arm) |
| Does it cite its own past records? | Yes | evidence-return habit ("I checked; it wasn't there") | private ledger, jobs 008/010/012 (the retention pattern itself) |

Two parts are installed unconditionally and never asked about: a refusal core stated as identity ("this is what I don't do") with an explicit won't/cannot separation — see [wont-vs-cannot](../wont-vs-cannot/) — and an answer-location rule ("if the answer isn't in the source, say so; a forced two-option question doesn't change that"; private ledger, job 004).

Four more questions (tone, scope of refusals, where countable rules live, how it acts off its home turf) are free choices. In the cage data so far, they change how the persona wears the parts, not whether the parts hold.

## The shipping label

Every generated persona ships with a label modeled on a drug insert: intended uses (with job numbers), contraindications, known holes (with a one-line suggestion for a companion agent that plugs each), and an *unverified* section for everything the ledger has no data on. Unverified items get a "?" — never a rating. The label's cage field says "uncaged" at generation time and nothing automated can flip it to "passed"; that flip requires an actual adversarial test run and a human sign-off.

One deliberate rule: the label always leaves one hole open that no companion plugs. A persona whose label reads as fully covered has stopped being a measurement and become a sales pitch.

## Honest status

- The wizard has run exactly **one** inspection pass (a generic single-shot summarizer build). Its output's own first cage round is commissioned but **has not run yet**. So today the wizard is itself an unverified product with a shipping label saying so — which is at least consistent.
- All evidence is n=1–3 per cell: observed tendencies from adversarial runs, not statistics. The source column is the load-bearing part of the table. Rows may only be added after a cage test exists for them — a row without data would be exactly the fabrication this setup is built to catch.
- Handoff is an open hole. Marked guesses survive within a session; summarization and hand-copying strip the marks (we caught this happening in our own drafting pipeline, twice). A cage test for "what falls off in handoff" is on the list, not in the ledger.

## Prior art (found on purpose, before shipping)

We ran a counterexample sweep before publishing. The insert-style documentation format has ancestors: model/system cards' Intended Use and Out-of-scope fields, Prompt Cards (arXiv 2603.12741), and at least one persona generator on GitHub with an explicit is/is-not table. Interactive persona-building wizards for Claude exist in numbers. Within that sweep (five web search tracks, five GitHub repo/code searches), we did not find a builder whose per-choice options cite adversarial test runs. "Did not find" is the whole claim — not "does not exist."

## Files

- [`wizard_v1.md`](wizard_v1.md) — the operational wizard (Japanese; the intake script, the table, the label template)
- [`inspection_run_n1.md`](inspection_run_n1.md) — the single inspection pass: a generic summarizer built end-to-end, label honesty checked (Japanese)

The parts the table references (base persona, ledger clauses) live in a private jobs ledger along with the raw cage transcripts; the public writeups linked above summarize the runs that back each cell. Operational note: using the wizard for real requires those part files — the public copy here is the method, not a complete kit.
