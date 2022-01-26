USE best_products;
show tables;

# 판매자별 items 갯수를 세고 20개 이상인 값들만 불러오기
SELECT provider, COUNT(*) FROM items GROUP BY provider HAVING COUNT(*) >=20 ORDER BY COUNT(*) DESC;

# 메인 카테고리가 ALL 인 items 를 가져오기
SELECT * FROM items INNER JOIN ranking ON items.item_code = ranking.item_code WHERE ranking.main_category = 'ALL';
# 테이블 이름이 긴 경우 약어를 이용할 수 있다.
# 이 경우 반드시 약어를 사용해야한다. 약어를 지정하고 사용하지 않을 경우 오류가 발생한다.
SELECT * FROM items i INNER JOIN ranking r ON i.item_code = r.item_code WHERE r.main_category = 'ALL';

# 전체 베스트상품에서 판매자별 베스트 상품 갯수 출력하기
SELECT i.provider, COUNT(*) FROM items i INNER JOIN ranking r ON i.item_code = r.item_code WHERE r.main_category = 'ALL' GROUP BY  i.provider ORDER BY COUNT(*) DESC;