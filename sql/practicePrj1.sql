CREATE DATABASE prj2;

use prj2;

# id : 게시물 순서
# title : 제목, content : 내용
# writer: 작성자 이름, member_id : 작성자 id
# inserted: 게시물 작성 시간
CREATE TABLE board
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    title     VARCHAR(1000) NOT NULL,
    content   VARCHAR(3000) NOT NULL,
    writer    VARCHAR(100)  NOT NULL,
    member_id INT           NOT NULL,
    inserted  DATETIME      NOT NULL DEFAULT NOW()
);

desc board;
SELECT *
FROM board;

drop table board;

CREATE TABLE member
(
    id       INT          NOT NULL PRIMARY KEY,
    writer   VARCHAR(100) NOT NULL,
    email    VARCHAR(200) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    inserted DATETIME     NOT NULL DEFAULT NOW()
);

ALTER TABLE board
    MODIFY member_id INT NOT NULL;
SELECT *
FROM member;

ALTER TABLE board
    DROP INDEX member_id;


desc member;

INSERT INTO board
SELECT *
FROM board;

INSERT INTO member (writer, email, password)
VALUES ('choi', '66@66', '66');

ALTER TABLE member
    MODIFY id INT AUTO_INCREMENT;

DROP index member_id ON board;

desc board;

# board 테이블의 unique 제약사항 없애기 : 1. 외래키 제약조건 제거 2. 인텍스 제거
ALTER TABLE board
    MODIFY COLUMN member_id INT NOT NULL;

SHOW INDEX FROM board;

DROP INDEX member_id_2 ON board;

SHOW CREATE TABLE board;

ALTER TABLE board
    DROP FOREIGN KEY fk_board_member;

ALTER TABLE board
    ADD FOREIGN KEY (member_id) REFERENCES member (id);

ALTER TABLE board
    DROP COLUMN writer;

SELECT b.id, b.title, b.content, b.inserted, m.writer
FROM board b
         JOIN member m ON b.member_id = m.id
WHERE b.id = 23;

SELECT b.id, b.title, m.writer
FROM board b
         JOIN member m ON b.member_id = m.id;