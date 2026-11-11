**********
Parameters
**********

A parameter is a dial that moves the model.  Angle X turns the head, Eye Open closes the eyelid, Breath lifts the chest.  A parameter does nothing by itself: it is a number with a range, and the objects of the model are **keyed** on it, which says what each of them looks like at some values of that number.  This page is about making and arranging the dials.  The editor that shows them is :doc:`/editors/parameters`.

What a Parameter Is
===================

A parameter has:

* A **name**, the label in the Parameters editor.  It is yours to change.
* An **ID**, which is what a Cubism runtime and a face tracker use to find it, such as ``ParamAngleX``.  The ID is set when the parameter is made or imported.  Renaming never changes it, and there is no field in Umamo to change it.
* A **range**: a minimum, a maximum, and a **default**, the value of the dial at rest.
* A **kind**: key form or blend shape.  See `Parameter Kinds`_.

The **pose** of the model is the value of every parameter.  A document is at its rest pose when every parameter is at its default, which is the pose that Edit Mode shows, and that Object Mode transforms need.  The Parameters editor moves the pose, and so does a key click in the Keyform Sheet.  A UMA file remembers the pose as the values that are away from their defaults.

The parameters of a model came from an import, from the starter template, or from you.  A new one is made by :guilabel:`Add Parameter` in the Parameters editor.  It is called ``New Parameter``, goes from -1 to 1, has a default of 0, and has the ID ``Param``, or ``Param2``, ``Param3``, and so on.  Rename it, and set its range.

Parameter Kinds
===============

There are two kinds, and they work differently.

Key Form Parameters
-------------------

The usual kind.  The objects that are keyed on it have a **shape at each key**, and as the dial moves between two keys the object is blended between their shapes.  A head that is keyed on Angle X at -30, 0, and 30 shows the left, the front, and the right.  The slider has a round thumb and its keys are circles.  See :doc:`/rigging/keyforms`.

Blend Shape Parameters
----------------------

A parameter that drives **additive** shapes.  Where a key form says "at this value the object looks like this", a blend shape says "at this value, add this much of that change", and several blend shapes on one object add together.  The slider has a square thumb and its keys are squares.  They are a Cubism 4.2 feature, so :guilabel:`Add Blend Shape Parameter` is in the menus only when the runtime target has them.  See :doc:`/rigging/blend_shapes` and :doc:`/files/runtime_targets`.

The kind is chosen when the parameter is made.  The Parameters editor cannot change it afterwards.

Range
=====

The range is set in the range editor of the parameter, with :guilabel:`Min`, :guilabel:`Default`, and :guilabel:`Max`.  The three are tidied after each change so that the minimum is not above the maximum and the default is inside the range.  See :doc:`/editors/parameters`.

The range is the span the dial can be moved in, and it is the span that keys are made over.  Changing it is a change to the document, it works in any mode, and it is one undo step.  It does not move any key.  A key that is left outside the new range cannot be reached with the slider.

The default matters more than it seems, because it is the rest pose.  Edit Mode shows the model there, and a warp that is not drawn at the default pose cannot be edited in Edit Mode, so keep the default inside the keys.

Groups
======

A group is a named folder for parameters in the panel.  Groups help you find a dial among dozens and have no effect on how the model moves.  Make one with :guilabel:`New Group`, drag parameters in, and rename it.  They are saved in a UMA file and in a CMO3, and in the ``.cdi3.json`` file next to a MOC3.  A MOC3 that is imported without that file has no groups.  See :doc:`/files/cubism_interchange`.

Groups are one level deep in the editor.  A model that was imported with nested groups keeps them.

Linked Pairs
============

Two parameters can be **linked**, which Cubism calls combined parameters.  A linked pair is shown as one 2D pad, with one handle that moves both, such as Angle X and Angle Y for the head.  Each of the two stays an ordinary parameter, with its own range and its own keys.  The link changes only how the two are shown, and not the pose, so linking and unlinking move nothing.

A pair is the parameter and the one directly below it in the same group, and neither can be in another link.  A link travels in a UMA file, in a CMO3, and in the ``.cdi3.json`` file of a MOC3.

When a key is made while a linked pad is targeted, Umamo asks which of its two parameters the key is for.  See :doc:`/editors/parameters`.

Parameter Templates
===================

