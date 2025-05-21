package main

import (
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/widget"
)

// ShowSimpleUI creates and shows a simple UI with a "Hello World" label.
func ShowSimpleUI() {
	myApp := app.New()
	myWindow := myApp.NewWindow("Simple UI")

	myWindow.SetContent(widget.NewLabel("Hello World"))
	myWindow.ShowAndRun()
}
