import Quickshell
import QtQuick
import "./BarContent.qml"

PanelWindow {
  id: bar

  implicitHeight: 40
  BarContent{}
  anchors {
    top: true
    left: true
    right: true
  }

  color: "transparent"
  BarContent {}
}
