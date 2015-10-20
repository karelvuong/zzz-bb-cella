import bb.cascades 1.0
import bb.data 1.0

Sheet { 
    id: sheetSelectLocation
    
    property Sheet addLocation
    property string roomID
    property string roomName
    
    Page {
        titleBar: TitleBar {
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: {
                    sheetSelectLocation.close()
                }
            }
            title: "Select A Location"
        }
        
        Container {
            ListView {
                dataModel: _app.dataModelLocationInRoom
                horizontalAlignment: HorizontalAlignment.Fill
                
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: qsTr("%1").arg(ListItemData.name)
                            description: qsTr("%1").arg(ListItemData.description)
                            imageSource: qsTr("%1").arg(ListItemData.img)
                        }
                    }
                ]
                
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath)
                    
                    btnSelectLocation.setText(selectedItem.name)
                    locationID = selectedItem.id
                    locationName = selectedItem.name
                    
                    btnSave.enabled = true
                    sheetSelectLocation.close()
                }
            }
        }
        
        actions: [
            ActionItem {
                title: "Add Location"
                imageSource: "asset:///images/actionbar/add_location.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                attachedObjects: [
                    ComponentDefinition {                      
                        id: addLocationDef          
                        source: "../addLocation.qml"             
                    }
                ]
                
                onTriggered: { showAddLocation() }
                
                function showAddLocation(){
                    addLocation = addLocationDef.createObject(addLocationDef)
                    addLocation.roomID = roomID
                    addLocation.roomName = roomName
                    addLocation.open()
                }    
            }
        ]
    }  
}