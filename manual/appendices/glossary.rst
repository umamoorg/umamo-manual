********
Glossary
********

These are the terms that this manual uses, in the sense that Umamo gives them.  Where Cubism or Blender names the same thing differently, the entry says so, and :doc:`/getting_started/coming_from_cubism` has the full map from Cubism.  Each entry points to the page that explains the term at length.

Interface Terms
===============

.. glossary::

	Area
		A rectangle of the window that shows one editor.  Areas are split, joined, and resized with the splitters between them.  Blender uses the same word.  See :doc:`/interface/window_system`.

	Editor
		What an area shows: the 2D Viewport, the UV Editor, the Outliner, the Properties editor, the Parameters editor, the Keyform Sheet, the Sources editor, History, Logs, or the Tool Settings editor, which is reserved.  An area can be switched to any of them.  See :doc:`/editors/index`.

	Workspace
		A named layout of areas, shown as a tab at the top of the window.  Umamo comes with Modelling, Texture, and Physics.  See :doc:`/interface/workspaces`.

	Header
		The strip across the top of an area, with the controls of its editor.  Controls that do not fit move into a pop up at its end.  See :doc:`/editors/index`.

	Toolbar
		The short column of tools that floats at the left edge of the 2D Viewport.  See :doc:`/editors/viewport_2d/index`.

	Sidebar
		The panels that float at the right edge of the 2D Viewport and the UV Editor, in the tabs :guilabel:`Item`, :guilabel:`Tool`, and :guilabel:`View`.  See :doc:`/editors/viewport_2d/sidebar`.

	HUD
		The small readouts drawn over a viewport: the name of the active object, the zoom, and a badge while a transform is in progress.  See :doc:`/editors/viewport_2d/index`.

	Operation Strip
		The small panel that opens at the corner of a viewport after an operation, with the numbers of that operation.  Changing one runs the operation again from where it started.  :kbd:`F9` brings it back.  Blender's Adjust Last Operation panel is the same idea.  See :doc:`/interface/operation_strip`.

	Command
		A named action, such as :guilabel:`Grab Vertices` or :guilabel:`Save Document`.  Menus, the toolbar, shortcuts, and the command palette all run commands.  See :doc:`/interface/command_palette`.

	Command Palette
		A searchable list of the commands that apply to the area under the pointer, opened with :kbd:`Ctrl-P` or :kbd:`Space`.  It is like Blender's :kbd:`F3` search.  See :doc:`/interface/command_palette`.

	Chord
		A key together with the modifier keys that are held with it, such as :kbd:`Ctrl-Shift-S`.  The primary modifier is :kbd:`Ctrl` on Windows and Linux and :kbd:`Cmd` on macOS.  See :doc:`/interface/keymap`.

	Keymap
		The list of which chord runs which command.  Umamo has three presets, Default, Cubism, and Blender, and your own changes are laid over whichever you choose.  See :doc:`/interface/keymap` and :doc:`/appendices/default_shortcuts`.

	Pie Menu
		A round menu that opens around the pointer when you press its key, so that each choice is a short flick away.  The number keys :kbd:`1` to :kbd:`8` pick a slice.  See :doc:`/interface/pie_menus`.

	Overlay
		Something drawn over the model that is not the model, such as the grid, the axes, the 2D cursor, the wireframe, and the lattices of the deformers.  The :guilabel:`Viewport Overlays` menu switches them.  See :doc:`/editors/viewport_2d/overlays`.

	Notice
		A short message that Umamo shows near the pointer or in the status bar, to say that something happened or that a command was refused.  See :doc:`/interface/status_bar` and :doc:`/troubleshooting/common_messages`.

	Object Mode
		The editing mode for the model as a whole: you select, move, and key whole objects.  See :doc:`/modeling/modes`.

	Edit Mode
		The editing mode for the inside of an object, at rest: the vertices of a mesh, or the points of a warp deformer's lattice.  :kbd:`Tab` toggles it.  See :doc:`/modeling/modes`.

	Pose Mode
		The editing mode for shaping a warp deformer's lattice at the pose the parameters are at now, so that the shape can be keyed.  It borrows the name of Blender's mode, but it shapes lattices and not bones.  :kbd:`Ctrl-Tab` toggles it.  See :doc:`/rigging/posing_warps`.

	Select Mode
		Which kind of element a click, a box, or a brush picks in Edit Mode and Pose Mode: vertices, edges, or faces for a mesh, and points, grid lines, or cells for a lattice.  :kbd:`1`, :kbd:`2`, and :kbd:`3` choose.  See :doc:`/modeling/selecting`.

	Pivot Point
		The point that a rotation turns about and a scale grows from: the median point, the individual origins, the active element, or the 2D cursor.  See :doc:`/modeling/transforming`.

	Proportional Editing
		Moving the elements near the selection by a little, in proportion to how close they are.  The falloff curve and the size set how far and how.  See :doc:`/modeling/proportional_editing`.

	Snap
		A command that puts the selection or the cursor at an exact place, such as the grid or the cursor, once, at the moment that you run it.  Umamo has no magnet that holds a drag to a target.  See :doc:`/modeling/snapping`.

	2D Cursor
		A point on the canvas that the snaps move things to and from, and that can be the pivot.  Blender calls it the 3D cursor.  See :doc:`/modeling/snapping`.

