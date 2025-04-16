-- 코드를 입력하세요
-- 상반기 아이스크림 총 주문ㅇ량이 3000 초과
-- 주 성분이 과일
-- 아이스크림 맛 조회
-- 총주문량이 큰 순서대로 Desc..
SELECT f.FLAVOR
FROM FIRST_HALF f
JOIN ICECREAM_INFO i ON f.FLAVOR = i.FLAVOR
WHERE f.TOTAL_ORDER > 3000 AND i.INGREDIENT_TYPE = 'fruit_based'
ORDER BY f.TOTAL_ORDER DESC;