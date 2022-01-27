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
SELECT i.provider, COUNT(*) FROM items i INNER JOIN ranking r ON i.item_code = r.item_code 
WHERE r.main_category = 'ALL' GROUP BY  i.provider ORDER BY COUNT(*) DESC;

# 메인 카테고리가 패션의류인 베스트 상품에서 판매자별 베스트 상품 갯수가 5이상인 판매자와 베스트 상품 갯수 출력
SELECT i.provider, COUNT(*) FROM items i INNER JOIN ranking r ON i.item_code = r.item_code 
WHERE r.main_category = '패션의류' GROUP BY  i.provider HAVING COUNT(*) > 5 ORDER BY COUNT(*) DESC;

# 메인 카테고리가 신발/잡화인 베스트 상품의 평균,최대,최소 가격 출력
SELECT MAX(i.dis_price) as max_price, MIN(i.dis_price) as min_price, AVG(i.dis_price) as avg_price 
FROM items i INNER JOIN ranking r ON i.item_code = r.item_code WHERE r.main_category = '신발/잡화';

# 서브쿼리를 이용하여 데이터베이스 출력
# 메인 카테고리별로 할인 가격이 10만원 이상인 상품이 몇개 있는지를 출력
SELECT main_category, COUNT(*) FROM ranking WHERE item_code in (SELECT item_code FROM items WHERE dis_price >= 100000) GROUP BY main_category ORDER BY COUNT(*) DESC;

# 메인 카테고리, 서브 카테고리에 대해 평균할인가격과 평균할인율을 출력
SELECT r.main_category as main_cat ,r.sub_category as sub_cat ,AVG(i.dis_price) as avg_price, AVG(i.dis_percent) as avg_percent 
FROM items i INNER JOIN ranking r ON i.item_code = r.item_code GROUP BY r.main_category, r.sub_category;


# 판매자별 베스트상품 갯수, 평균 할인가격, 평균 할인율을 베스트 상품 갯수가 높은 순으로 출력
SELECT i.provider, COUNT(*), AVG(i.dis_price) as avg_price, AVG(i.dis_percent) as avg_percent
FROM items i INNER JOIN ranking r ON i.item_code = r.item_code GROUP BY i.provider ORDER BY COUNT(*) DESC;


#각 메인 카테고리에서 베스트 상품 갯수가 20개 이상인 판매자의 판매자별 평균할인가격, 평균할인율, 베스트 상품 갯수 출력
SELECT r.main_category as main_cat , i.provider, COUNT(*), AVG(i.dis_price) as avg_price, AVG(i.dis_percent) as avg_percent
FROM items i INNER JOIN ranking r ON i.item_code = r.item_code GROUP BY r.main_category , i.provider HAVING COUNT(*) >= 20 ORDER BY COUNT(*) DESC;



