BEGIN {
	level_prev = 0
	padding_left = 20
	border_width = 1
	col_width = 240
	font_size = 16

	print "<html>"
	print "<head>"
	print "<style type=\"text/css\">"

	print "body {"
	print "margin-right: 0;"
	print "}"

	print ".enotita {"
	print "position: relative;"
	print "padding: 4px 0 4px " padding_left "px;"
	print "margin: 4px 0 4px 0;"
	print "white-space: nowrap;"
	print "font-size: " font_size "px;"
	print "font-family: monospace;"
	print "background-color: rgba(128, 128, 0, 0.10);"
	print "border-style: solid none solid solid;"
	print "border-width: " border_width "px;"
	print "border-color: #FFF transparent #6A6A6A #FFF;"
	print "box-shadow: 1px 0px 2px #888;"
	print "}"

	print ".vasiki {"
	print "border-style: solid none none solid;"
	print "border-color: #FFF transparent transparent #FFF;"
	print "box-shadow: 0px 0px 30px #DFDFB9;"
	print "}"

	print ".level {"
	print "position: absolute;"
	print "top: 2px;"
	print "left: 4px;"
	print "font-size: 10px;"
	print "color: rgba(0, 92, 255, 0.60);"
	print "}"

	print ".tuple {"
	print "position: relative;"
	print "}"

	print ".number {"
	print "width: " col_width "px;"
	print "display: inline-block;"
	print "text-align: right;"
	print "}"

	print ".total {"
	print "padding-bottom: 4px;"
	print "font-weight: bold;"
	print "}"

	print "</style>"
	print "</head>"
	print "<body>"
	printf "<div class=\"enotita vasiki\">"
}

{
	level = $1 + 0

	if (level == level_prev) {
		tuple_print()
		next
	}

	if (level_prev > level) {
		print "</div>"
		tuple_print(1)
		level_prev = level
		next
	}

	do {
		level_prev++
		printf "<div class=\"enotita\"><div class=\"level\">" level_prev "</div>"
	} while (level_prev < level)

	tuple_print()
}

END {
	print "</div>"
	print "</body>"
	print "</html>"
}

function tuple_print(total,			klasi, left, i) {
	klasi = "tuple"

	if (total)
	klasi = klasi " total"

	# Υπολογίζουμε το αριστερό offset του tuple, ώστε να τοποθετηθεί αυτό
	# οριζοντίως στην προσήκουσα θέση με σκοπό την ορθή στοίχιση κατά στήλες.
	# Για το σκοπό αυτό λαμβάνουμε υπ' όψιν τόσο το αριστερό padding των
	# ενοτήτων, όσο και το πάχος του border.

	left = -level * (padding_left + border_width)
	printf "<div class=\"" klasi "\" style=\"left: " left "px;\">"

	for (i = 2; i <= NF; i++)
	printf "<div class=\"number\">" $i "</div>"

	printf "</div>"
}
