PermissionSet 1750 "Data Classification - Read"
{
    Access = Internal;
    Assignable = false;

    Permissions = tabledata Company = r,
                  tabledata "Data Privacy Entities" = R,
                  tabledata "Fields Sync Status" = r,
                  tabledata "Data Sensitivity" = R,
                  tabledata Field = r,
                  tabledata "Table Relations Metadata" = r,
                  tabledata User = r;
}
