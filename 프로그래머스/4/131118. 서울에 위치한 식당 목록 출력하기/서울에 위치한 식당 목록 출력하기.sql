-- 코드를 입력하세요
-- 서울에 위치한
-- 식당 Id, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수
-- 리뷰 평균점수 : 소수점 3번째 자리에서 반올림
-- 평균점수 기준으로 내림차순, 즐겨찾기수 기준으로 내림차순 정렬

SELECT 
  i.REST_ID, 
  i.REST_NAME, 
  i.FOOD_TYPE, 
  i.FAVORITES, 
  i.ADDRESS, 
  ROUND(AVG(r.REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO i
JOIN REST_REVIEW r ON i.REST_ID = r.REST_ID
WHERE i.ADDRESS LIKE '서울%'
GROUP BY i.REST_ID
ORDER BY SCORE DESC, i.FAVORITES DESC;