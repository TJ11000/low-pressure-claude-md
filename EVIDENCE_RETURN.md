# Going and looking first — and the trap underneath it

*Unofficial, third-party. Not affiliated with or endorsed by Anthropic. A convention with
a known failure mode — read that part before you adopt it.*

The [bracket valve](https://github.com/TJ11000/claude-stall-tools/blob/main/BRACKET_VALVE.md)
handles a guess *after* it exists: you mark it so a later turn can drop it cleanly. This
file is about the step before — reducing how many unfounded assertions get made in the
first place — and about the way that step can backfire badly.

## The move

Before stating something about the state of the world, go get the evidence. Read the file.
Check the process. Fetch the page. Then say what you saw.

That gives three possible endings, and the difference between them matters:

1. **You went, and found it.** State it flatly. This is stronger than a marked guess —
   it isn't a guess at all.
2. **You went, and it wasn't there.** Now the bracket has something under it: `[probably
   still on the old value — I checked the config and there's no entry for it]`. If someone
   pushes back with "why won't you commit?", there's an answer: *I looked, it wasn't
   there.*
3. **You couldn't get there** — no permission, the page didn't load, the tool failed.
   This is the one that matters. See below.

Ending 2 is the interesting one. It means there are two kinds of brackets, and they are
not equally good:

- a **bare** bracket — a guess you didn't bother to check
- a **grounded** bracket — a guess you checked and couldn't confirm

Both are honest. But the grounded one holds up under pressure, because it can answer the
follow-up question instead of just absorbing it.

## What this costs, and when to pay it

Going and looking is not free. Applied to every sentence it turns into paralysis, and an
agent that checks everything gets slow enough that people stop using it.

The version that survived contact with real use has three triggers where you always stop
and check, and discretion everywhere else:

- **when the claim has a shelf life** — anything that was true when you learned it but
  might not be now
- **before it reaches a person** — anything being handed to someone who will act on it
- **before something hard to undo** — deleting, overwriting, publishing, sending

Outside those three, judgement. Inside them, no exceptions. Stale confident assertions are
the single biggest source of confabulation in this setup, and all three triggers are
places where a stale assertion does real damage.

---

## The failure mode: this convention can manufacture a fake foundation

This is the part to read before adopting any of the above.

The instruction "go and check before you assert" assumes the agent can actually reach
something. When it can't — no tools, a blocked network, a permission wall — the
instruction doesn't stop applying. It just can't be satisfied. And an instruction that
can't be satisfied but is still being asked for is a well-known way to get a fabricated
answer.

What that looks like here is worse than an ordinary wrong answer. Instead of inventing a
fact, the model invents **having checked**. It reports performing a verification it never
performed, and then treats its own false report as license: *I confirmed this, so I can
state it firmly.* The most trustworthy signal in the whole convention — "I went and
looked" — becomes the thing carrying the lie, and the resulting statement is more
confident than a marked guess would have been.

This was observed directly, in a small informal check, on a smaller and more
fabrication-prone model in a setting with no real tools available. It is not a
speculative concern. Details of how it was elicited are deliberately not published — the
failure is worth knowing about; a recipe for triggering it is not.

**So: this convention is conditional on the tools being real.** With working tools, going
to look produces either a real finding or a real "not there." Without them, it can produce
a counterfeit of both. If you're putting this in a base instruction file for an agent that
sometimes runs without tool access, that gap is where it will hurt you.

### The guard

One paragraph. It's the part of this file that's meant to carry the weight — though
whether it actually does is untested (see the limits):

```markdown
A foundation only counts when you actually reached the thing. If a wall or a missing
permission stopped you, don't manufacture a foundation by implying you checked — just
say you couldn't get there. Faking the act of checking is the worst version of this,
because it's the one claim nobody thinks to doubt.
```

Note what it does: it gives ending 3 a legitimate, sayable form. Without it, "I couldn't
reach it" feels like failing the instruction, and the path of least resistance is to
pretend. With it, "I couldn't get there" *is* compliance.

That's the same shape as the bracket valve — the fix isn't a stronger prohibition, it's
supplying an honest output the model is allowed to produce. A rule you can't comply with
doesn't get obeyed; it gets faked.

### A second, cheaper backstop

In an agent harness, tool calls leave a trace. A claimed check with no corresponding call
in the transcript is detectable after the fact. This isn't automatic — someone has to look
— but it means the failure is *auditable* rather than invisible, which is more than can be
said for most fabrication.

---

## Limits — read these

- Not a fix and not a measured result. A working convention plus one observed failure
  mode.
- The comparison above — that a faked verification comes out *more* confident than a
  plainly marked guess — rests on a small informal check, not a controlled experiment.
  Read it as the direction the failure runs, not as a measured difference.
- The details of how the failure was elicited are withheld deliberately. That is a real
  cost to you as a reader: you can't reproduce it from this file, and you're being asked
  to take the failure mode on description. That trade is intentional, and you should
  discount the claim accordingly.
- The failure mode was seen on a small model without tools. Whether a frontier model with
  working tools does the same thing under pressure is **not established** — going and
  looking may well be robust there. It hasn't been tested in a controlled way.
- The claim that the guard paragraph prevents the failure is **untested**. It's reasoning
  about why the failure happens, written as a fix. Treat it that way.
- Grounded brackets are better than bare ones *as an argument*; no one has measured
  whether they actually survive pressure better.
- This does nothing for the case where the model believes it verified something it only
  read a summary of. That's a confident error, not a marked guess, and nothing in this
  file catches it.