Model Terms
===========

.. glossary::

	Puppet File/Document
		What is open in Umamo: a model, with the list of its artwork files, its texture atlas, and the state of the editor.  Saved as a UMA/MOC3/CMO3 file.  See :doc:`/files/uma`.

	Model
	Puppet
		The thing that you build: art cut into drawables, with the deformers, parameters, and keys that make it move.  The manual says model, and the Umamo source says puppet.  See :doc:`/rigging/index`.

	Canvas
		The page that the model is drawn on, with a width and a height in pixels.  It is set in the Document tab of the Properties editor.  See :doc:`/editors/properties/document_tab`.

	World Axes
		The two axes that every position is measured from, and the origin where they cross.  The Document tab places the origin from the bottom-left corner of the canvas.  See :doc:`/editors/properties/document_tab`.

	Part
		A folder in the model.  It holds drawables and other parts, to stack them and to show or hide them together.  Cubism uses the same word.  See :doc:`/modeling/parts_and_drawables`.

	Group Mode
		How a part treats what is inside it: :guilabel:`Pass Through`, :guilabel:`Grouped`, or :guilabel:`Isolated`.  See :doc:`/modeling/parts_and_drawables`.

	Drawable
		A piece of art with a mesh and the settings of how it is stacked, blended, and masked.  There is one for each layer of an artwork file.  Cubism calls it an ArtMesh.  See :doc:`/modeling/parts_and_drawables`.

	Organization Tree
		The tree of parts and drawables.  It sets the stacking, what is shown and hidden together, and the layout of the Outliner.  The other tree is the :term:`Deformer Chain`.  See :doc:`/modeling/parts_and_drawables`.

	Mesh
		The net of triangles that the art of a drawable is stretched over.  See :doc:`/modeling/meshes`.

	Vertex
		A point of a mesh.  It has a position and a :term:`UV`, and a motion at every key if the mesh is keyed.  See :doc:`/modeling/meshes`.

	UV
		The place on the texture that a vertex takes its color from.  The UV Editor shows and edits them.  See :doc:`/editors/uv_editor/index`.

	Draw Order
		A number from 0 to 1000 that says where a drawable, or a part, stacks.  Higher is in front.  It can be keyed.  See :doc:`/modeling/parts_and_drawables`.

	Blend Mode
		How the colors of a drawable mix with the colors behind it.  :guilabel:`Normal` draws it over them.  See :doc:`/modeling/blending_and_masking`.

	Alpha Mode
		How the see-through parts of a drawable combine with what is behind it.  It is a Cubism 5.3 feature.  See :doc:`/modeling/blending_and_masking`.

	Multiply Color
	Screen Color
		Two colors that tint a drawable without changing its art.  Both can be keyed, from Cubism 4.2.  See :doc:`/modeling/blending_and_masking`.

	Mask
		A cut that shows a drawable only where other drawables have art.  :guilabel:`Masked By` lists them, and :guilabel:`Invert Mask` reverses it.  Cubism calls it clipping.  See :doc:`/modeling/blending_and_masking`.

	Composite
		The picture that an :guilabel:`Isolated` part is drawn as: everything inside is drawn together, and then put on the model with the part's own opacity, blend mode, colors, and masks.  Cubism 5.3 calls it offscreen drawing.  See :doc:`/modeling/blending_and_masking`.

	Guide Image
		A part that is marked as a reference, such as a sketch.  It shows in the editor, and a MOC3 export leaves it out unless you ask for it.  See :doc:`/modeling/parts_and_drawables`.

	Runtime Target
		The Cubism runtime version that the model is made for.  It hides the controls of features that version cannot play, and it decides the version of a MOC3 export.  It removes nothing from the document.  See :doc:`/files/runtime_targets`.

