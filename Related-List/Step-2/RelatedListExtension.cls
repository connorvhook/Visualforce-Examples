public with sharing class RelatedListExtension
{
	// Private reference to the record loaded by the standard controller... (the contact
	// being viewed)
	private Contact c;

	// NEW CODE
	// Standard Set Controllers are system-provided components for dealing with sets of
	// records easily. They're known as Standard List Controllers in the Visualforce
	// documentation as they can be utilised directly by Visualforce pages through the
	// use of the recordSetVar parameter in <apex:page> tags
	public ApexPages.StandardSetController ssc {get; set;}
	
	// We use a standard controller so the system takes care of the parent record's details
	// and allows us to use the page in the layout for that object.
	public RelatedListExtension(ApexPages.StandardController sc)
	{
		c = (Contact)sc.GetRecord();
		
		// NEW CODE
		// Create n Standard Set Controller instance and assign it to the ssc member
		// variable. The simplest way of initialising these is to just pass in a list
		// of records, since queries return a list of records we can do that directly.
		// Now we limit to 100 since the controller will paginate for us.

		ssc = new ApexPages.StandardSetController([select Id, Name, CloseDate, StageName
												   from Opportunity
												   where Id in
												   		(select OpportunityId
												   		from OpportunityContactRole
												   		where ContactId = : c.Id and IsPrimary = true)
													limit 100]);

		// Specify that we want to see up to 5 records at any one time
		ssc.SetPageSize(5);
	}

	public List<Opportunity> GetRelatedOpportunities()
	{
		// NEW CODE
		// Get records for display from the standard set controller. The return type
		// of GetRecords() is List<SObject>. All Database objects, such as Opportunties
		// are specific types of SObjects, so we can convert the result with a cast
		return (List<Opportunity>)ssc.GetRecords();
	}
}