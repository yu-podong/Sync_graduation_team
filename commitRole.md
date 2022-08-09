# 1️⃣ Commit 규칙
해당 프로젝트에서는 크게 `Create`, `Add`, `Modify`, `Delete`라는 핵심어를 포함하여, 커밋 메세지를 사용한다. 메세지를 작성할 때는 필히 영어를 사용하고, 
최대한 간결한 형태로 작성한다. (서술하는 형식 X)

커밋 메세지의 형태는 `핵심어: 관련내용`이고, 핵심어, 콜론, 관련내용 사이의 공백유무는 가능하면 지킬 것을 요청한다.<br/>

위의 핵심어를 이용한 커밋 메세지 작성방법은 다음과 같다.<br/><br/>

### 1. Create
새로운 파일, 폴더를 생성했을 때 사용한다. (Add와 다른 개념이니 혼동하지 말 것)<br/>
관련내용에는 생성한 1개 이상의 __파일/폴더 이름+확장자를 정확하게__ 작성한다.

`Create: 생성한 파일/폴더 이름`
<br/><br/>

**[ 예시 ]**
아래의 사진처럼 새로운 파일인 'newClass.dart'를 생성한 상황이면,
![스크린샷 2022-08-09 오후 4 48 38](https://user-images.githubusercontent.com/62629742/183594453-82def7cd-9277-4d76-9213-3ee7be567dda.png)<br/>
`Create: newClass.dart` 이라고 작성한 후, 커밋한다.
<br/> <br/>

### 2. Add
어느 resource, 파일 내의 새로운 component/function/comment 등 새로운 것이 추가되었을 때 사용한다.<br/>
관련내용에는 추가된 것에 대한 이름을 작성한다.

`Add: 추가된 것에 대한 이름`
<br/><br/>

**[ 예시1 ]**
아래의 사진처럼 기존의 파일에서 새로운 함수가 추가한 상황이면,
![스크린샷 2022-08-09 오후 4 57 01](https://user-images.githubusercontent.com/62629742/183596252-a71bd22b-1eeb-446f-b982-38ebc139086d.png)<br/>
`Add: _focus function` 이라고 작성한 후, 커밋한다.<br/><br/>

**[ 예시2 ]**
아래의 사진처럼 새로운 component(s)를 추가한 상황이면,
![스크린샷 2022-08-09 오후 5 01 53](https://user-images.githubusercontent.com/62629742/183597100-849c1832-5468-42d9-babb-db66f336e0f7.png)<br/>
`Add: three menu elevatedButton` 이라고 작성한 후, 커밋한다.<br/><br/>

**[ 예시3 ]**
구현 중, 특정 파일에서 주석을 작성한 상태라면, 작성한 주석의 핵심내용을 작성한다.<br/>
팀원을 위해, 함수 알고리즘 설명과 컴포넌트를 구분하는 주석을 추가했다면,<br/>
`Add: funcName algorithm description & component distinction comment` 이라고 작성한 후, 커밋한다.
<br/><br/>

### 3. Modify
기존에 존재했던 내용 중, 일부를 수정하였을 때 사용한다. 수정이라는 건, 주석 수정/컴포넌트 구조 변경/함수 알고리즘 변경/UI 속성 변경 등을 의미한다.<br/>
관련내용에는 어떤 것의 무엇을 수정하였는지 작성한다.

`Modify: 수정사항 및 수정내용`
<br/><br/>

**[ 예시1 ]**
아래의 사진처럼 특정 컴포넌트의 클릭 시, 색이 바뀌는 기능을 적용한 상황이라면,
![스크린샷 2022-08-09 오후 6 02 47](https://user-images.githubusercontent.com/62629742/183609607-68831779-48ad-4f27-ae39-a1192f366bcf.png)<br/>
`Modify: icon & font size of host list items` 이라고 작성한 후, 커밋한다.
<br/><br/>

**[ 예시2 ]**
아래의 사진처럼 '다음' 버튼의 위치가 바뀐 상황이면,

![스크린샷 2022-08-09 오후 6 07 16](https://user-images.githubusercontent.com/62629742/183614154-a58c9025-e23b-4d4e-aa0b-2a884ad07ceb.png)<br/>

`Modify: position of next button` 이라고 작성하 후, 커밋한다.
<br/><br/>

### 4. Change
기존에 존재하던 파일/폴더/resource 중, 이름이 변경되었을 때 사용한다.<br/>
관련내용에는 '기존 이름 -> 바뀐 이름'으로 작성한다.

`Change: old fileName -> new fileName`
<br/><br/>

### 5. Delete
기존에 존재하던 파일/폴더/resource/함수/컴포넌트 삭제할 때 사용한다.<br/>
관련내용에는 1개 이상의 삭제된 것의 __정확한 이름+확장자를 정확하게__ 작성한다.

`Delete: 삭제된 것의 이름`
<br/><br/>

**[ 예시 ]**
아래의 사진처럼 'newClass.dart'를 삭제한 상황이면,
![스크린샷 2022-08-09 오후 6 20 25](https://user-images.githubusercontent.com/62629742/183613408-d75b1b98-f452-459d-96ce-c88dbfa3760e.png)<br/>
`Delete: newClass.dart` 이라고 작성한 후, 커밋한다.

