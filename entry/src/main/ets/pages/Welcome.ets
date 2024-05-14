import router from '@ohos.router';
import app from '@system.app'

@Entry
@Component
struct Welcome {
  @State message: string = 'List Game'
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept,
    }),
    alignment: DialogAlignment.Default, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Quit App')
    app.terminate()
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Start')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#fffaa43d')
        .width('40%')
        .height('10%')
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 跳转到第二页
          router.pushUrl({ url: 'pages/Index' }).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })

        Button() {
          Text('About')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#fffaa43d')
        .width('40%')
        .height('10%')
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 跳转到第二页
          router.pushUrl({ url: 'pages/about' }).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })

        Text('<quit game')
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .margin({
            top: 16
          })
          .onClick(() => {
            this.dialogController.open()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text('确认退出吗').fontSize(20).margin({ top: 16, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
          .backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          })
          .backgroundColor(0xffffff).fontColor(Color.Red)
      }
      .margin({
        bottom: 10
      })
    }
  }
}