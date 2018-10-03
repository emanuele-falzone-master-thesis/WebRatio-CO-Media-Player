-- Author [ent1]
create table "AUTHOR" (
   "OID"  integer  not null,
   "NAME"  varchar,
  primary key ("OID")
);


-- Song [ent4]
create table "SONG" (
   "OID"  integer  not null,
   "AUTHOR"  varchar,
   "TITLE"  varchar,
   "SOUND"  varchar,
  primary key ("OID")
);


