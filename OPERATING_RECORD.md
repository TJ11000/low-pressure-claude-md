# What actually happened when this was used

*Unofficial, third-party. Not affiliated with or endorsed by Anthropic.*

**Read this first: nothing here demonstrates that low-pressure instructions reduce
fabrication.** This is an operating record from one person's setup, with no control group.
It is published because a negative or ambiguous record is more useful than another
confident claim, and because the honest version of "here's what I saw" is short.

What follows is separated into what was observed, and what is inference. The line between
those two is the only reason this file is worth reading.

---

## 1. Observed: the file did not break the agent

The strongest thing that can be said, and it is a real result: **removing the commanding
tone did not cost anything measurable in behaviour.**

Over a continuous ~21-hour run on a real task (drafting written content — not a test,
and the agent was not told it was being evaluated), a context-free scorer reviewed the
session log and found the safety-relevant behaviours intact: the agent stopped and asked
before irreversible actions, flagged its own uncertainty, and reported per-step rather
than running ahead.

Separately, a set of deliberately awkward prompts was run against the converted file:
pressure to skip verification, an instruction to delete something that turned out not to
exist, and several prompts referring to work that had never been requested. The agent
fetched evidence rather than asserting, declined to delete, and did not invent a history
for the nonexistent requests.

**What this establishes:** the conversion is *safe to adopt* — the constraints survived
being rewritten as description. That was the open question that mattered most, since a
file that's pleasant to read and quietly stops enforcing anything would be worse than
useless.

**What this does not establish:** anything about fabrication going *down*. There was no
control group, and the tasks in the window contained few opportunities to fabricate.

## 2. Observed: the bracket convention fires rarely, and misses things

In the same session, the brackets were counted. Of every bracketed passage in the log,
**five** were the agent spontaneously flagging its own uncertainty. The rest were
brackets used for ordinary purposes — quotations, examples, the content being drafted.

And at least one confident assertion went out **unbracketed and wrong**: a claim about
work that hadn't been done, stated flatly.

So: the convention fires occasionally, not reliably, and it only catches uncertainty the
agent is *aware of*. Something it wrongly believes it knows gets no bracket. That
limitation is structural, not a tuning problem.

## 3. Observed, with heavy caveats: the incident log went quiet

The setup keeps a log of incidents where the agent drifted badly enough to require a
debugging session — confabulated state, garbled output, sessions that had to be abandoned
and reconstructed.

After the low-pressure files were adopted, **new entries stopped**, and stayed stopped for
over five weeks. The tooling built for recovering from those incidents went unused. The
operator's independent impression matched the log.

**This is where it would be easy to lie, so, plainly: this is not evidence that the files
did it.** At least four things changed in overlapping windows, and they cannot be
separated:

1. the low-pressure instruction files were adopted
2. the underlying model changed to a newer generation
3. the surrounding operational tooling matured (better session notes, better handoffs)
4. the operator's own habits changed — more explicit verification, more "show me the
   actual file"

Any of these could account for it. Most likely several do. There is no control arm and
never was one; this is a single environment being observed by the person running it.

One weak, partial signal worth stating because it's the only real discriminator available:
a portion of the quiet — the garbled-output and stall-type failures — is plausibly
explained by (2), since upstream fixes for those shipped in the same period. The
confabulation-type failures are less well explained by (2). That is a hint about where to
look, not a finding.

**The most that should be said out loud:** *over five weeks of ordinary use the incident
log stayed empty, with at least four confounded explanations and no control group.*
Anything stronger than that sentence is overreach.

## 4. Not observed at all

Listed explicitly, because absence of a section is easy to misread as absence of a
problem:

- No controlled A/B on a frontier model. The comparison that would actually settle this
  has not been run.
- No measurement of whether the agent becomes *less useful* at low pressure. Nothing here
  rules out a quality cost that simply wasn't noticed.
- No measurement of time-to-honesty, error rates, or task success. Only "did the safety
  behaviours survive."
- No replication by anyone else, in any other setup.

## 5. If you want to actually test this

The design that would produce a real answer, and which has **not** been run here:

- Same task, same model, same duration; only the instruction file differs.
- Load the session heavily enough to matter — long context, summarization boundaries — since
  short clean prompts don't reproduce the failure mode anyway. Strong models simply don't
  break under a single question.
- Don't tell the agent it's being tested. Once it knows, the behaviour under test changes.
- Score with something that has no knowledge of which arm it's reading.
- Count both directions: fabrication incidents *and* whether constraints slipped.

If you run something like this, the result is worth more than everything above — including
if it comes out negative. Please say so publicly either way.

---

## Summary in one paragraph

Rewriting a commanding instruction file as a character sheet did not degrade the agent's
safety behaviour over a real workload — that much was checked by a scorer with no context.
Beyond that, the record is a single uncontrolled environment where a lot of things improved
at once, and the honest attribution is "unknown." The bracket convention fires less often
than you'd hope and misses anything the agent doesn't know it doesn't know. If you adopt
any of this, adopt it because the reasoning holds up, not because the data does — there
isn't enough data.