Rigging Terms
=============

.. glossary::

	Parameter
		A dial with a name and a range, whose value moves the model through its keys.  Cubism uses the same word.  See :doc:`/rigging/parameters` and :doc:`/editors/parameters`.

	Parameter Group
		A folder in the Parameters editor that holds parameters.  It only organizes them.  See :doc:`/rigging/parameters`.

	Linked Parameters
		Two parameters shown as one two-dimensional pad.  Cubism calls them combined parameters.  Linking changes how they are shown and nothing else.  See :doc:`/rigging/parameters`.

	Pose
		The values that all the parameters have at this moment.  The viewport shows the model at the pose.  See :doc:`/rigging/posing_warps`.

	Rest
		The pose in which every parameter is at its default.  Edit Mode edits the rest.  See :doc:`/modeling/modes`.

	Key
	Keyframe
		The look that an object has at one value of a parameter, stored for blending.  :guilabel:`Insert Keyframe` adds one at the pose.  See :doc:`/rigging/keyforms`.

	Keyform
		Cubism's word for the look that is stored at a key.  In this manual a key is the point on the parameter, and the keyform is what is stored there.  See :doc:`/rigging/keyforms`.

	Keyform Grid
		All the keys of one object, laid out along an axis for each parameter it is keyed on, with a stored look in every cell.  See :doc:`/rigging/keyforms`.

	Axis
		A parameter that an object is keyed on, with the values of its keys along it.  See :doc:`/rigging/keyforms`.

	Track
		One property of an object that is keyed on its own: its geometry, its opacity, its colors, its draw order, its flips, or a glue's intensity.  See :doc:`/editors/keyform_sheet`.

	Keyform Sheet
		The editor that shows the keys of the targeted parameter as marks on tracks, much as Blender's dope sheet does.  See :doc:`/editors/keyform_sheet`.

	Target
		To choose the parameter that keys go on, by clicking it in the Parameters editor.  The Keyform Sheet shows the targeted parameters.  See :doc:`/editors/parameters`.

	Pending Edit
		A shape made in Pose Mode that is not keyed yet.  It is shown in orange, it is lost if the pose changes, and it is not saved.  See :doc:`/rigging/posing_warps`.

	Blend Shape
		A shape added on top of the keys, driven by a blend shape parameter.  It is carried from Cubism 4.2, and Umamo cannot make one yet.  See :doc:`/rigging/blend_shapes`.

	Deformer
		An object that moves what is under it.  A warp deformer bends it, and a rotation deformer turns it.  See :doc:`/rigging/deformers`.

	Warp Deformer
		A deformer that bends what is inside it with a lattice of control points.  See :doc:`/rigging/deformers`.

	Rotation Deformer
		A deformer that turns what is under it about a pivot.  Umamo carries and plays it, and cannot make or edit it yet.  See :doc:`/rigging/deformers`.

	Lattice
		The grid of control points of a warp deformer.  A lattice of N rows and M columns has (N + 1) by (M + 1) points.  See :doc:`/rigging/deformers`.

	Deformer Chain
		The tree of deformers, in which a drawable or a deformer has one parent deformer.  It sets how things move, and the :term:`Organization Tree` sets how they stack.  See :doc:`/rigging/deformers`.

	Keep in Place
		The choice, in the operation strip, to keep an item where it rests when it is moved to a new parent.  See :doc:`/rigging/deformers`.

	Parameter Template
		The set of parameters that a document starts with when its first artwork is added.  The Humanoid template has 39.  See :doc:`/rigging/parameters`.

	Parameter Repeat
		A Cubism 5.3 flag that makes a parameter wrap around at its ends.  Umamo keeps it and cannot set or play it.  See :doc:`/rigging/parameters`.

	Glue
		A weld between two meshes along a seam, with an intensity that can be keyed.  Umamo plays imported glue and cannot make it.  See :doc:`/rigging/glue`.

	Physics
		The simulation that moves parameters by itself, so that hair sways.  Umamo keeps it without playing it.  See :doc:`/rigging/physics`.

