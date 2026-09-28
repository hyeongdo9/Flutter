void main() {
  print('기본 데이터 타입');
  // 정수형(Java의 int, long)
  int age = 25;
  // 실수형(Java의 float, double)
  double height = 175.5;
  // num은 int, double의 부모타입으로 정수/실수 모두 선언 가능 
  num score1 = 100;
  num score2 = 98.5;
  // 불리언
  bool islogin = true;
  // 문자열(" 혹은 ' 둘다 가능하지만, 싱글쿼테이션을 권장함)
  String appTitle = 'My Flutter App';
  // 문자열과 변수를 혼용할때는 $를 이용해서 작성 가능
  print('나이: $age, 키: $height, 로그인상태: $islogin');
  print('num정수: $score1, num실수: $score2, 앱 제목: $appTitle');


  print('\n문자열 보간법');
  String name = '카리나';
  int price = 4500;
  /*
  문자열 내부에 변수를 삽입할때는 $변수명, 식을 삽입할때는 ${식}을
  사용한다. 자바처럼 +로 연결하지 않고 직관적으로 표현한다. */
  print('주문자: $name');
  print('단가: $price');
  print('총 결제금액: ${price * 3}원');

  
  print('\n타입 추론 (var) vs 동적 타입 (dynamic)');
  /**
  var : 컴파일 시점에 초기값을 보고 타입을 자동으로 결정(추론)한다.
    한번 타입이 결정되면 다른 타입의 값을 대입할 수 없다. */
  var autoName = '윈터'; //String으로 추론
  // autoName = 123; //에러
  autoName = '지젤'; // 동일한 타입으로 새 값은 대입 가능
  print('var 변수 값: $autoName (타입: ${autoName.runtimeType})');
  
  /**
  dynamic : 모든 타입을 허용하며, 실행중에 타입을 자유롭게 변경할 수 있다.
    자바의 Object와 유사하지만, 메서드 호출 시 타입검사를 건너뛰게 되므로
    실행시 런타임 오류가 발생할 가능성이 있다.
   */
  dynamic dynamicVal = '처음엔 문자열';
  print('dynamic: $dynamicVal (${dynamicVal.runtimeType})');
  dynamicVal = 9;
  print('dynamic: $dynamicVal (${dynamicVal.runtimeType})');

  /**
  flutter에서는 dynamic 타입의 안정성이 떨어지므로 REST APT응답(Json)
  등 특수한 경우가 아니면 사용을 지양하는것이 좋다. */
  print(autoName.toUpperCase()); // 정상실행
  // print(price.toUpperCase()); // 컴파일 에러(찾기 쉬움)
  // print(dynamicVal.toUpperCase()); // 런타임 에러(찾기 어려움)


  print('\n상수 : final vs const');
  /**
  상수는 '한번 값이 결정되면 바꿀 수 없다.'라는 공통점이 있다.
  final : 런타임(앱 실행)에 값이 결정되는 상수
    ex) 현재시간, API응답값, 위젯 파라미터 등
  const : 컴파일(빌드) 시점에 이미 값이 고정되는 상수
    ex) 고정마진, 고정텍스트 등  */
  // 실행할때의 현재 시간이 대입됨(정상동작)
  final DateTime now = DateTime.now();
  // 컴파일 시점에는 현재시간을 알 수 없음
  // const DateTime compileNow = DateTime.now(); // 에러
  const double appPadding = 16.0;
  print('final 현재 시간: $now');
  print('const 앱 기본 패딩: $appPadding');
}