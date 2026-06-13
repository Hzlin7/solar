file(READ "${QMLDIR}" content)
# Replace module name with singleton declaration (use \n anchor since ^ only matches start of string)
string(REPLACE "\nSolarTheme " "\nsingleton Theme " content "${content}")
string(REPLACE "\nSolarIcons " "\nsingleton Icons " content "${content}")
# Remove prefer line
string(REGEX REPLACE "\nprefer [^\n]*" "" content "${content}")
file(WRITE "${QMLDIR}" "${content}")
