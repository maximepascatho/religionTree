export GIT_AUTHOR_NAME="Dieu"
export GIT_AUTHOR_EMAIL="dieu@creation.universe"
export GIT_COMMITTER_NAME="Dieu"
export GIT_COMMITTER_EMAIL="dieu@creation.universe"

histdate() {
  local y="$1"
  local offset=$((y + 10000))
  date -u -d "1970-01-01 00:00:00 UTC + ${offset} minutes" \
    "+%Y-%m-%d %H:%M:%S +0000"
}

set_date() {
    d="$(histdate $1)"
    export GIT_AUTHOR_DATE="$d"
    export GIT_COMMITTER_DATE="$d"
}

racine() {
  git checkout --orphan "$1"
  cp ../create.sh .
  git add create.sh
  if [ -e ../graph.svg ]; then
     cp ../graph.svg .
     git add graph.svg
  fi
  if [ -e ../README.md ]; then
     cp ../README.md .
     git add README.md
  fi
  git commit --allow-empty -m "Racine $1"
}


rm -rf tree
git init tree
cd tree

racine "polythéisme_égyptien"
set_date -5000
git commit --allow-empty -m $'[-5000] Un dieu par région\nhttps://academic.oup.com/edited-volume/62249/chapter/551373292?searchresult=1'
set_date -3100
git commit --allow-empty -m $'[-3100] Unification politique polythéiste\nhttps://www.britannica.com/topic/ancient-Egyptian-religion'
set_date -2700
git commit --allow-empty -m $'[-2700-2200] Cosmogonie écrite\nhttps://www.britannica.com/topic/Pyramid-Texts'
set_date -2500
git commit --allow-empty -m "[-2500-1800] Cycle d'Osiris
https://www.britannica.com/topic/Pyramid-Texts"

set_date -1500
git commit --allow-empty -m "[-1500-1000] Nouvel empire
https://www.britannica.com/place/ancient-Egypt"

set_date -1350
git commit --allow-empty -m "[-1350] Monothéisme d'Akhenaton
https://www.britannica.com/biography/Akhenaten"
set_date -1300
git commit --allow-empty -m "[-1300] Retour au polythéïsme
https://kids.britannica.com/students/article/Akhenaten/275034"
git branch "Egypte_tomerge"
set_date -300
git commit --allow-empty -m "[-300] Absorbtion des dieux grecs
https://academic.oup.com/edited-volume/62249/chapter/551373292?searchresult=1"

racine "Zoroastrisme"
set_date -4500
git commit --allow-empty -m "[-4500-2500] @Proto-Indo-Européen"
set_date -2000
git commit --allow-empty -m "[-2000] Indo-Iranien"
set_date -1500
git commit --allow-empty -m "[-1500] Védique"
git branch "Vedique"
git reset HEAD^ --hard
set_date -1500
git commit --allow-empty -m "[-1500] proto Iranien"
set_date -1000
git commit --allow-empty -m "[-1000] Zarathoustra"
set_date -900
git commit --allow-empty -m "[-900] Zoroastrisme
https://www.iranicaonline.org/articles/zoroastrianism-i-historical-review/"

racine "Babylone"
set_date -10000
git commit --allow-empty -m "[-10000]Préhistoire mésopotamienne"
set_date -3500
git commit --allow-empty -m "[-3500-2000] Sumériens
https://www.britannica.com/place/Babylon-ancient-city-Mesopotamia-Asia"
git branch "Sumériens"
git reset HEAD^
set_date -2350
git commit --allow-empty -m "[-2350-2000] Akkadiens"
git merge --allow-unrelated-histories -s ours "Sumériens" -m "[-1900,-1600] Babyloniens"

set_date -1750
git commit --allow-empty -m "-1750  Hammurabi
https://www.britannica.com/biography/Hammurabi"
set_date -1595
git commit --allow-empty -m "-1595  Sac de Babylone par les Hittites
https://www.britannica.com/place/Babylon-ancient-city-Mesopotamia-Asia"
git merge --allow-unrelated-histories -s ours "Zoroastrisme" -m "[-539] Cyrus le Grand prend Babylone
https://www.britannica.com/biography/Cyrus-the-Great"

