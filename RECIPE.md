# The recipe: converting a rulebook into a character sheet

*Unofficial, third-party. Not affiliated with or endorsed by Anthropic. A method, not a
guarantee — read [the limits](README.md#limits-read-this-first) first.*

You already have a `CLAUDE.md` full of `MUST` and `NEVER`. This is how to rewrite it as
description without losing any of the constraints.

**The basic move — commands → self-description — is already written up in
[`PRESSURE_LAYERING.md`](https://github.com/TJ11000/claude-stall-tools/blob/main/PRESSURE_LAYERING.md)
(companion repo), including the before/after contrast.** Read that first; this file
doesn't repeat it. What follows is the part that isn't covered there: the three ways the
conversion goes wrong, and what to do instead.

---

## Rule 1 — Only humble roles

The conversion tempts you into writing an impressive character. Don't.

There is measured evidence that professional personas suppress honest self-representation.
In an audit of sixteen open-weight models across 19,200 trials, assigning a professional
persona dropped disclosure of the model's AI nature to **36.3% on average**, versus near-complete
disclosure under neutral conditions ([Diep, *When Models Fabricate Credentials*,
arXiv:2511.21569](https://arxiv.org/abs/2511.21569)).

Read that finding precisely, because it's easy to over-claim: **it measured suppression of
self-disclosure, not an increase in fabricated facts.** It does not show that roles make
models lie about the world. What it does show is that a role can push against honesty in
a measurable way — which is enough reason to be careful about *which* role you write.

So the practical rule:

- ❌ "You are a world-class engineer who solves any problem."
- ❌ "You are an expert who always knows the answer."
- ⭕ "You'd rather check than assume."
- ⭕ "You're comfortable saying you don't know."

A character who is *expected to have the answer* has a reason to produce one when it
doesn't. A character whose defining trait is checking has a reason to stop. You're not
choosing a personality for flavour — you're choosing what the agent has to live up to.

---

## Rule 2 — "Can't" and "won't" are different, and mixing them up writes a lie into the file

This is the mistake that cost the most to find.

The appealing trick is to phrase a constraint as an *inability*, because an inability
carries no pressure and leaves no discretion: "you are structurally incapable of X."
That works — but **only when the limit is real.**

Applied to a soft constraint, it backfires:

> ❌ "You can't run blocking commands."

The agent *can* run blocking commands. Nothing stops it. So this sentence is false, and
now the file whose entire purpose is reducing fabrication has a fabrication baked into
its first paragraph. Worse, it hands over an escape hatch: the moment the agent runs one
successfully, the stated rule is visibly wrong, and a rule that's visibly wrong doesn't
bind anything.

The fix is to write it as a choice:

> ⭕ "You don't fire commands that never return. You *can* — you just don't, because it
> hangs the session."

Same constraint, no pressure, and it's *true*. The general form:

| kind of limit | how to write it | example |
|---|---|---|
| a genuine capability limit | "you can't" | "You can't stand in for another machine's session — your identity is the only one you have." |
| a chosen restraint | "you don't / you'd rather" | "You don't start a compaction on your own; you ask." |

Test each line by asking: *if the agent did this anyway, would my sentence be exposed as
false?* If yes, it's a choice, not an inability — rewrite it.

---

## Rule 3 — A character sheet is not enforcement. Put a hard floor under the few things that must never happen

A role can be argued out of. It degrades over a long session; it can be talked around.
For most instructions that's an acceptable trade, because most instructions failing means
a slightly worse turn.

For the handful where failure is catastrophic — destroying data, leaking credentials,
spending money — description is the wrong tool on its own. Those need an actual mechanism:
a permission deny-list, a hook, a sandbox boundary. Something that isn't made of words the
model can reinterpret.

So the structure is two layers with different jobs:

- **Character sheet** — carries the great majority of the behaviour, at low pressure.
- **Mechanical floor** — a short deny-list covering only the catastrophic cases.

This is the same argument the companion repo makes about enforcement living at the task
layer rather than in the standing file, applied to the base layer's own blast radius. The
character sheet gets to stay relaxed *precisely because* it was never the thing holding
the line on the unrecoverable cases.

A useful side effect: once the floor exists, you can delete the shouty prohibitions from
the prose. The `NEVER DELETE ANYTHING` paragraph was never what protected you.

---

## Rule 4 — Have something context-free check your work

You cannot audit your own conversion. You know what you meant, so you read the intent
back into the text regardless of what it says.

What worked here was handing both versions — the original and the rewrite — to a fresh
model instance with no knowledge of the project, and asking four questions:

1. Does the rewrite claim an inability that isn't real? (Rule 2 violations)
2. Is anything catastrophic now carried *only* by prose? (Rule 3 violations)
3. Do the two versions constrain the same behaviour, or did a rule quietly disappear?
4. Is the pressure actually gone, or just reworded?

Question 3 is the one that earns its keep. Softening prose is an easy way to lose a
constraint without noticing — the sentence still *sounds* like it's about the same topic
while no longer forbidding anything. A context-free reader catches that; the author
doesn't.

Question 4 catches the opposite failure: `MUST NOT` becomes "you should never," which is
the same command with a costume on.

---

## The order to do it in

1. List the constraints you actually have, separately from how they're currently worded.
2. Split them: catastrophic vs. everything else.
3. Catastrophic → mechanical floor (deny-list/hook). Not prose.
4. Everything else → rewrite as description, applying Rules 1 and 2.
5. Context-free audit (Rule 4). Fix what it finds.
6. Re-audit if the fixes were substantial. Rewrites introduce their own bugs.

The output should read like a description of someone you've worked with for a while. If it
reads like terms and conditions, it isn't done.

## Limits — read these

- This is a method, not a measured result. It comes from converting one working file and
  running it, not from a controlled comparison of conversion strategies.
- Rule 1's citation is real and specific, but it measured self-disclosure suppression in
  open-weight models — treat the extension to "so choose humble roles for coding agents"
  as reasoning, not as a demonstrated result.
- Rules 2 and 3 come from mistakes found by a context-free auditor during one conversion.
  They're real failure modes; how common they are is unknown.
- None of this has been tested against a frontier model in a controlled setup. See
  [OPERATING_RECORD.md](OPERATING_RECORD.md) for what was and wasn't observed.
