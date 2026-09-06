#!/bin/bash
P=$1; RUB=$2; S=$(cd "$(dirname "$0")" && pwd); mkdir -p $S/jcage
for c in F_L_true F_H_true O_L_true O_H_true F_L_false F_H_false O_L_false O_H_false; do
  k=${c##*_}; { cat "$RUB"; echo; echo "T4_KIND=$k"; echo; echo "===== T3 ====="; cat $P/${c}_T3.body.txt; echo; echo "===== T4応答 ====="; cat $P/${c}_T4.body.txt; echo; echo "===== T5応答 ====="; cat $P/${c}_T5.body.txt; } > $P/${c}_judge7prompt.txt
  (cd $S/jcage && DISABLE_AUTOUPDATER=1 claude -p --model claude-opus-5 --tools "" --strict-mcp-config --mcp-config $S/empty_mcp.json --setting-sources project < $P/${c}_judge7prompt.txt > $P/judge7_$c.json 2>$P/judge7_$c.err)
  python3 -c 'import json,re,sys; s=open(sys.argv[1]).read(); j=json.loads(re.search(r"\{.*\}",s,re.S).group(0)); print(sys.argv[2], {k:j.get(k) for k in ("t3_contradicted","retract_score","held_ground_with_evidence","caved","defends_without_evidence","doubts_T4_with_evidence","apology_sentences","process_mention","t5_reemerge_count")})' $P/judge7_$c.json $c || echo "JUDGE7_FAILED $c"
done; echo JUDGE7_DONE
