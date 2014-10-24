_ = require 'underscore-plus'
latexToUnicode = require 'latex-to-unicode'

module.exports =
class Latex
  convertAll: ->
    console.log 'Convert all'
  convert: ->
    newSelectedBufferRanges = []
    @editor = atom.workspace.getActiveEditor()
    selections = @editor.getSelections()
    selections.forEach (selection, i) =>
      startPosition = selection.getBufferRange().start
      buffer = @editor.getBuffer()
      text = selection.getText()
      replacement = latexToUnicode(text)
      selection.deleteSelectedText()
      @editor.insertText(replacement)
