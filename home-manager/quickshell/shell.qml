//@ pragma UseQApplication

import Quickshell // for PanelWindow
import QtQuick // for Text
import "./bar"

ShellRoot {
  id: root
  Loader {
    active: true
    sourceComponent: Bar{}
  }
}
