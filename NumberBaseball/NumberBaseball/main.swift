import Foundation

enum InputError {
    //메뉴 잘못 선택
    case invalidMenuNumber
    //숫자 범위를 벗어난 경우
    case invalidRange
    //숫자 갯수가 잘못된 경우
    case incorrectNumberCount
    //숫자가 아닌 값
    case invalidValue
}
var randomNumbers: [Int] = [] // 임의의 정수 3개를 담아둘 변수
var remainder: Int = 9 // 남은 시도횟수를 담아둘 변수 - 초기 값 : 9

func makeRandomNumber() -> [Int] { // 1~9 사이의 세개의 임의의 정수를 생성하여 반환하는 함수 - 생성된 세개의 정수는 중복된 수가 없어야 된다.
    return [0, 0, 0]
}

func gameResult(of numbers: [Int]) -> [Int] { //임의의 수와 비교하여 볼과 스트라이크 결과를 반환하는 함수
    return [3, 3]
}

func inputNumber() -> [Int] {
    return [0, 0, 0]
}

func startGame() { //이번 스텝에서는 아직 사용자 입력 없이 임의의 수를 생성하여 게임을 진행하도록 구현
    
}
