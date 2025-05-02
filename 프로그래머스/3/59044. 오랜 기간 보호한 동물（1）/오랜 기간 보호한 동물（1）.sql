-- 코드를 입력하세요
-- 입양을 못간 애 중
-- 가장 오래 보호소 있던 애 3마리. 이름, 보호 시작일
-- 보호 시작일 오름차순
SELECT NAME, DATETIME
FROM ANIMAL_INS
WHERE ANIMAL_ID NOT IN (
    SELECT ANIMAL_ID
    FROM ANIMAL_OUTS
    WHERE DATETIME <= NOW()
)
ORDER BY DATETIME ASC
LIMIT 3;