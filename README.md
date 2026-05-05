# UMC Starbucks Clone

스타벅스 iOS 앱 클론 코딩 — UMC 8기 누적 클론 코딩 과제 (Week2~Week6).

## 학습 목적
- SwiftUI 복잡한 레이아웃 구성 (탭바, 카드, 메뉴 그리드)
- MVVM 아키텍처 (`ViewModels/` 분리)
- Moya 기반 네트워크 레이어 (Kakao 로컬 검색 / 길찾기)
- SwiftData / @AppStorage (자동 로그인)
- 클린 아키텍처 리팩 (Common/Protocol/APITargetType, Common/Enum/UserRouter)
- 길찾기 기능 (Path/List 모델 + PathViewModel + MapInfoView)

## 주요 화면 / ViewModel
| ViewModel | 화면 |
|-----------|------|
| `LoginViewModel`, `SignupViewModel` | 로그인/회원가입 (자동 로그인 지원) |
| `HomeViewModel` | 홈 (개인화 카드, 추천 메뉴) |
| `ItemViewModel`, `DessertViewModel`, `NewViewModel` | 음료/디저트/신메뉴 |
| `OrderSheetViewModel`, `ReceiptViewModel` | 주문 시트, 영수증 |
| `MapViewModel`, `PathViewModel` | 매장 지도 / 길찾기 |
| `OtherViewModel`, `RouterViewModel` | Other 탭, 화면 라우팅 |

## 진행 흐름 (커밋 기반)
```
Week2 → Week2_리뷰 → Week3 → Week5 → Week6
→ 데이터 모델링 개선 → ViewModel 리팩 → 클린아키텍처 리팩
```

## 빌드 & 실행
```bash
git clone https://github.com/GthingkingG/UMC_Starbucks.git
open UMC_Starbucks/UMC_Starbucks.xcodeproj
```
Xcode에서 ⌘R.

## 인덱스
[Learning-Archive](https://github.com/GthingkingG/Learning-Archive) 대시보드의 `[클론]` 카테고리 (UMC 8기 누적 클론).
