import Quickshell
import QtQuick

Scope {
  Variants {
    model: Quickshell.screens;
    PanelWindow {
      required property var modelData
      screen: modelData
      color: Theme.background
      
      anchors {
        top: true
        right: true
        bottom: true
      }
      implicitWidth: 50

      WorkspaceWidget {
        id: workspaceWidget
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter

      }

      BatteryWidget {
        id: batteryWidget
        anchors.bottom: clockWidget.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: batteryWidget.visible ? 5 : 0
      }
  
      ClockWidget {
        id: clockWidget
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 5
      }
    }
  }

}
