Related List Example
====================

This is an example of building up a Visualforce page that works like a related list and can be embedded in a standard page layout. The steps do not necessarily build on each other directly (some code is replaced or removed between steps) but instead show a logical progression of thinking, starting from the basics and adding features along the way.

Additions to the code are indicated by "NEW CODE" in the corresponding comments.

##Step 1
A super simple, functionally limited page that simply displays a maximum of five opportunities, where the contact being worked with is the primary contact.

##Step 2
Replacement of the basic query with a publicly visible standard set controller. It's a public variable so that it's methods can be accessed directly from the Visualforce page. Although `GetRecords()` is visible, it returns a list of SObject instances, so we use a controller method to cast (cast means to treat one object type as another) that list into a list of opportunities.

At this point, things may look more complicated, but using the standard set controller makes many other things easier in the steps ahead.

##Step 3
An example of where the ssc makes life easier. In this step we've added pagination links with just a few changes to our Visualforce page, no Apex changes required!



More to come soon!
