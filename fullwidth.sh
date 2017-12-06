#!/bin/bash

# Convert arguments into ｆｕｌｌｗｉｄｔｈ text for some of those sweet-sweet ｒｏｂｕｓｔ memes.
# Currently, it only supports a simple set of english characters

# Usage:
# 	fullwidth text...

function fullwidth {
	str="$@"

	abc="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	abc="${abc}abcdefghijklmnopqrstuvwxyz"

	fbc="ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
	fbc="${fbc}ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ"

	for (( i=0; i<${#str}; i++ )); do
		str_c="${str:$i:1}"
		fbc_c="$str_c"
		for (( j=0; j<${#abc}; ++j )); do
			abc_c="${abc:$j:1}"
			if [ "$str_c" = "$abc_c" ] 
			then
				fbc_c="${fbc:$j:1}"
			fi
		done

		printf "$fbc_c"
	done

	printf "\n"
}
