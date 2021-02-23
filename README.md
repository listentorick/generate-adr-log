# generate-adr-log
Generates an HTML page from your Architecture Decision Records as [described by Michael Nygard](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions). 
Assumes that the records were created with adr-tools

## To Use

generate-adr-log -f "/c/myrepo" -o "/c/myoutput"

## Requirements

- Have adr-tools installed
- Have python installed
- Install Pandoc: `apt install pandoc`
- Install panflute: `pip install panflute`


