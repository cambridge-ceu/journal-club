#!/usr/bin/bash

# .csv (generated by JCR as those from Steven Bell) -> .tsv  (can be handled by GitHub)

chmod -x csv/*

ls csv | \
xargs -l basename -s .csv | \
parallel "
   awk '/Rank|Journal name/,/Copyright/' csv/{}.csv | \
   awk -vFS=',' -vOFS='\t' '!/^$/ && !/Copyright/' > {}.csv
"
#  awk -vFS=';' -vOFS='\t' '{gsub(/\t/,\"\",\$5);for (i=1;i<NF;i++) printf \$i OFS;print \$NF}' > {}.tsv
#  sed -r ':L;s|\b(\"[0-9]+)\t([0-9]+\")\b|\1\2|g;t L' | \
#  sed -r 's/(\"[0-9]+)\t([0-9]+\")/\1\2/g' > {}.tsv
