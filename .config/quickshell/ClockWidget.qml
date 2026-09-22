import Quickshell
import QtQuick

Rectangle {
  width: 40
  height: clockColumn.height + 20
  radius: 4
  color: Theme.surface

  SystemClock {
    id: clock
    precision: SystemClock.minutes
  }

  Column {
    id: clockColumn
    anchors.centerIn: parent
    width: parent.width

    Text {
      width: parent.width
      text: Qt.formatDateTime(clock.date, "hh:mm")
      color: Theme.text
      font.pixelSize: 12
      horizontalAlignment: Text.AlignHCenter
    }
    Text {
      width: parent.width
      text: Qt.formatDateTime(clock.date, "AP")
      color: Theme.text
      font.pixelSize: 12
      horizontalAlignment: Text.AlignHCenter

    }

  }
}
