{WorkspaceView} = require 'atom'
LatexToUnicode = require '../lib/latex-to-unicode'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LatexToUnicode", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('latex-to-unicode')

  describe "when the latex-to-unicode:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.latex-to-unicode')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'latex-to-unicode:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.latex-to-unicode')).toExist()
        atom.workspaceView.trigger 'latex-to-unicode:toggle'
        expect(atom.workspaceView.find('.latex-to-unicode')).not.toExist()
