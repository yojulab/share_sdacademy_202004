-- SQLite

CREATE TABLE FINAL_TABLE AS SELECT STORE_ID, PROVINCE_NAME, STORE_NAME, OWNER, AMOUNT_OF_PERSONELL, MENU_TYPE, PATICIPATION, DONATION_AMOUNT
FROM GOOD_STORE
INNER JOIN BENEFIT_PERSONELL ON GOOD_STORE.PERSONELL_ID = BENEFIT_PERSONELL.PERSONELL_ID
INNER JOIN BENEFIT_MENU ON GOOD_STORE.MENTYPE_ID = BENEFIT_MENU.MENTYPE_ID
INNER JOIN DONATION_GENERAL ON GOOD_STORE.PARTICIPATE_ID = DONATION_GENERAL.PARTICIPATE_ID
INNER JOIN LOCATION ON GOOD_STORE.PROVINCE_ID = LOCATION.PROVINCE_ID
INNER JOIN OPERATING_TIME ON GOOD_STORE.OPR_TIME = OPERATING_TIME.OPR_TIME
INNER JOIN ROUTINAL_DONATION ON GOOD_STORE.DONATION_ID = ROUTINAL_DONATION.DONATION_ID;