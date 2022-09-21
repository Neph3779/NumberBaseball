**프로젝트명: 숫자야구 게임**

**프로젝트 설명: **유저의 입력을 console을 통해 받아 컴퓨터와 숫자야구 게임을 진행하는 프로그램

**진행기간: 2021/02/23 ~ 2021/02/26 (약 1주)**

## 주요 학습 내용

- Enum을 통한 Error case 관리
- 각 기능의 메서드화
- map, split 등의 고차함수들에 대한 이해
- 주요 로직에 대한 플로우차트 작성

**숫자야구 게임 로직 플로우차트**

<img src="https://raw.githubusercontent.com/Neph3779/Blog-Image/forUpload/img/20220921130413.png" alt="숫자야구게임.drawio" style="zoom: 67%;" />



## 주요 피드백과 개선내역

**Step1 PR 링크:** https://github.com/yagom-academy/ios-number-baseball/pull/7

**Step2 PR 링크:** https://github.com/yagom-academy/ios-number-baseball/pull/13

> 피드백 1: 제 생각엔 1개의 for문으로 judge 기능을 구현할 수 있을 것 같은데, 어떤 방법이 있을까요? 🤔

```swift
outer: for i in 1...3{
	inner: for j in 1...3{
		if userInput[i] == answer[i] {
		strikeCount += 1
		break inner
		}
	else if userInput[i] == answer[j] {
		ballCount += 1
		}
	}
}
```

기존의 코드에서는 이중 반복문을 통해 배열내의 값이 존재하는지를 확인했었다.

1중 for문으로 고칠 수 있을 것 같다는 피드백을 받고 `contains()` 메서드에 대해 학습하여 아래와 같은 코드로 수정되었다.

```swift
for i in 1...3 {
    if userInput[i] == answer[i] {
        strikeCount += 1
    } else if answer.contains(userInput[i]) {
        ballCount += 1
    }
}
```



> 피드백 2: try 문 이외의 많은 문장이 do block 내부에 있어서, 어떤 문장을 위한 오류처리인지를 파악하기가 다소 어려울 수도 있을 것 같아요. (코드의 깊이가 깊어지기도 합니다.) 어떻게 수정할 수 있을까요? 🤔

```swift
do {
    let userInput = try getUserInput()
    let result = judge(of: userInput)
    remainingChallengeOpportunity -= 1

    if result.strikeCount == 3 {
        print("사용자 승리!")
    }
    else if remainingChallengeOpportunity == 0 {
        print("컴퓨터 승리...!")
    }

    print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")

    print("남은 기회 : \(remainingChallengeOpportunity)")

    if remainingChallengeOpportunity == 0 || result.strikeCount == 3 {
        return
    }
}
catch {
    print("입력이 잘못되었습니다.")
}
```

기존의 코드에서는 erorr throwing이 발생할 수 있지 않은 부분까지도 do-catch 블록에서 처리해줬었다.

이로 인해 가독성이 저하되고 어떤 오류를 처리하려는 것인지 의도가 불명확해졌기에 아래의 코드로 수정을 진행했다.

```swift
do {
    userInput = try getUserInput()
}
catch {
    print("입력이 잘못되었습니다.")
    continue
}

let result = judge(of: userInput)
remainingChallengeOpportunity -= 1

print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")

print("남은 기회 : \(remainingChallengeOpportunity)")

if result.strikeCount == 3 {
    print("사용자 승리!")
} else if remainingChallengeOpportunity == 0 {
    print("컴퓨터 승리...!")
}
```



## 프로젝트를 진행하며 느낀점

규모는 작지만 처음으로 진행해본 팀 프로젝트였던 것에 큰 의미가 있었다.

Github에서의 협업도 처음이었기에 처음엔 모르는 것이 많았지만 팀원인 Kane과 같이 공부하며 진행했다.

코드를 짤 때에는 페어프로그래밍으로 활발하게 의견교류를 진행했기에  더 나은 코드에 대해 깊이 고민해볼 수 있었다.

리뷰어인 Bam의 피드백을 받으며 개선할 여지가 있는 부분은 개선이 이루어졌고, 더 나은 코드에 대해서 리뷰어와도 토론을 할 수 있는 좋은 기회였다.
