********
Keyforms
********

A **keyform** is a stored look: what an object, or one of its properties, is like when a parameter has a particular value.  Rigging is the work of storing keyforms at the values that matter and letting Umamo blend them in between.  A head that has a keyform at Angle X of -30, 0, and 30 turns smoothly through every value in between.  The sliders are in :doc:`/editors/parameters`, the keys are laid out in :doc:`/editors/keyform_sheet`, and this page says what they mean.

Keyform Grids
=============

Each object that moves has a **keyform grid**.  The grid has an **axis** for every parameter the object is keyed on, with the values of the keys along it, and it has a stored look in every **cell**, one for each combination of keys.  An object keyed on Angle X at three values has three cells.  If it is also keyed on Angle Y at three values, it has nine, because the grid holds a look for every pair.  A key on one more parameter multiplies the cells, which is why a rig with many parameters on one object gets large quickly.

At a pose the value of each axis picks the cells around it, and Umamo blends those looks linearly: between two keys on one axis, between the four nearest on two axes, and so on.  A look that cannot blend, such as the flip of a rotation, takes the value of the key below the pose.

What gets a grid:

.. list-table::
	:header-rows: 1

	* - Object
	  - What can be keyed
	* - Warp deformer
	  - The shape of its lattice.  Its opacity, multiply color, and screen color.
	* - Rotation deformer
	  - The origin, angle, and scale of its pivot.  Its opacity and colors.  The two flips.
	* - Drawable
	  - The shape of its mesh.  Its draw order, opacity, multiply color, and screen color.
	* - Part
	  - Its draw order.  The opacity and colors of an isolated part.
	* - Glue
	  - Its intensity.  See :doc:`/rigging/glue`.

**Each property has a track of its own.**  In Cubism the shape, the opacity, the draw order, and the colors of an object share one keyform, so a key on one is a key on all of them.  Umamo keeps them apart.  A warp can be keyed on Angle X for its shape and on Breath for its opacity, with no other keys.  Each track has its own parameters and its own keys.  When you export, the tracks of an object are combined into the single grid that a Cubism file holds.  See :doc:`/files/cubism_interchange`.

A property with no track has one **static** value, which is what an edit of that field changes.  It gets a track the first time that you key it.

The look at the **default** of every parameter is the object's rest.  It is the shape that Edit Mode shows and edits.  See :doc:`/modeling/modes`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The three views of one keyed warp deformer: its Lattice row in the Properties editor tinted for a key, the Parameters editor with a slider on a key mark, and the Keyform Sheet with the warp's Geometry track.
	:Setup: Open a model with a keyed warp such as a body or head warp, select it, target one of its parameters, and move the slider onto a key.
	:Crop: The Parameters editor, the Keyform Sheet, and the Properties editor, in one window picture.
	:Save as: ``images/rigging/keyforms.png``
	:Caption: One keyed warp, in the three editors that show its keys.

Insert and Delete Keyframes
===========================

To make a key, put the model at the pose that you want to store, make the object look as it should there, and key it.

#. **Target the parameter**: click the empty part of its island, or its grip, in the Parameters editor.  The key is made on the targeted parameter.  With two targeted, as with a linked pad, Umamo asks which one.  With none, the notice is ``Select a parameter to key on.``
#. **Move it** to the value that you want a key at.
#. **Edit** what is to be stored.  For a property, type a value in its field in the Properties editor.  For the lattice of a warp, shape it in Pose Mode.  Until it is keyed the edit is only **pending**: it shows, and it is lost when you move the parameter.
#. **Key** it: press :kbd:`I` over the thing.

The first key of a property on a parameter first gives it keys at the minimum, the default, and the maximum of the parameter, each holding the look that the property has now.  Nothing changes on the screen.  Then your value is stored at the pose.  If the pose is between two keys that already exist, a key is first made there that keeps the look, and then it takes your edit, so a key never changes the blend around it by itself.  A lattice that is keyed on other parameters too gets a key on each of them where the pose is not on a key, and the new shape belongs to the one cell where the pose sits.

Insert Keyframe
---------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`I`

Keys what is under the pointer:

* Over a **field** in the Properties editor: keys it at the pose.  If you edited the field and have not keyed it, the edit is what is stored.  If not, the key stores what the field is now, which pins the look before you go on to change it.
* Over a **track** in the Keyform Sheet: keys at the spot that you point at, keeping the shape of the track as it was.  If the object holds an edit that is not keyed, it keys the edit at the pose, wherever on the track the pointer is.
* Over the **2D Viewport** in Pose Mode: keys the lattice of every posed warp, and with it any opacity or color that you have edited and not keyed on those warps.  See :doc:`/rigging/posing_warps`.

If nothing under the pointer can be keyed, the notice is ``Point at a keyable property to insert a keyframe.``  Each key is one undo step.  Insert Keyframe is dimmed in Edit Mode.

Delete Keyframe
---------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`Alt-I`

Takes off the key at the pose, from the same three places.  If the pose is between keys, there is no key to take, and nothing is removed: Umamo does not guess which neighbor you meant.  When a key is removed from an axis that has two, the axis is dropped; when the last axis of a property is dropped, the property goes back to its one static value.  A warp always keeps at least one axis for its lattice, so a key that would drop the last one is refused.

Insert Key by Type
==================

.. admonition:: Reference
	:class: refbox

	:Mode: Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`K`

A warp has several things that can be keyed.  Plain :kbd:`I` keys the lattice and what you have edited.  :kbd:`K` over a 2D Viewport opens the Insert Key pie, which chooses:

* :guilabel:`Lattice`: the shape of every posed warp.
* :guilabel:`Opacity`: the opacity of every posed warp.
* :guilabel:`Colors`: the multiply and screen colors together.  It is greyed when the runtime target has no colors, which is before Cubism 4.2.
* :guilabel:`All`: all of them in one step.

The four are commands too, :guilabel:`Insert Lattice Key`, :guilabel:`Insert Opacity Key`, :guilabel:`Insert Color Keys`, and :guilabel:`Insert All Keys`.  The pie does not ask which parameter; a linked pad asks, after the pick.  See :doc:`/interface/pie_menus`.

Editing Keys on the Sheet
=========================

The Keyform Sheet is where keys are seen and rearranged.  Select a mark and drag it to move the key along its parameter, or nudge it with :kbd:`Left` and :kbd:`Right`; remove it with :guilabel:`Delete Keyframe`; add one at a spot with :guilabel:`Insert Keyframe`.  Moving a key changes where its look applies, and not the look.  A key can be moved past its neighbors, and the keys are then put in order.  Keys cannot be inserted, removed, or moved in Edit Mode.  See :doc:`/editors/keyform_sheet`.

Current Limitations
===================

* Only the lattice of a warp can be **shaped** at a pose.  The mesh of a drawable and the pivot of a rotation deformer cannot be keyed by hand.  The keys they come with in an imported model can be moved, removed, and inserted on the Keyform Sheet, and an inserted key keeps the shape as it was.
* There is no automatic keying.  An edit to a keyed field is pending until you press :kbd:`I`.
* The keys of a blend shape are shown as squares and cannot be selected or moved.  See :doc:`/rigging/blend_shapes`.
* A glue's intensity can be keyed on the sheet, and it has no field in the Properties editor.  See :doc:`/rigging/glue`.
* Blending between keys is linear.  There is no curve to choose.

.. seealso::

	* :doc:`/rigging/posing_warps`
	* :doc:`/editors/keyform_sheet`
	* :doc:`/editors/properties/index`
	* :doc:`/rigging/parameters`
	* :doc:`/rigging/blend_shapes`
