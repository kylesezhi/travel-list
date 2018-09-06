# travel-list
## Initial setup
- `stack new travel-list`
- `cd travel-list`
- `stack setup`

## Build and run
- `stack build --file-watch`
- `stack exec travel-list-exe`
- `pandoc -s lists/output.md -o lists/output.html --lua-filter=task-list.lua`

## To do
- Delete previous file on start
- Figure out import to Evernote