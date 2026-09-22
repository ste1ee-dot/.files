import Quickshell
import Quickshell.Services.UPower
import QtQuick

Rectangle {
  width: 40
  radius: 4
  color: Theme.surface

  property var batteries: UPower.devices.values.filter(
    device => device.type === UPowerDeviceType.Battery
  )

  height: batteries.length > 0 ? batteryColumn.height + 20 : 0
  visible: batteries.length > 0

  Column {
    id: batteryColumn
    anchors.centerIn: parent
    width: parent.width

    Text {
      width: parent.width
    
      text: {
        let currentEnergy = 0
        let fullEnergy = 0
    
        for (const b of batteries) {
          currentEnergy += b.energy
          fullEnergy += b.energyCapacity
        }
    
        if (fullEnergy <= 0)
          return "N/A"
    
        return Math.round((currentEnergy / fullEnergy) * 100) + "%"
      }
    
      color: Theme.text
      font.pixelSize: 12
      horizontalAlignment: Text.AlignHCenter
    }
    
    Text {
      width: parent.width

      visible: {
        for (const b of batteries) {
          if (b.state === UPowerDeviceState.Charging)
            return true
        }

        return false
      }


      text : "↯"
      color: Theme.text
      font.pixelSize: 12
      horizontalAlignment: Text.AlignHCenter
    }
  }
}
