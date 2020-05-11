--1번--
SELECT MEMBER.MEMBER_SEQ, MEMBER.MEMBER_ID, AUTHORITY_MEMBER.AUTHORITY_ID
FROM MEMBER INNER JOIN AUTHORITY_MEMBER 
ON MEMBER.MEMBER_SEQ = AUTHORITY_MEMBER.MEMBER_SEQ 
  INNER JOIN AUTHORITY ON AUTHORITY.AUTHORITY_ID = AUTHORITY_MEMBER.AUTHORITY_ID
  WHERE AUTHORITY.AUTHORITY_ID = 'ROLE_STUDENT' OR AUTHORITY_MEMBER.AUTHORITY_ID = 'ROLE_STUDENT';

--2번--
WITH RECURSIVE TTEMP AS (
    SELECT ORGANIZATION_SEQ, NAME, PARENT_ORGANIZATION_SEQ FROM ORGANIZATION WHERE PARENT_ORGANIZATION_SEQ IS NULL
    UNION ALL 
    SELECT O.ORGANIZATION_SEQ, O.NAME, O.PARENT_ORGANIZATION_SEQ FROM ORGANIZATION O
    INNER JOIN TTEMP ON O.PARENT_ORGANIZATION_SEQ = TTEMP.ORGANIZATION_SEQ
)

SELECT * FROM TTEMP ORDER BY PARENT_ORGANIZATION_SEQ;

--3번--
SELECT MEMBER.MEMBER_ID, ORGANIZATION.NAME, AUTHORITY_MEMBER.AUTHORITY_ID
FROM ORGANIZATION INNER JOIN ORGANIZATION_MEMBER ON ORGANIZATION.ORGANIZATION_SEQ = ORGANIZATION_MEMBER.ORGANIZATION_SEQ
INNER JOIN MEMBER ON MEMBER.MEMBER_SEQ = ORGANIZATION_MEMBER.MEMBER_SEQ
INNER JOIN AUTHORITY_MEMBER ON MEMBER.MEMBER_SEQ = AUTHORITY_MEMBER.MEMBER_SEQ;