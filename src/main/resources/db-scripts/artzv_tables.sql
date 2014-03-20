  CREATE TABLE "ARTZV_DB"."ARTZV_ADDR_TYPE" 
     (	"ADDR_TYPE" VARCHAR2(1 CHAR) NOT NULL, 
	"ADDR_DESCRIPTION" VARCHAR2(50 CHAR), 
	 CONSTRAINT "ARTZV_ADDR_TYPE_PK" PRIMARY KEY ("ADDR_TYPE");
  
  
  
  CREATE TABLE "ARTZV_DB"."ARTZV_PHONE_TYPE" 
     (	"PHONE_TYPE" VARCHAR2(1 CHAR) NOT NULL, 
  	"PHONE_DESCRIPTION" VARCHAR2(20 CHAR), 
  	 CONSTRAINT "ARTZV_PHONE_TYPE_PK" PRIMARY KEY ("PHONE_TYPE"));
  
  
  CREATE TABLE "ARTZV_DB"."ARTZV_USERS" 
     (	"USER_ID" NUMBER NOT NULL, 
  	"EMAIL_ID" VARCHAR2(50 CHAR), 
  	"FIRST_NAME" VARCHAR2(50 CHAR), 
  	"MIDDLE_NAME" VARCHAR2(50 CHAR), 
  	"LAST_NAME" VARCHAR2(50 CHAR), 
  	"SOCIAL_NETWORK_FLG" VARCHAR2(1 CHAR), 
  	"AUTHORIZED_FLG" VARCHAR2(1 CHAR), 
  	 CONSTRAINT "ARTZV_USERS_PK" PRIMARY KEY ("USER_ID"));
  
  
  CREATE TABLE "ARTZV_DB"."ARTZV_USER_AUTH" 
     (	"USER_ID" NUMBER, 
  	"LOGIN_ID" VARCHAR2(40 CHAR) NOT NULL, 
  	"PASSWORD" VARCHAR2(8 CHAR), 
  	"POPULARITY" NUMBER, 
  	 CONSTRAINT "ARTZV_USER_AUTH_PK" PRIMARY KEY ("LOGIN_ID")
  	 CONSTRAINT "ARTZV_USER_AUTH_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "ARTZV_DB"."ARTZV_USERS" ("USER_ID"));
  
  
  CREATE TABLE "ARTZV_DB"."ARTZV_USER_PHONE" 
     (	"USER_ID" NUMBER NOT NULL, 
  	"PHONE_TYPE" VARCHAR2(1 CHAR) NOT NULL, 
  	"COUNTRY_CD" NUMBER, 
  	"PHONE_NO" VARCHAR2(20 CHAR), 
  	 CONSTRAINT "ARTZV_USER_PHONE_PK" PRIMARY KEY ("USER_ID", "PHONE_TYPE")
  	 CONSTRAINT "ARTZV_USER_PHONE_FK1" FOREIGN KEY ("USER_ID")
  	  REFERENCES "ARTZV_DB"."ARTZV_USERS" ("USER_ID"), 
  	 CONSTRAINT "ARTZV_USER_PHONE_FK2" FOREIGN KEY ("PHONE_TYPE")
  	  REFERENCES "ARTZV_DB"."ARTZV_PHONE_TYPE" ("PHONE_TYPE")
     );
  
  
  CREATE TABLE "ARTZV_DB"."ARTZV_USER_ADDRESS" 
     (	"USER_ID" NUMBER NOT NULL, 
  	"ADDR_1" VARCHAR2(100 CHAR), 
  	"ADDR_2" VARCHAR2(100 CHAR), 
  	"AREA" VARCHAR2(50 CHAR), 
  	"POLICE_STATION" VARCHAR2(50 CHAR), 
  	"CITY" VARCHAR2(40 CHAR), 
  	"STATE" VARCHAR2(40 CHAR), 
  	"COUNTRY" VARCHAR2(40 CHAR), 
  	"PIN" VARCHAR2(20 CHAR), 
  	"LAND_MARK" VARCHAR2(100 CHAR), 
  	"ADDR_TYPE" VARCHAR2(1 CHAR) NOT NULL, 
  	 CONSTRAINT "ARTZV_USER_ADDRESS_PK" PRIMARY KEY ("USER_ID", "ADDR_TYPE")
  	 CONSTRAINT "ARTZV_USER_ADDRESS_FK1" FOREIGN KEY ("USER_ID")
  	  REFERENCES "ARTZV_DB"."ARTZV_USERS" ("USER_ID"), 
  	 CONSTRAINT "ARTZV_USER_ADDRESS_FK2" FOREIGN KEY ("ADDR_TYPE")
  	  REFERENCES "ARTZV_DB"."ARTZV_ADDR_TYPE" ("ADDR_TYPE")
     );
  
  CREATE TABLE "ARTZV_DB"."ARTZV_PHOTO" 
     (	"PHOTO_ID" NUMBER NOT NULL, 
  	"UPLOADED_BY" VARCHAR2(40 CHAR) NOT NULL, 
  	"SIZE_IN_KB" NUMBER, 
  	"TITLE" VARCHAR2(200 CHAR), 
  	"FILE_PATH" VARCHAR2(100 CHAR) NOT NULL, 
  	"URL" VARCHAR2(100 CHAR) NOT NULL, 
  	"UPLOAD_TIME" TIMESTAMP (6) NOT NULL, 
  	 CONSTRAINT "ARTZV_PHOTO_PK" PRIMARY KEY ("PHOTO_ID")
  	 CONSTRAINT "ARTZV_PHOTO_FK1" FOREIGN KEY ("UPLOADED_BY")
  	  REFERENCES "ARTZV_DB"."ARTZV_USER_AUTH" ("LOGIN_ID")
     );
  
  CREATE TABLE "ARTZV_DB"."ARTZV_COMMUNITY" 
     (	"PHOTO_ID" NUMBER NOT NULL, 
  	"MEMBER_ID" VARCHAR2(40 CHAR) NOT NULL, 
  	"LIKES" VARCHAR2(1 CHAR), 
  	"SHARED" VARCHAR2(1 CHAR), 
  	"RECCOMEND" NUMBER, 
  	 CONSTRAINT "ARTZV_COMMUNITY_PK" PRIMARY KEY ("PHOTO_ID", "MEMBER_ID")
  	 CONSTRAINT "ARTZV_COMMUNITY_FK1" FOREIGN KEY ("MEMBER_ID")
  	  REFERENCES "ARTZV_DB"."ARTZV_USER_AUTH" ("LOGIN_ID"), 
  	 CONSTRAINT "ARTZV_COMMUNITY_FK2" FOREIGN KEY ("PHOTO_ID")
  	  REFERENCES "ARTZV_DB"."ARTZV_PHOTO" ("PHOTO_ID")
     );
  
  CREATE TABLE "ARTZV_DB"."ARTZV_COMMUNITY_COMMENT" 
     (	"COMMENT_ID" NUMBER NOT NULL, 
  	"PARENT_COMMENT_ID" NUMBER, 
  	"COMMENTED_BY" VARCHAR2(40 CHAR), 
  	"COMMENTED_TIME" TIMESTAMP (6), 
  	"PHOTO_ID" NUMBER, 
  	 CONSTRAINT "ARTZV_COMMUNITY_COMMENT_PK" PRIMARY KEY ("COMMENT_ID")
  	 CONSTRAINT "ARTZV_COMMUNITY_COMMENT_FK1" FOREIGN KEY ("COMMENTED_BY")
  	  REFERENCES "ARTZV_DB"."ARTZV_USER_AUTH" ("LOGIN_ID"), 
  	 CONSTRAINT "ARTZV_COMMUNITY_COMMENT_FK2" FOREIGN KEY ("PHOTO_ID")
  	  REFERENCES "ARTZV_DB"."ARTZV_PHOTO" ("PHOTO_ID"), 
  	 CONSTRAINT "ARTZV_COMMUNITY_COMMENT_FK3" FOREIGN KEY ("PARENT_COMMENT_ID")
  	  REFERENCES "ARTZV_DB"."ARTZV_COMMUNITY_COMMENT" ("COMMENT_ID")
     );