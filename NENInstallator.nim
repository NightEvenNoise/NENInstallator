import nigui, os, zippy/ziparchives

app.init()

var window = newWindow("Installator")
window.width = 640.scaleToDpi
window.height = 480.scaleToDpi

var mainContainer = newLayoutContainer(Layout_Horizontal)
window.add(mainContainer)

var secondContainer = newLayoutContainer(Layout_Vertical)
mainContainer.add(secondContainer)

var textBox = newTextBox()
secondContainer.add(textBox)
textBox.text = getHomeDir()

var button = newButton("Select Directory ...")
secondContainer.add(button)
button.onClick = proc(event: ClickEvent) =
    var dialog = SelectDirectoryDialog()
    dialog.title = "Select Directory"
    dialog.run()
    if dialog.selectedDirectory == "":
        textBox.text = getHomeDir()
    else:
        textBox.text = dialog.selectedDirectory & "/Program"

var button2 = newButton("Cancel")
mainContainer.add(button2)
button2.onClick = proc(event: ClickEvent) =
    quit(-1)

var button3 = newButton("Install")
mainContainer.add(button3)
button3.onClick = proc(event: ClickEvent) =
    extractAll("data.bin", textBox.text)
    sleep(100)
    quit(-1)

if fileExists("data.bin"):
    window.show()
    app.run()
else:
    quit(1)
