
  
  create view "dbt"."staging"."stg_salesforce__user__dbt_tmp" as (
    with source as (

    select * from "dbt"."raw"."user"

),

renamed as (

    select
        id as user_id,
        username,
        firstname,
        lastname,
        companyname,
        division,
        department,
        title,
        street,
        city,
        state,
        postalcode,
        country,
        latitude,
        longitude,
        geocodeaccuracy,
        email,
        senderemail,
        sendername,
        signature,
        stayintouchsubject,
        stayintouchsignature,
        stayintouchnote,
        phone,
        fax,
        mobilephone,
        alias,
        communitynickname,
        isactive,
        issystemcontrolled,
        timezonesidkey,
        userroleid,
        localesidkey,
        receivesinfoemails,
        receivesadmininfoemails,
        emailencodingkey,
        profileid,
        usertype,
        usersubtype,
        startday,
        endday,
        languagelocalekey,
        employeenumber,
        delegatedapproverid,
        managerid,
        lastlogindate,
        lastpasswordchangedate,
        createddate,
        createdbyid,
        lastmodifieddate,
        lastmodifiedbyid,
        systemmodstamp,
        numberoffailedlogins,
        suaccessexpirationdate,
        suorgadminexpirationdate,
        offlinetrialexpirationdate,
        wirelesstrialexpirationdate,
        offlinepdatrialexpirationdate,
        forecastenabled,
        contactid,
        accountid,
        callcenterid,
        extension,
        federationidentifier,
        aboutme,
        loginlimit,
        profilephotoid,
        digestfrequency,
        defaultgroupnotificationfrequency,
        jigsawimportlimitoverride,
        workspaceid,
        sharingtype,
        chatteradoptionstage,
        chatteradoptionstagemodifieddate,
        bannerphotoid,
        isprofilephotoactive,
        individualid,
        globalidentity

    from source

)

select * from renamed
  );
