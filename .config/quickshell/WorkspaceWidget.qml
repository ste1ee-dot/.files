import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {

  width: 40
  height: workspaceColumn.height + 20
  radius: 4
  color: Theme.surface  

  Column {
    id: workspaceColumn
    anchors.centerIn: parent
    spacing: 5
    
    Repeater {
      model: Hyprland.workspaces

      Rectangle {
        width: 20
        height: 20
        radius: 4
        color: modelData.focused ? Theme.surface2 : Theme.surface

        Text {
          anchors.fill: parent
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: modelData.id
          color: modelData.focused ? Theme.text : Theme.mutedText
          font.pixelSize: 12
          
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onClicked: {
            modelData.activate()
          }
        }
      }
    }
  }
}
