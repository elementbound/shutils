#!/bin/bash

# Convert input into ｆｕｌｌｗｉｄｔｈ text for some of those sweet-sweet ｒｏｂｕｓｔ memes.
# Currently, it only supports a simple set of english characters

# Usage:
# 	cat ./navy-seal-copypasta.txt | fullwidth
#	echo xXx_gAngstA_420_xXx | fullwidth

function fullwidth {
	abc=""
	abc="${abc}!\"#$%&'()*+,-./ "
	abc="${abc}0123456789"
	abc="${abc}:;<=>?@"
	abc="${abc}ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	abc="${abc}[\\]^_\`"
	abc="${abc}abcdefghijklmnopqrstuvwxyz"
	abc="${abc}{|}~"

	fbc=""
	fbc="${fbc}！＂＃＄％＆＇（）＊＋，－．／　"
	fbc="${fbc}０１２３４５６７８９"
	fbc="${fbc}：；＜＝＞？＠"
	fbc="${fbc}ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
	fbc="${fbc}［＼］＾＿｀"
	fbc="${fbc}ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ"
	fbc="${fbc}｛｜｝～"

	while read str; do
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
	done
}
