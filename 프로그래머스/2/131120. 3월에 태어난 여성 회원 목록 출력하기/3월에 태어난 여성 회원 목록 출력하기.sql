-- 코드를 입력하세요
-- 3월 생일
-- 여성 회원
-- id, 이름, 성별, 생년월일
-- 전번 null 제외
-- id asc
SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS 'DATE_OF_BIRTH' 
FROM MEMBER_PROFILE
WHERE GENDER = 'W' AND TLNO is NOT NULL AND DATE_OF_BIRTH LIKE '%-03-%'