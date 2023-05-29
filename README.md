# Spring-LmsProject
SpringBoot+jsp+JPA_LearningManagementSystem

## ✏️ Project 소개
여러 교육기관에서 활용할 수 있는 동영상 기반 온라인 학습 웹서비스 입니다.

## 🕰️ 개발기간
2022.11.03 ~ 2022.11.07

## ⚙️ 개발환경
- Windows 10
- MacOS
- Eclipse IDE
- sqldeveloper

## 💻 기술스택
- Java
- Springboot 
- jsp
- Oracle
- JavaScript
- JQuery
- HTML5
- CSS3

## 🔗 ERD
https://www.erdcloud.com/d/9jfDEqhDmWHKpHT2w

## 프로젝트 팀원 역할 분담
|**이름**|**담당 업무**|
|-------|--------|
|박지환|팀장/홈화면 및 학습목록|
|신현명|로그인 및 회원가입 기능|
|이소영|전체 관리자 페이지|
|현주성|학생 동영상 학습 페이지|

## 🎓 주요 기능
### Student
회원가입 및 로그인
- ID 중복 확인
- PWD 일치여부 확인

학생 학습 목록
- 수준별 접근 제한

학생 학습 강의
- 히스토리 자동 저장
- 동영상 완전 시청해야 다음 단계 수학 가능
- 주관식 퀴즈 풀기
----------------------------------------------
### Admin
채점 목록
- 미로그인시 접근불가, 관리자 로그인 페이지로 이동
- Pagination, 계층화로 미채점된 과제 우선 확인 가능

관리자 채점
- 합격, 불합격 처리
- 불합격시 피드백 작성
