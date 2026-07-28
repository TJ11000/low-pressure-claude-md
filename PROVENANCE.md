# Timestamping a document without publishing it

*Unofficial, third-party. Practical notes, not legal advice.*

A small problem that comes up when you've written something you might publish later: you
want to be able to show *when* you wrote it, without publishing it now. Publishing is how
most people establish priority, but publishing is also the irreversible part — once it's
out, the decision about what to include has been made for you.

These two things can be separated. This is how it was done here.

## The thing that doesn't work as well as people think

`git commit` dates are trivially forgeable. `GIT_AUTHOR_DATE` and `GIT_COMMITTER_DATE` are
environment variables; you can set them to anything. A local commit history proves
essentially nothing about when the work existed, and anyone evaluating a priority claim
will know that.

Pushing to a hosted service is better, since the host observed the push. But it means
publishing, which is the thing you were trying to defer — and a private repo's timestamps
are attested only by the host, at the host's discretion.

## Two separate questions, two separate tools

Priority claims break into two questions that people tend to run together:

| question | what answers it |
|---|---|
| *when* did this content exist? | a trusted timestamp |
| *who* wrote it? | a signature |

**When — [OpenTimestamps](https://opentimestamps.org/).** It hashes your file and commits
that hash into the Bitcoin blockchain. What you get back is a small `.ots` proof file
sitting next to your document. Anyone can later verify that this exact byte sequence
existed before a specific block. No account, no fee, no publication of the content — only
the hash goes out, and a hash reveals nothing about what it hashed.

Note that a fresh stamp is *pending* at first — it takes a while to be committed into a
block. Upgrade and verify it later; don't assume it's final the moment you create it.

**Who — GPG.** A detached signature over the same file. Generate a key, sign, keep the
signature and the public key with the document. This proves authorship by whoever holds
the key, which is a different claim from "this existed then" and is worth having
separately.

You do not have to put a legal name on the key. A stable pseudonymous identity works for
priority purposes — the point is linking the document to a key you control, not to a
passport.

## The one operational rule that matters

**Both proofs are over exact bytes. Change one character and both are void.**

So the moment you stamp, that file is frozen. If you keep editing, you're editing a file
your proofs no longer cover, and it's easy not to notice.

The practical arrangement:

- Stamp a **snapshot** with the date in its filename, not your working copy.
- Keep the snapshot, the `.ots`, and the `.asc` together as one immutable set. Back them
  up somewhere separate.
- Keep editing the working copy freely. When you want a new checkpoint, snapshot and stamp
  again. Old proofs stay valid for the old snapshot.
- Record the hash somewhere human-readable too, so a later reader can tell which file the
  proofs refer to without guessing.

That last point matters more than it sounds. A stamped file with an ambiguous relationship
to the published version is a weak claim; a stamped snapshot you can point to and say
"this exact file, this hash, these proofs" is a strong one.

## What this does and doesn't get you

- ✅ Evidence that specific content existed before a specific date, verifiable by anyone,
  without publishing the content.
- ✅ Evidence of who holds the key that signed it.
- ❌ **Not** ownership of the idea. Ideas aren't protected by any of this. What's
  protected is the *expression* — the actual text — under ordinary copyright, plus a
  demonstrable date.
- ❌ Not enforcement. Having proof and being able to act on it are different problems, and
  for most small-scale copying the honest answer is that you won't pursue it.

The realistic value is narrow but real: if the same ideas surface later from somewhere
larger, you can show your work predated it. That's it. It's cheap, it takes a few minutes,
and it removes the pressure to publish early just to plant a flag — which is the actual
benefit, because it lets you take the time to decide what should be published at all.
