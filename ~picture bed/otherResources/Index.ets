@Entry
@Component
struct Index {
  @State gameList: number[] = [1, 2, 3]
  @State gameGoal: number[] = [2, 2]

  isWin() {
    return this.gameGoal.toString() == this.gameList.toString()
  }

  newGame() {}

  quitGame() {}

  build() {
    Row() {
      Column() {
        Text(this.isWin() ? 'Win!' : 'Win?')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text('Goal: ' + this.gameGoal.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Orange)

        Text(this.gameList.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Row() {
            Button('Push')
              .onClick(
                () => {
                  this.gameList.push(this.gameList.length + 1)
                }
              )
            Button('Pop')
              .onClick(
                () => {
                  this.gameList.pop()
                }
              )

        }
      }
      .width('100%')
    }
    .height('100%')
  }
}