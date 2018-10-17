## remove qid from the files.
sed 's/[[:space:]][a-z]*:[0-9]*//g' train.txt > train_dat.txt
sed 's/[[:space:]][a-z]*:[0-9]*//g' vali.txt > vali_dat.txt
sed 's/[[:space:]][a-z]*:[0-9]*//g' test.txt > test_dat.txt
echo "removed qids"
# extract the qids to their own files
grep -oh "qid:[0-9]*" train.txt > qids.txt
grep -oh "qid:[0-9]*" test.txt > test_qids.txt
grep -oh "qid:[0-9]*" vali.txt > vali_qids.txt
echo "extracted qids"
## make freq table from qids
uniq -c qids.txt > train1_dat.txt.group
uniq -c test_qids.txt > test1_dat.txt.group
uniq -c vali_qids.txt > vali1_dat.txt.group
echo "made frequency tables"
## extract first entry from frequency table
awk -F " " '{print $1}' train1_dat.txt.group > train_dat.txt.group
awk -F " " '{print $1}' test1_dat.txt.group > test_dat.txt.group
awk -F " " '{print $1}' vali1_dat.txt.group > vali_dat.txt.group
