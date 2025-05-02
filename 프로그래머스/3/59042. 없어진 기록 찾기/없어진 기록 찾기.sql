-- 코드를 입력하세요
-- 입양을 간 기록 있는데
-- 보호소에 들어온 기록이 없는 동물의 ID, 이름
-- ID 오름차순
SELECT o.ANIMAL_ID, o.NAME
FROM ANIMAL_OUTS o LEFT JOIN ANIMAL_INS i
ON o.ANIMAL_ID = i.ANIMAL_ID
WHERE i.ANIMAL_ID IS NULL
ORDER BY o.ANIMAL_ID ASC;