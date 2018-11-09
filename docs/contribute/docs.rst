Writing Documentation
=====================

New documentation should fit well with the rest of MISP-dockerized's docs.

.. contents:: Contents
   :local:
   :depth: 1

Testing docs locally
--------------------
MISP-dockerized has a `grunt`_ script that automatically builds the docs, opens them in a browser
window, and automatically reloads as you make changes (the reload takes just a few
seconds).

.. code:: sh

   cd path/to/elgg/
   npm install
   grunt

It's that easy! Grunt will continue running, watching the docs for changes and
automatically rebuilding.

.. _grunt: http://gruntjs.com/

Follow the existing document organization
-----------------------------------------
The current breakdown is not necessarily the One True Way to organize docs,
but consistency is better than randomness.


intro/*
^^^^^^^
This is everything that brand new users need to know (installation, features, license, etc.)

admin/*
^^^^^^^
Guides for administrators. Task-oriented.

guides/*
^^^^^^^^
API guides for plugin developers. Cookbook-style. Example heavy. Code snippet heavy.
Broken down by services (actions, i18n, routing, db, etc.).
This should only discuss the public API and its behavior, not implementation details or reasoning.

design/*
^^^^^^^^
Design docs for people who want to get a better understanding of how/why core is built the way it is.
This should discuss internal implementation details of the various services, what tradeoffs were made,
and the reasoning behind the final decision. Should be useful for people who want to contribute and
for communication b/w core devs.

contribute/*
^^^^^^^^^^^^
Contributors guides for the various ways people can participate in the project.

appendix/*
^^^^^^^^^^
More detailed/meta/background information about the project (history, roadmap, etc.)


Avoid first person pronouns
---------------------------
Refer to the reader as “you.” Do not include yourself in the normal narrative.

Before:

    When we’re done installing MISP-dockerized, we’ll look for some plugins!

After:

    When you’re done installing MISP-dockerized, look for some plugins!

To refer to yourself (avoid this if possible), use your name and write in the third person.
This clarifies to future readers/editors whose opinions are being expressed.

Before:

    I think the best way to do X is to use Y.

After:

    Evan thinks the best way to do X is to use Y.



Prefer absolute dates over relative ones
----------------------------------------
It is not easy to tell when a particular sentence or paragraph was written, so relative dates quickly become meaningless.
Absolute dates also give the reader a good indication of whether a project has been abandoned, or whether some advice might be out of date.

Before:

    Recently the foo was barred. Soon, the baz will be barred too.

After:

    Recently (as of September 2013), the foo was barred.
    The baz is expected to be barred by October 2013.

Do not remind the reader to contribute
--------------------------------------
Focus on addressing only the topic at hand.
Constant solicitation for free work is annoying and makes the project look needy.
If people want to contribute to the project, they can visit the contributor guide.


Internationalizing documentation
================================

When you change documentation, remember to update the documentation translation
templates before you commit:

.. code:: sh

   cd docs/
   make gettext

For more information, see
http://sphinx-doc.org/latest/intl.html#translating-with-sphinx-intl