Artwork Terms
=============

.. glossary::

	Artwork
		The layered or flat image file that a model is built from: a PSD, a CLIP, a KRA, or a flat image.  See :doc:`/artwork/supported_formats`.

	Layer
		One image in an artwork file.  Each layer becomes a drawable, and each folder becomes a part.  See :doc:`/artwork/importing`.

	Source
		An artwork file that the document keeps a record of.  The Sources editor lists them with their layers.  See :doc:`/editors/sources`.

	Binding
		The link between a piece of art in the document and the layer of a file that it came from.  A layer without art is unbound, and so is art without a layer.  See :doc:`/artwork/relinking_and_reloading`.

	Reload
		Reading the artwork files again and folding in what changed.  See :doc:`/artwork/relinking_and_reloading`.

	Relink
		Binding a piece of art to another layer by hand.  See :doc:`/artwork/relinking_and_reloading`.

	Needs Review
		The state of a binding that nothing in the file settles.  The document keeps it as it is until you decide.  See :doc:`/artwork/relinking_and_reloading`.

	Match Automatically
		The command that scores the layers a reload lost against the rest of the file and proposes a match for each.  See :doc:`/artwork/relinking_and_reloading`.

	Watcher
		What notices that an artwork file changed on disk, and reloads it or tells you, as the :guilabel:`Watch Artwork Files` setting says.  See :doc:`/artwork/source_watcher`.

	Texture Atlas
		The pages of packed pictures that the model is drawn from.  See :doc:`/artwork/atlas_packing`.

	Tile
		One piece of art on an atlas page: one layer of an artwork file, cut down to the part that has art in it.  See :doc:`/artwork/atlas_packing`.

	Pack
		To place the tiles on the pages of the atlas.  :guilabel:`Repack Atlas` does it again with the options that you give.  See :doc:`/artwork/atlas_packing`.

	Pin
		To mark a tile so that a hand move and a repack leave it where it is.  See :doc:`/editors/uv_editor/placement`.

	Initial Mesh
		The mesh that a drawable starts with when its artwork is added.  Generated from the art by default, or a quad.  See :doc:`/artwork/importing`.

	Show Source Artwork
		The :guilabel:`Show source artwork` property of the document, which draws the model from each drawable's own layer instead of from the atlas pages.  See :doc:`/editors/properties/document_tab`.

.. seealso::

	* :doc:`/getting_started/coming_from_cubism`
	* :doc:`/interface/window_system`
	* :doc:`/modeling/parts_and_drawables`
