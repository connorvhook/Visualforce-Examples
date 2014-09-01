public with sharing class RelatedListExtension
{
    // Private reference to the record loaded by the standard controller... (the contact
    // being viewed)
    private Contact c;
    
    // We use a standard controller so the system takes care of the parent record's details
    // and allows us to use the page in the layout for that object.
    public RelatedListExtension(ApexPages.StandardController sc)
    {
        c = (Contact)sc.GetRecord();
    }
    
    // An example of getting specific related records... in this case just showing up to 5
    // related Opportunities where this contact is the primary contact. We do this using
    // a semi-join... we look for oppoties where the Id belongs to set of Ids, which is
    // generated with another query, in this case, the one on the contact roles object. 
    // That query finds all opportunity Ids where our contact is the primary contact.
    public List<Opportunity> GetRelatedOpportunities()
    {
        return [select Id, Name, CloseDate, StageName
                from Opportunity
                where Id in 
                    (select OpportunityId
                        from OpportunityContactRole
                        where ContactId = : c.Id and IsPrimary = true)
                limit 5];
    }
}