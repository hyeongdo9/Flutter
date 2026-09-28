/**
Null safety(널 안전성)
  : 모바일 앱에서 가장 흔한 오류인 NullPointerException을 컴파일 단계에서
  원천 차단한다. 만약 구동중에 이 오류가 발생된다면 '앱 튕김(Crach)' 현상이
  발생되어 앱이 종료된다. */
void main() {
  print('Non-nullable vs Nullable (?)');
  // 기본적으로 Dart의 모든 변수는 null을 가질 수 없는 Non-nullable이다.
  String nonNullStr = '홍길동';
  // 따라서 null값은 대입할 수 없다.
  // nonNullStr = null; // 에러

  // 타입뒤에 물음표(?)를 붙이면 null값을 가질 수 있는 변수로 선언된다.
  String? nullableStr = '이순신';
  nullableStr = null; // 정상실행
  print('Non-nullable : $nonNullStr');
  print('Nullable : $nullableStr');


  print('\n null-aware 접근 연산자 (?.)');
  /**
  객체가 null일때 메서드나 프로퍼티(속성) 등을 사용하면 Crash가 발생된다.
  '?.'을 사용하면 객체가 null이 아닐때만 실행되고, null이면 에러없이 null을 
  반환한다. */
  String? userNickName; // 현재 null인 상태
  //컴파일러가 위험을 감지하고 차단함
  // int length = userNickName.length; // 컴파일 에러
  // 대입된 값이 없는 상태이므로 null이 출력된다.
  int? safeLength = userNickName?.length;
  print('안전한 접근 : $safeLength');

  //값을 대입했을때는 정상적으로 동작한다.
  userNickName = 'FlutterMaster';
  print('값이 있을 때 길이 접근 : ${userNickName?.length}');


  print('\n null 병합 연산자 (??) : 기본값 지정');
  /**
  좌측항이 null이면 우측항의 기본값을 채택한다. 즉 bio가 null이므로
  우측의 소개글이 대입된다. */
  String? bio;
  String displayBio = bio ?? '작성된 자기소개가 없습니다.';
  print('소개글1 : $displayBio');

  bio = '모바일 앱 개발자 지망생입니다!';
  displayBio = bio ?? '작성된 자기소개가 없습니다.';
  print('소개글2 : $displayBio');


  print('\n null 대입 연산자 (??=)');
  /**
  변수 값이 null인 경우에만 우측의 값을 할당한다. 만약 이미 값이 있다면
  변경하지 않는다. */
  String? currentTheme;
  // 초기에는 null이므로 '라이트'가 할당된다.
  currentTheme ??= '라이트 모드';
  print('적용테마 : $currentTheme');
  //이미 '라이트'가 할당되었으므로 '다크'는 무시된다.
  currentTheme ??= '다크 모드';
  print('다시 대입 시도 후 테마 : $currentTheme');


  print('\n null 강제 단언 연산자 (!) : 주의해서 사용');
  /**
  개발자가 '이 변수는 확실하게 null이 아니라고 컴파일러에게 장담한다'라고
  선언하는 연산자. 만약 실행 시점에 null이므로 바로 런타임에러가 발생되므로
  제한적으로 사용해야한다.
   */
  int? optionalScore = 100;
  //null이 아니므로 Non-nullable로 변환
  int confirmedScore = optionalScore!;
  print('확정 점수 : $confirmedScore');

  // optionalScore = null;
  // int crashScore = optionalScore!; // 런타임 에러

  print('\n 지연 초기화 (late)');
  /**
  선언할때는 값을 넣지 않지만, '실제 사용전에는 무조건 초기화할 것이다.'라고
  약속하는 키워드. Flutter의 StatefulWidget에서 컨트롤러 초기화 싯 거의
  항상 등장한다. */
  late String serverConfig;
  // print('late출력1 : $serverConfig'); // 에러
  // 필요한 시점에 초기화 수행
  serverConfig = 'https//api.myflutter.com/v1';
  print('late출력2 : $serverConfig');
}