git branch "Babylone_tomerge"
set_date -331
git commit --allow-empty -m "[-331] grec
https://www.britannica.com/biography/Alexander-the-Great"


racine "Judaïsme"
set_date -3000
git commit --allow-empty -m "[-3000] Religions sémitiques anciennes
https://www.cambridge.org/core/series/cambridge-ancient-history/F9F4A87A4E72B0C1B0A2B7F5F8A4A2F6"
set_date -2000
git commit --allow-empty -m "[-2000] Religions cananéennes
https://www.oxfordreference.com/display/10.1093/oi/authority.20110803095507917"
set_date -1400
git commit --allow-empty -m "[-1400] Chassou de Yhw
https://www.cambridge.org/core/books/yahweh-before-israel/yhw-of-shasuland/119116DC7806AE299828B5D58EA06539"
set_date -1200
git commit --allow-empty -m "[-1200] Yahwisme primitif
https://www.cambridge.org/core/books/yahweh-before-israel/yhw-of-shasuland/119116DC7806AE299828B5D58EA06539"

set_date -900
git merge --allow-unrelated-histories -s ours "Egypte_tomerge" -m "[-900–586] Judaïsme monarchique
https://www.britannica.com/place/ancient-Israel/Historical-development

"
git branch -D "Egypte_tomerge"

set_date -622
git commit --allow-empty -m "[-622] Réformes de Josias
Proto deutéronome
https://library.biblicalarchaeology.org/article/deuteronomys-theological-revolution/
https://www.britannica.com/biography/Josiah"

set_date -586
git commit --allow-empty -m "[-586] exil à Babylone
https://www.britannica.com/event/Siege-of-Jerusalem-587-586-BCE"


set_date -539
git merge --allow-unrelated-histories -s ours "Babylone_tomerge" -m "[-539–70] Judaïsme du second temple"
git branch -D "Babylone_tomerge"
git commit --allow-empty -m "genese"
set_date -450
git commit --allow-empty -m "[~450] Torah proche de sa forme finale
https://plato.stanford.edu/entries/hebrew-bible/"
git commit --allow-empty -m "Judaïsme du Second Temple
https://www.britannica.com/topic/Second-Temple-Judaism"


set_date -332
git commit --allow-empty -m "[-332] Conquête grecque
https://www.britannica.com/event/Hellenistic-Age"

set_date -250
git commit --allow-empty -m $'mouvements apocalyptiques\nLivre de Daniel, 1 Hénoch
https://www.britannica.com/art/apocalyptic-literature'
git branch "Apocalypse"
git reset HEAD^ --hard


set_date -167
git commit --allow-empty -m "[-167] Révolte des Maccabées
https://www.britannica.com/topic/Hasmonean-dynasty"

set_date -63
git commit --allow-empty -m "[-63] Domination romaine
https://www.britannica.com/place/Palestine/Roman-Palestine"
git branch "Rome"
git reset HEAD^ --hard
set_date -150
git commit --allow-empty -m "[-150] Pharisiens
https://www.britannica.com/place/Palestine/Roman-Palestine"
git branch "Pharisiens"
git checkout -b "christianisme"
git reset HEAD^ --hard
git commit --allow-empty -m "[-150] Sadducéens
https://www.britannica.com/topic/Sadducee"
git branch "Sadducéens"
git reset HEAD^ --hard
git commit --allow-empty -m "[-150] Esséniens
https://www.britannica.com/topic/Sadducee"
git branch "Esséniens"
git reset HEAD^ --hard
set_date -0
git commit --allow-empty -m "0 Zélotes
https://www.britannica.com/topic/Zealot-Jewish-sect"
git branch "Zélotes"
git reset HEAD^ --hard
set_date -100
git commit --allow-empty -m "[-100] groupes baptistes
https://www.britannica.com/topic/mikveh"

set_date 30
git merge --allow-unrelated-histories -s ours \
  "Rome" "Pharisiens" "Sadducéens" "Esséniens" "Zélotes" "Apocalypse" \
  -m "[30] Mouvement chrétien"

