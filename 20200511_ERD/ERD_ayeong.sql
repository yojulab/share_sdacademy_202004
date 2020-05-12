--AUTHORITY_MEMBER 권한이 'ROLE_STUDENT’을 가진 목록
SELECT MEMBER.MEMBER_SEQ, MEMBER_ID, NAME FROM MEMBER INNER JOIN (
    SELECT AUTHORITY_MEMBER.MEMBER_SEQ, AUTHORITY_MEMBER.AUTHORITY_ID FROM AUTHORITY_MEMBER INNER JOIN AUTHORITY
    ON AUTHORITY.AUTHORITY_ID = AUTHORITY_MEMBER.AUTHORITY_ID and AUTHORITY.AUTHORITY_ID ='ROLE_STUDENT') role
ON role.MEMBER_SEQ = MEMBER.MEMBER_SEQ


--'강의/강연 신' 조직 구조 확인 : ORGANIZATION
WITH RECURSIVE tmp1 AS (
    SELECT ORGANIZATION_SEQ, NAME, TYPE, PARENT_ORGANIZATION_SEQ, 1 AS LEVEL
    FROM ORGANIZATION WHERE ORGANIZATION_SEQ ='UUID-ORGANIZATION-YOJULAB'
    UNION ALL
    SELECT o.ORGANIZATION_SEQ, o.NAME, o.TYPE, o.PARENT_ORGANIZATION_SEQ, t.LEVEL+1 AS LEVEL
    FROM tmp1 t JOIN ORGANIZATION o
    ON t.ORGANIZATION_SEQ = o.PARENT_ORGANIZATION_SEQ
)
SELECT ORGANIZATION_SEQ, NAME, TYPE, PARENT_ORGANIZATION_SEQ, LEVEL
FROM tmp1
ORDER BY level;