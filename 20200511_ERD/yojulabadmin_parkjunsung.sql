-- yojulab 소속
SELECT  M.`NAME` AS M_NAME, MEMBER_ID, PHONE_NUMBER, REGISTRY_DATE , B.AUTH_NAME, B.AUTHORITY_ID, O.ORG_NAME
FROM MEMBER AS M
LEFT OUTER JOIN(
    SELECT * FROM AUTHORITY_MEMBER 
    LEFT OUTER JOIN (
        SELECT AUTHORITY_ID AS AUTH, NAME AS AUTH_NAME FROM AUTHORITY
        ) AS AU
    ON AUTHORITY_MEMBER.AUTHORITY_ID = AU.AUTH
    ) AS B
ON M.`MEMBER_SEQ` = B.`MEMBER_SEQ`
LEFT OUTER JOIN(
    SELECT ORGM.MEMBER_SEQ AS MEM_SEQ, ORG.ORG_NAME FROM ORGANIZATION_MEMBER AS ORGM
    LEFT OUTER JOIN(
        SELECT ORGANIZATION_SEQ AS ORG_SEQ, NAME AS ORG_NAME FROM ORGANIZATION) AS ORG
    ON ORGM.ORGANIZATION_SEQ = ORG.ORG_SEQ
    ) AS O
ON M.MEMBER_SEQ = O.MEM_SEQ
WHERE M.`NAME` = 'yojulab Admin';