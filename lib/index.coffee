Latex = null
latex = null

module.exports =
  activate: ->
    atom.workspaceView.command 'latex-to-unicode:convert', ->
      loadModule()
      latex.convert()

    atom.workspaceView.command 'latex-to-unicode:convertAll', ->
      loadModule()
      latex.convertAll()

# Internal: Loads the module on-demand.
loadModule = ->
  Latex ?= require './latex-to-unicode'
  latex ?= new Latex()
