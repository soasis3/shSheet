# shSheet

`shSheet.html` 기반의 단일 파일 악보 작성 앱입니다.

GitHub 저장소에 올린 뒤 GitHub Pages를 켜면 별도 서버 없이 웹처럼 열어서 사용할 수 있습니다.

## 파일 구성

- `shSheet.html`: 실제 앱 본체
- `index.html`: GitHub Pages 진입용 파일

## GitHub Pages로 배포하기

1. GitHub에서 새 저장소를 만듭니다.
2. 이 폴더 파일들을 저장소 루트에 업로드합니다.
3. GitHub 저장소의 `Settings > Pages`로 이동합니다.
4. `Build and deployment`에서 `Deploy from a branch`를 선택합니다.
5. 브랜치는 `main`, 폴더는 `/ (root)`를 선택하고 저장합니다.
6. 잠시 후 `https://사용자이름.github.io/저장소이름/` 주소로 접속합니다.

## 수정 방법

- `shSheet.html`만 수정해도 실제 앱 변경이 반영됩니다.
- GitHub 웹 편집기에서 바로 수정하거나, 로컬에서 수정 후 다시 푸시해도 됩니다.

## 참고

- 현재 앱은 `VexFlow`를 `unpkg` CDN에서 불러오고 있습니다.
- 인터넷 연결이 가능한 환경이면 GitHub Pages에서 그대로 동작할 가능성이 높습니다.
