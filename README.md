# 한오케이 HanOkay
<div>
<img width="150" src="https://user-images.githubusercontent.com/45909171/90097843-dc94be80-dd71-11ea-8f87-4f5cc70afc82.png">
</div>
한옥 특화 숙박 예약 웹사이트


Korean Traditional Hotel Booking Site


## 프로젝트 소개 Introduction
프로젝트에 대한 간략한 소개와 의의를 설명합니다.

### 프로젝트 이름의 의미 Meaning of HanOkay
'한오케이'는 '한옥 OK(좋다, 괜찮다)'라는 의미를 가지고 있습니다.우리 웹사이트의 이용자들이 모두 좋은 한옥에서 머무르기를 바라는 마음으로 프로젝트 이름을 지었습니다.


'Hanok' is a traditional Korean house. We named this project 'HanOkay' as we wish all of our users have good experience and be okay in Hanok which we offer in our website. 

### 프로젝트의 목적 Why we started this project
독일의 대문호 괴테는 '가장 민족적인 것이 세계적이다'라고 말했습니다. 우리 HanOkay팀도 '가장 한국적인 것이 가장 세계적이다'라는 생각에서 이 프로젝트는 시작되었습니다. 
한국적인 것의 대명사인 한옥 형태의 숙소를 예약할 수 있는 웹사이트를 만듦으로써 아름다운 우리 문화를 알리고자 노력하였습니다.

Since our work place is located in one of the most traditional places in Korea, we were inspired by many traditional elements around. Hanok is that. We found that [Korean Open Data Portal](https://www.data.go.kr/index.do) offers lists of currently available Hanok hotels so we made dummy data with it. 
We also used information of latitude and longitude of hotels for great search exprience. And we used several APIs such as Google Places API, Tour API, OpenWeatherMap API to suggest tourist attractions nearby users' current location. 
This was the story how we started the project.

## 프로젝트 기술 소개 Technology List
프로젝트에 사용된 언어와 기술, ERD와 개발환경 등을 소개합니다.

### 사용언어 Main Languages
- Java 8
- JavaScript ES 6
- HTML5
- CSS3

### ERD
![ERD(20200815)](https://user-images.githubusercontent.com/45909171/90373052-513a6680-e0ac-11ea-9fb9-2ead2b780771.png)

이 프로젝트의 DB는 코드사전을 포함한 22개의 테이블으로 이루어져 있습니다.

This project contains 22tables including Code table

### 특징적 기술 Key Features
* [Google OAuth 2.0](https://developers.google.com/identity/protocols/oauth2/web-server) - 구글 소셜 로그인 / Google social login
* [Google Places API](https://developers.google.com/places/web-service/overview) - 현재 사용자의 위치와 DB에 저장된 숙소의 위치를 구글맵 상에 표시 / gives location where user is and shows information of accomodations in our DB on Google Map
* [TourAPI](http://api.visitkorea.or.kr/main.do) - 현재 사용자 위치 근처의 관광지를 보여줌 / shows tourist attractions nearby
* [OpenWeatherMap API](https://openweathermap.org/api) - 해당 위치의 날씨 데이터를 제공, 이 프로젝트에서는 현재 사용자의 장소와 날씨를 기반으로 주변의 관광지를 추천해주는 기능에 사용 / shows current weather by current location and we used it to recomment nearest tourist attractions depending on current weather and location
* [PayPal API](https://developer.paypal.com/docs/api/overview/), [INI-API](https://manual.inicis.com/iniapi/) - 숙소 예약 시 페이팔 결제, 카드결제를 구현하는 데 사용 / used for payment when user books a room
* [iamport.payment API](https://api.iamport.kr/) - 위의 결제 API를 테스트할 수 있는 API / used to test payment APIs above


### 개발환경 Development Environment
* Eclipse IDE/ Spring Tool Suite 4
* Visual Studio Code
* Apache Tomcat 9
* Oracle 11g


### 팀원 Contributors
* [김미라](https://github.com/mirasoy) Mira Kim  
* [김수희](https://github.com/suhee-developer) Suhee Kim
* [김지원](https://github.com/adndus) Jiwon Kim
* [유경원](https://github.com/ykwon3357) Kyungwon You
* [이소림](https://github.com/musemy4) Sorim Lee
* [허세린](https://github.com/serin9811) Serin Heo


### 라이센스 License
 우리의 프로젝트는 [MIT License](https://github.com/mirasoy/HanOkay/blob/add-license-1/LICENSE)를 따르고 있습니다. 
 
 This software is licensed under the [MIT License](https://github.com/mirasoy/HanOkay/blob/add-license-1/LICENSE) .



## 연락 Contact
해당 프로젝트에 대한 이슈를 생성하고 싶거나 우리 팀원들에게 연락하고 싶다면 아래로 연락해주세요.

If you have a question or any comment, feel free to open an issue or to DM me on us.

* [김미라](https://github.com/mirasoy)
* [김수희](https://github.com/suhee-developer)
* [김지원](https://github.com/adndus)
* [유경원](https://github.com/ykwon3357)
* [이소림](https://github.com/musemy4)
* 허세린 [@serin_Heo](https://twitter.com/serin_Heo) (Twitter)
 
 