A new rig has to start with the dials that tools expect.  The **Parameter Template** is a setting in the :guilabel:`Import` category of the Settings window, and it says what a document that has no parameters gets when its first artwork is added.

:guilabel:`Humanoid`
	The default.  The 39 standard parameters that Live2D publishes, with the IDs, ranges, and defaults that Live2D-compatible runtimes and face trackers look for.

:guilabel:`None`
	No parameters.

A document that already has parameters keeps them whatever the template says.  The names are English and yours to change, and the IDs are not.  The Humanoid set is:

.. list-table::
	:header-rows: 1

	* - IDs
	  - Range
	  - Default
	* - ``ParamAngleX``, ``ParamAngleY``, ``ParamAngleZ``
	  - -30 to 30
	  - 0
	* - ``ParamBaseX``, ``ParamBaseY``
	  - -30 to 30
	  - 0
	* - ``ParamEyeLOpen``, ``ParamEyeROpen``
	  - 0 to 1
	  - 1
	* - ``ParamEyeLSmile``, ``ParamEyeRSmile``
	  - 0 to 1
	  - 0
	* - ``ParamEyeBallX``, ``ParamEyeBallY``
	  - -1 to 1
	  - 0
	* - ``ParamBrowLY``, ``ParamBrowRY``, ``ParamBrowLX``, ``ParamBrowRX``, ``ParamBrowLAngle``, ``ParamBrowRAngle``, ``ParamBrowLForm``, ``ParamBrowRForm``
	  - -1 to 1
	  - 0
	* - ``ParamMouthForm``
	  - -1 to 1
	  - 0
	* - ``ParamMouthOpenY``, ``ParamCheek``, ``ParamBreath``, ``ParamHairFluffy``
	  - 0 to 1
	  - 0
	* - ``ParamBodyAngleX``, ``ParamBodyAngleY``, ``ParamBodyAngleZ``
	  - -10 to 10
	  - 0
	* - ``ParamArmLA``, ``ParamArmRA``, ``ParamArmLB``, ``ParamArmRB``, ``ParamHandL``, ``ParamHandR``, ``ParamShoulderY``
	  - -10 to 10
	  - 0
	* - ``ParamHairFront``, ``ParamHairSide``, ``ParamHairBack``, ``ParamBustX``, ``ParamBustY``
	  - -1 to 1
	  - 0

There is no command to apply a template to a document that has parameters already.  See :doc:`/artwork/importing`.

Deleting a Parameter
====================

:guilabel:`Delete Parameter` removes the dial and everything that was keyed on it.  Each object that was keyed on the parameter loses that axis and keeps its shape **at the default** of the parameter, so the model keeps its neutral look and loses only the motion of that dial.  If the default was not on a key, the nearest key is kept instead, and some objects look different at rest.  Then a notice says so: ``Parameter deleted.  3 object(s) now look different at the default pose.``  The blend shapes and weight limits that named the parameter are dropped, so that the file has no missing ID.  It is one undo step, and Undo brings back all of it.

Things outside the model can still name the parameter.  The physics settings of a CMO3, and the expression and motion files of a MOC3, are not edited by Umamo and are written unchanged, so an export reports the ones that now name a missing parameter.  See :doc:`/files/export_notices`.

Parameter Repeat
================

A parameter can be marked to **repeat**, so that a value past its maximum comes back in at the minimum.  It is for dials that turn forever, such as a wheel or a tail that loops.  It is a Cubism 5.3 feature.

Umamo carries the mark and does not use it.  An imported mark is kept, shown among the restricted features of the runtime target as in use, and written back on export.  There is no control to set it, and the viewport does not wrap the value.  See :doc:`/files/runtime_targets`.

Current Limitations
===================

* The ID of a parameter cannot be changed, so a new parameter has the ID ``Param`` or ``Param2``.  A runtime that looks for a standard ID needs the :guilabel:`Humanoid` template, or an imported model.
* The kind of a parameter cannot be changed after it is made.
* Parameter Repeat can be carried and cannot be set or played.
* A template can only be applied when artwork is added to a document with no parameters.
* The Parameters editor can rename, range, link, group, reorder, and delete a parameter.  It cannot copy one.

.. seealso::

	* :doc:`/editors/parameters`
	* :doc:`/rigging/keyforms`
	* :doc:`/rigging/blend_shapes`
	* :doc:`/artwork/importing`
	* :doc:`/files/runtime_targets`
