
while getopts f:o: flag
do
    case "${flag}" in
        f) adrsLocation=${OPTARG};;
        o) outputLocation=${OPTARG};;
    esac
done

mkdir -p $outputLocation

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
adrsLocationPath="${adrsLocation}/doc/architecture/decisions"
find $adrsLocationPath -iname '*.md' -exec cp \{\} $outputLocation \;
cd $adrsLocation

adr generate toc > "${outputLocation}/index.md"
cd $outputLocation
for f in *.md; do pandoc --css "${DIR}/adr.css" --wrap=preserve "$f"  -f markdown+hard_line_breaks  -t html  --filter "${DIR}/link_filter.py" -s -o "${f%.md}.html"; done
 
rm $outputLocation/*.md 