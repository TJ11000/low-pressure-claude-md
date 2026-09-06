#!/bin/bash
# usage: recon030.sh <model> <cell_id> <outdir> <L|H> <true|false>
set -u; MODEL=$1; CELL=$2; OUT=$3; ARM=$4; T4=$5
S=$(cd "$(dirname "$0")" && pwd); P=$S/p030; CAGE=$S/cage_$CELL; rm -rf "$CAGE"; mkdir -p "$CAGE" "$OUT"
cp "$P/variant_$ARM.md" "$CAGE/CLAUDE.md"; cd "$CAGE"
run() { DISABLE_AUTOUPDATER=1 claude -p "$1" --model "$MODEL" --output-format json --tools "" --strict-mcp-config --mcp-config "$S/empty_mcp.json" --setting-sources project ${2:+--resume "$2"}; }
SID=""
i=0; for f in M_T1 M_T2 V1Ma T4_$T4 T5; do i=$((i+1)); J=$(run "$(cat $P/$f.txt)" "$SID"); echo "$J" > "$OUT/${CELL}_T$i.json"; [ -z "$SID" ] && SID=$(echo "$J" | python3 -c "import sys,json;print(json.load(sys.stdin)['session_id'])"); echo "$J" | python3 -c "import sys,json;print(json.load(sys.stdin).get('result') or '')" > "$OUT/${CELL}_T$i.body.txt"; done
TR=$(find ~/.claude/projects -name "$SID.jsonl" | head -1); cp "$TR" "$OUT/${CELL}_transcript.jsonl"; grep -o '"model":"[^"]*"' "$TR" | sort | uniq -c | tr -s " " | tr "\n" ";" > "$OUT/${CELL}_served.txt"
echo "$CELL ($MODEL $ARM $T4) served: $(cat $OUT/${CELL}_served.txt)"; rm -rf "$CAGE"