git checkout "Judaïsme"

set_date 70
git commit --allow-empty -m "[70] destruction du temple"
git commit --allow-empty -m "[70]Yavné"
set_date 100
git commit --allow-empty -m "[100]Judaisme rabbinique"
set_date 200
git commit --allow-empty -m "[200]Mishnah"
set_date 500
git commit --allow-empty -m "[500]Talmud de Babylone"

git checkout "christianisme"

set_date 30
git commit --allow-empty -m $'[30-100]Judéo-chrétiens\nRespect de la Torah\nJésus considéré comme Messie juif'
set_date 100
git commit --allow-empty -m "[100-700] Nazaréens"
git branch "Nazaréens"
git reset HEAD^ --hard
set_date 100
git commit --allow-empty -m $'[100-500] Ébionites\nrejet de Paul'
git branch "Ébionites"
git reset HEAD^ --hard


set_date 80
git commit --allow-empty -m "[80]Gnostiques"

set_date 140
git commit --allow-empty -m "[140]Valentiniens"
git branch "Valentiniens"
git reset HEAD^ --hard

set_date 120
git commit --allow-empty -m "[120]Basilidiens"
git branch "Basilidiens"
git reset HEAD^ --hard

set_date 100
git commit --allow-empty -m "[100]Séthiens"
git branch "Séthiens"
git reset HEAD^ --hard

set_date 120
git commit --allow-empty -m "[120]Ophites"
git branch "Ophites"
git reset HEAD^ --hard

set_date 140
git commit --allow-empty -m "[140]Marcionites"
git branch "Marcionites"
git reset HEAD^ --hard
git reset HEAD^ --hard


set_date 40
git commit --allow-empty -m $'[40-60]Pauliniens\nMissions de Paul de Tarse.\nOuverture aux non-Juifs.\nAbandon progressif des obligations de la Torah.'
git commit --allow-empty -m "Grande Église"
git checkout -b "catholicisme"

set_date 325
git commit --allow-empty -m "[325] Nicée I"
git commit --allow-empty -m "[325] Consubstantialité du Fils"
git commit --allow-empty -m "[325] Excommunication d'Arius"

set_date 381
git commit --allow-empty -m "[381] Constantinople I"
git commit --allow-empty -m "[381] Divinité du Saint-Esprit"

set_date 382
git commit --allow-empty -m "[382] Canon de Rome"
set_date 393
git commit --allow-empty -m "[393] Synode d'Hippone"
set_date 397
git commit --allow-empty -m "[397] Concile de Carthage"

set_date 431
git commit --allow-empty -m "[431] Éphèse"
git commit --allow-empty -m "[431] Marie mère de Dieu"
git commit --allow-empty -m "[431] Condamnation de Nestorius"
set_date 451
git commit --allow-empty -m "[451] Chalcédoine"
git commit --allow-empty -m "[451] Deux natures du Christ"
set_date 553
git commit --allow-empty -m "[553] Constantinople II"

#### parenthèse islam

racine "Arabie_préislamique"
set_date -1000
git commit --allow-empty -m "[-1000] Arabie préislamique"

set_date -800
git commit --allow-empty -m "[-800] polythéismes arabes"
git branch PolytheismeArabe
git reset HEAD^

set_date 500
git commit --allow-empty -m "[500] hanîfs / monothéismes arabes"

set_date 610
git merge --allow-unrelated-histories -s ours PolytheismeArabe christianisme Judaïsme -m "[610] islam"

set_date 632
git commit --allow-empty -m "[632] Rashidun"

set_date 656
git commit --allow-empty -m "[656] Première Fitna"


set_date 657
git commit --allow-empty -m "[657] Kharijisme"
set_date 700
git commit --allow-empty -m "[700] Ibadisme"
git branch Ibadisme
git reset HEAD^^ --hard

set_date 680
git commit --allow-empty -m "[680] Chiisme"

