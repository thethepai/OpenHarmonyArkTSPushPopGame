# ArkTS game

鸿蒙移动应用技术实验

## brief view

![alt text](<~picture bed/README.assets/image.png>)

![alt text](<~picture bed/README.assets/image-1.png>)

![alt text](<~picture bed/README.assets/image-2.png>)

![alt text](<~picture bed/README.assets/image-3.png>)

![alt text](<~picture bed/README.assets/image-4.png>)

## usage

* reverse and random new game
* high score
* quit confirm
* welcome and about page

## details

### add reverse and new game button

use gameList's reverse function

```typescript
Button('Reverse')
              .onClick(
                () => {
                  this.gameList.reverse()
                })
```

use Math.random() to generate new game list

```typescript
Button('New Game')
              .onClick(
                () => {
                  ...
                  let test = Math.random()
                  ...
                })
```

### persistent storage

define

```typescript
PersistentStorage.PersistProp('highScore', 0);
```

call

```typescript
@StorageLink('highScore') highScore: number = 0
```

### quit confirm

define dialog window

```typescript
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void
  ...
}
```

complete call back function in @Entry @Component

```typescript
dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept,
    }),
  })

  onCancel() {
    ...
  }

  onAccept() {
    ...
  }
```

### page switch and router

refer to HarmonyOS Developer pages:

https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/start-with-ets-stage-0000001477980905-V2