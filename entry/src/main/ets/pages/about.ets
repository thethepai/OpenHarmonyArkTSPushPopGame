import router from '@ohos.router';

@Entry
@Component
struct About {
  @State message: string = 'Game By {pai}'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(42)
          .fontWeight(FontWeight.Bold)
        Text('<back')
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .margin({
            top: 16
          })
          .onClick(() => {
            console.info(`Succeeded in clicking the 'Back' button.`)
            try {
              // 返回第一页
              router.back()
              console.info('Succeeded in returning to the first page.')
            } catch (err) {
              console.error(`Failed to return to the first page.Code is ${err.code}, message is ${err.message}`)
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}