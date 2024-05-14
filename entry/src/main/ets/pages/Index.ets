import router from '@ohos.router';
PersistentStorage.PersistProp('highScore', 0);

@Entry
@Component
struct Index {
  @State gameList: number[] = [1, 2, 3]
  @State gameGoal: number[] = [2, 2]
  @StorageLink('highScore') highScore: number = 0

  isWin() {
    return this.gameGoal.toString() == this.gameList.toString()
  }

  newGame() {
  }

  quitGame() {
  }

  build() {
    Row() {
      Column() {
        Text(this.isWin() ? 'Win!' : 'Win?')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.isWin() ? Color.Orange : Color.Black)
        Text('Goal:')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Orange)
        Text(this.gameGoal.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Orange)
        Text(this.gameList.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        if (!this.isWin()) {
          Row() {
            Button('Push')
              .onClick(
                () => {
                  this.gameList.push(this.gameList.length + 1)
                })
              .margin({
                right: 10
              })
            Button('Pop')
              .onClick(
                () => {
                  this.gameList.pop()
                })
              .margin({
                right: 10
              })
            Button('Reverse')
              .onClick(
                () => {
                  this.gameList.reverse()
                })
          }
        }
        if (this.isWin()) {
          Row() {
            Button('New Game')
              .onClick(
                () => {
                  // high score:
                  this.highScore += 1

                  for (let count = 0; count < 10; count++) {
                    this.gameGoal.pop()
                  }
                  do {
                    for (let count = 0; count < 10; count++) {
                      let test = Math.random()
                      if (test < 0.35) {
                        this.gameGoal.push(this.gameGoal.length + 1)
                      } else if (test > 0.75) {
                        this.gameGoal.pop()
                      } else {
                        this.gameGoal.reverse()
                      }
                    }
                  } while (this.gameGoal.length == 0)
                })
              .margin({
                top: 10
              })
          }
        }
        Row() {
          Text('highScore: '+`${this.highScore}`)
        }
        .margin({
          top: 10
        })
        Row() {
          Text('about>')
            .fontColor(Color.Blue)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              console.info(`Succeeded in clicking the 'Next' button.`)
              // 跳转到第二页
              router.pushUrl({ url: 'pages/about' }).then(() => {
                console.info('Succeeded in jumping to the second page.')
              }).catch((err) => {
                console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
              })
            })
        }
        .margin({
          top: 16
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}