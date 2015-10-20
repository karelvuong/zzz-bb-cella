import bb.cascades 1.0
import bb.data 1.0

Sheet { 
    id: sheet
    
    property Sheet addRoom
    Page {
        titleBar: TitleBar {
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: { sheet.close() }
            }
            title: "Select A Room"
        }
        
        Container {
            ListView {
                dataModel: _app.dataModelRoom
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
                    // Avoid trigger on header items
                    if (indexPath.length > 1) {
                        var selectedItem = dataModel.data(indexPath);
                        
                        roomID = selectedItem.id
                        roomName = selectedItem.name
                        
                        sheet.close()
                    }
                }
            }
        }
        
        actions: [
            ActionItem {
                title: "Add Room"
                imageSource: "asset:///images/actionbar/add_room.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: { showAddRoom() }
                
                attachedObjects: [
                    ComponentDefinition {                      
                        id: addRoomDef          
                        source: "../addRoom.qml"             
                    }
                ]
                
                function showAddRoom(){
                    addRoom = addRoomDef.createObject(addRoomDef)
                    addRoom.open()
                }   
            }
        ]
    }    
}