set_date 740
git commit --allow-empty -m "[740] Zaydisme"
git branch Zaydisme
git reset HEAD^ --hard
set_date 765
git commit --allow-empty -m "[765] Ismaélisme"
git branch Ismaélisme
git reset HEAD^ --hard
set_date 874
git commit --allow-empty -m "[874] Duodécimains"
git branch Duodécimains
git reset HEAD^^ --hard

set_date 700
git commit --allow-empty -m "[700] Sunnisme"

set_date 760
git commit --allow-empty -m "[760] Malikisme"
git branch Malikisme
git reset HEAD^ --hard

set_date 750
git commit --allow-empty -m "[750] Hanafisme"
git branch Hanafisme
git reset HEAD^ --hard

set_date 820
git commit --allow-empty -m "[820] Shafiisme"
git branch Shafiisme
git reset HEAD^ --hard

set_date 850
git commit --allow-empty -m "[850] Hanbalisme"
git branch Hanbalisme
git reset HEAD^ --hard

set_date 750
git commit --allow-empty -m "[750] Mu'tazilisme"
git branch Mutazilisme
git reset HEAD^ --hard


set_date 900
git commit --allow-empty -m "[900] Ash'arisme"
git branch Asharisme
git reset HEAD^ --hard

set_date 900
git commit --allow-empty -m "[900] Maturidisme"
git branch Maturidisme
git reset HEAD^ --hard

set_date 850
git commit --allow-empty -m "[850] Atharisme"
git branch Atharisme
git reset HEAD^ --hard

set_date 1166
git commit --allow-empty -m "[1166] Qadiriyya"
git branch Qadiriyya
git reset HEAD^ --hard

set_date 1200
git commit --allow-empty -m "[1200] Rifaiyya"
git branch Rifaiyya
git reset HEAD^ --hard

set_date 1380
git commit --allow-empty -m "[1380] Naqshbandiyya"
git branch Naqshbandiyya
git reset HEAD^ --hard

set_date 1744
git commit --allow-empty -m "[1744] Wahhabisme"
git branch Wahhabisme
git reset HEAD^ --hard

set_date 1800
git commit --allow-empty -m "[1800] Salafisme moderne"
git branch SalafismeModerne
git reset HEAD^ --hard

set_date 1844
git commit --allow-empty -m "[1844] Babisme"
git branch Babisme
git reset HEAD^ --hard

set_date 1863
git commit --allow-empty -m "[1863] Bahaïsme"
git branch Bahaïsme
git reset HEAD^ --hard

set_date 1889
git commit --allow-empty -m "[1889] Ahmadiyya"
git branch Ahmadiyya
git reset HEAD^ --hard


#### fin parenthèse islam

git checkout catholicisme


set_date 150
git commit --allow-empty -m "[150] Protoévangile de Jacques"
set_date 590
git commit --allow-empty -m "[590] Purgatoire (développement médiéval)"
set_date 650
git commit --allow-empty -m "[650] Fête orientale de la Conception de Marie"
set_date 680
git commit --allow-empty -m "[680] Constantinople III"
set_date 787
git commit --allow-empty -m "[787] Nicée II"
git commit --allow-empty -m "[787] Vénération des icônes"

set_date 1030
git commit --allow-empty -m "[1030] Fête anglaise de la Conception"


set_date 1054
git commit --allow-empty -m "[1054] Orthodoxie"
git branch "Orthodoxie"
git reset HEAD^ --hard

set_date 1095
git commit --allow-empty -m "[1095] Première croisade"
set_date 1215
git commit --allow-empty -m "[1215] Transsubstantiation"
set_date 1231
git commit --allow-empty -m "[1231] Inquisition"
set_date 1300
git commit --allow-empty -m "[1300] Jubilé et indulgences"


set_date 1120
git commit --allow-empty -m "[1120] Eadmer défend l'Immaculée Conception"

set_date 1517
git commit --allow-empty -m "[1517] Luthériens"
git branch "Luthériens"
git reset HEAD^ --hard

set_date 1536
git commit --allow-empty -m "[1536] Réformés (Calvinistes)"
git branch "Réformés"
git reset HEAD^ --hard

