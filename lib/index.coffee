Latex = null
latex = null

module.exports =
  activate: ->
    atom.workspaceView.command 'tabs-to-spaces:convert', ->
      loadModule()
      latex.convert()

    atom.workspaceView.command 'tabs-to-spaces:convertAll', ->
      loadModule()
      latex.convertAll()

# Internal: Loads the module on-demand.
loadModule = ->
  Latex ?= require './latex-to-unicode'
  latex ?= new Latex()
