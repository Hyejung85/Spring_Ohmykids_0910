# Oh My Kids

### 프로젝트 설명
 Oh My Kids는 선생님과 학부모를 위한 알림장 서비스 입니다.
 회원인 학부모가 등록한 자녀의 정보를 기반으로 알림장, 앨범 기능을 사용합니다. 
 자녀가 유치원 또는 학교에서 있었던 일상을 선생님이 기록하여 학부모에게 공유하거나, 학부모도 가정에서의 일상이나 선생님에게 전달하고자 하는 사항을 기록하여 선생님에게 공유합니다. 
 앨범은 여러장의 사진을 업로드 할 수 있어, 기억하고 싶은 순간들을 선생님이 기록할 수 있습니다. 댓글과 좋아요 기능을 통해 선생님과 학부모, 학부모와 학부모간 소통할 수 있습니다.
 
### 포트폴리오
 - 링크
 
### 설계
 - UI 기획
   - https://ovenapp.io/view/mZNgsrg24csVHNe3ndHFfL81OyD1gXY9/
 - DATABASE, URL, 일정 설계
   - https://docs.google.com/spreadsheets/d/1z8f9ZyO0LSCn-z2H99dGCfr5K2KENqdp3SzF3EH1OX0/edit?usp=sharing 
 
### 주요기능
 - 회원가입
   - package : [com.yeye.ohmykids.user.*] (https://https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/user)
   - view : [/webapp/WEB-INF/jsp/user/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/user)
 - 로그인
   - package : [com.yeye.ohmykids.user.*] (https://https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/user)
   - view :  [/webapp/WEB-INF/jsp/user/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/user)
 - 자녀정보 등록 및 관리
   - package : [com.yeye.ohmykids.kidsinfo.*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/kidsinfo)
   - view :  [/webapp/WEB-INF/jsp/user/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/user)
 - 알림장
   - package : [com.yeye.ohmykids.note.*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/note)
   - view :  [/webapp/WEB-INF/jsp/note/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/note)
 - 앨범
   - package : [com.yeye.ohmykids.album.*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/album)
   - view :  [/webapp/WEB-INF/jsp/album/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/album)
 - 댓글
   - package : [com.yeye.ohmykids.comment.*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/comment)
   - view : [/webapp/WEB-INF/jsp/note/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/note)
 - 좋아요
   - package : [com.yeye.ohmykids.like.*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/java/com/yeye/ohmykids/like)
   - view : [/webapp/WEB-INF/jsp/album/*] (https://github.com/Hyejung85/Ohmykids_0910/tree/develope/src/main/webapp/WEB-INF/jsp/album)

### 데모
  - Youtub 만들기

### 외부 라이브러리 라이센스
 - Tomcat [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) 
 - Mysql [GPLv2 or proprietary](https://www.gnu.org/licenses/gpl-3.0.html)
 - Spring framework [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)  
 - Mybatis [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
 - Bootstrap [MIT License](https://opensource.org/licenses/MIT)
 - jQuery [MIT License](https://opensource.org/licenses/MIT)
 - 이미지 출처 : [pixabay](https://pixabay.com/ko/)
 
 ### 향후 계획
  - 선생님을 위한 반관리기능 추가
  - 학생을 다중 선택하여 알림장, 앨범 작성 기능 추가
  - 공지사항 기능 추가
  - 연간일정 기능 추가(자녀 생일정보 활용)
  - 자녀, 학생 셀렉트 박스를 사용해서 알림장, 앨범 목록 필터링 기능