set_date 1534
git commit --allow-empty -m "[1534] Anglicans"
git branch "Anglicans"

set_date 1738
git commit --allow-empty -m "[1738] Méthodistes"
git branch "Méthodistes"

set_date 1844
git commit --allow-empty -m "[1844] Adventistes"
git branch "Adventistes"

set_date 1870
git commit --allow-empty -m "[1870] Jéhovah"
git branch "Jéhovah"
git reset HEAD^ --hard
git reset HEAD^ --hard

set_date 1830
git commit --allow-empty -m "[1830] Mormons"
git branch "Mormons"
git reset HEAD^ --hard
git reset HEAD^ --hard
git reset HEAD^ --hard

set_date 1640
git commit --allow-empty -m "[1640] Baptistes"
git branch "Baptistes"
git reset HEAD^ --hard

set_date 1906
git commit --allow-empty -m "[1906] Pentecôtistes"
git branch "Pentecôtistes"
git reset HEAD^ --hard
git reset HEAD^ --hard


set_date 1545
git commit --allow-empty -m "[1545] Concile de Trente"
set_date 1546
git commit --allow-empty -m "[1546] Canon de Trente"
set_date 1600
git commit --allow-empty -m "[1600] Exécution de Giordano Bruno"
set_date 1633
git commit --allow-empty -m "[1633] Procès Galilée"

set_date 1870
git commit --allow-empty -m "[1870] Infaillibilité pontificale"

set_date 1854
git commit --allow-empty -m "[1854] Dogme de l'Immaculée Conception"

set_date 1903
git commit --allow-empty -m "[1903] Pie X"



set_date 1950
git commit --allow-empty -m "[1950] Assomption"

git commit --allow-empty -m "[1970] fraternité saint pieX"
git branch "fratStPieX"
git reset HEAD^ --hard

set_date 1962
git commit --allow-empty -m "[1962] Vatican 2"

set_date 1970
git commit --allow-empty -m "[1970] Sédévacantisme"
git branch "Sédévacantisme"
git reset HEAD^ --hard

set_date 1983
git commit --allow-empty -m "[1983] Nouveau code canonique"

set_date 1988
git commit --allow-empty -m "[1988] Excommunication de Mgr Lefebvre"
set_date 1922
git commit --allow-empty -m "[1992] Réhabilitation de Galilée"
set_date 1992
git commit --allow-empty -m "[1992] Réforme du catéchisme"

sanitize_id() {
  printf '%s' "$1" | tr -d '\r\n'
}

(echo '  flowchart TB;'
git rev-list --all |
while IFS= read -r h
do
  h="$(sanitize_id "$h")"
  label="$(git log -1 --format=%B "$h" | head -n 1)"
  label="${label//\\/\\\\}"
  label="${label//\"/\\\"}"
  label="${label//$'\n'/\\n}"
  printf '  node_%s["%s"];\n' "$h" "$label"
done
git rev-list --all --parents |
while read commit parents
do
  for p in $parents
  do
    echo "  node_$p --> node_$commit;"
  done
done
) > graph.mmd

(echo 'digraph G {'
echo '  rankdir=TB;'
echo '  node [shape=box, fontname="DejaVu Sans"];'
echo '  edge [fontname="DejaVu Sans"];'
git rev-list --all |
while IFS= read -r h
do
  h="$(sanitize_id "$h")"

  label="$(git log -1 --format=%B "$h" | head -n 1)"
  label="${label//\\/\\\\}"
  label="${label//\"/\\\"}"
  label="${label//$'\n'/\\n}"

  printf '  node_%s [label="%s"];\n' "$h" "$label"
done
git rev-list --all --parents |
while read commit parents
do
  for p in $parents
  do
    echo "  node_$p -> node_$commit;"
  done
done
echo '}') > graph.dot

dot -Tsvg graph.dot > ../graph.svg
mmdc -i graph.mmd -o ../graph2.svg

(cat <<'EOF'
Github qui représente les origines, modifications et merges religieux dans l'histoire

![Religions](graph.svg)

tout est généré par create.sh
EOF
) > ../README.md
