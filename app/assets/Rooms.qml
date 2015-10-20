import bb.cascades 1.0
import bb.system 1.0

Page {
    property Sheet addRoom
    property string deleteID
    
    // WRAPPER - START
    Container {
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Rooms</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                rightPadding: 30
                ImageButton {
                    defaultImageSource: "asset:///images/logos/header.png"
                    pressedImageSource: "asset:///images/logos/header-pressed.png"
                    onClicked: { activeTab = tabDashboard }
                }
            }
        } // HEADER - END
        
        // BODY - START
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            
            // STATISTICS HEADER - START
            Container {
                background: Color.create("#7C4420")
                horizontalAlignment: HorizontalAlignment.Fill
                
                topPadding: 20
                bottomPadding: 20
                
                // TOTAL - START
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    horizontalAlignment: HorizontalAlignment.Center
                    gestureHandlers: TapHandler { onTapped: { toastTotal.show() }}
                    attachedObjects: [
                        SystemToast {
                            id: toastTotal
                            icon: "asset:///images/icons/rooms/total.png"
                            body: "This represents the number of rooms you have added into cella."
                        }   
                    ]
                    
                    ImageView { imageSource: "asset:///images/icons/rooms/total.png" }
                    
                    Label {
                        text: "<span style='font-size: 40px; letter-spacing: 2px;'>" + getRoomsTotal() + "</span>"
                        textStyle.color: Color.White
                        textFormat: TextFormat.Html
                        
                        function getRoomsTotal() {
                            if (roomsTotal > 0)
                                return roomsTotal - 1
                            return roomsTotal
                        }
                    }
                }  // TOTAL - END
            } // STATISTICS HEADER - END

            Container { // EMPTY MESSAGE - START
                id: lblEmpty
                layout: DockLayout {}
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                visible: (roomsTotal == 0)
                horizontalAlignment: HorizontalAlignment.Fill
                
                Label {
                    text: "<span style='font-size: 30px'><em>No rooms have been added.</em></span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                }
            } // EMPTY MESSAGE - END

            ListView {
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                visible: (roomsTotal > 0)
                dataModel: _app.dataModelRoom
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        Container {
                            id: listItem
                            
                            Container {
                                layout: DockLayout {}
                                horizontalAlignment: HorizontalAlignment.Fill
                                
                                topPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Container {
                                    layout: DockLayout {}
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    
                                    ImageView {
                                        imageSource: ListItemData.img
                                        verticalAlignment: VerticalAlignment.Center
                                        minWidth: 81
                                        minHeight: 81
                                    }
                                    
                                    Container {
                                        rightPadding: 101
                                        leftPadding: 101
                                        verticalAlignment: VerticalAlignment.Center
                                        Label {
                                            text: "<span style='font-size: 35px'>" + ListItemData.name + "</span>"
                                            textFormat: TextFormat.Html
                                        }
                                    }
                                }
                            }
                            
                            Divider { opacity: 0.33 }
                            
                            contextActions: [
                                ActionSet {
                                    title: ListItemData.name
                                    subtitle: ListItemData.description
                                    
                                    DeleteActionItem {
                                        title: "Delete"
                                        imageSource: "asset:///images/delete.png"
                                        onTriggered: { listItem.ListItem.view.deleteRoom(ListItemData.id) }
                                    }
                                }
                            ]
                        }
                    }
                ]
                
                function deleteRoom(id) { deleteID = id; deleteDialog.show() }
                
                attachedObjects: [
                    ComponentDefinition {                      
                        id: showRoomDef          
                        source: "show/showRoom.qml"      
                    },
                    
                    // DELETE DIALOG
                    SystemDialog {
                        id: deleteDialog
                        title: "Delete Room?"
                        body: "This will delete the selected room and any locations and items in it."
                        defaultButton: SystemUiButton { label: "Delete" }
                        onFinished: {
                            if (deleteDialog.result == SystemUiResult.ConfirmButtonSelection) { confirmDialog.show() }
                        }
                    },
                    
                    // CONFIRMATION DIALOG
                    SystemDialog {
                        id: confirmDialog
                        title: "Are you sure?"
                        body: "All locations in this room along with any items in those locations will also be deleted!"
                        defaultButton: SystemUiButton { label: "Yes" }
                        onFinished: {
                            if (confirmDialog.result == SystemUiResult.ConfirmButtonSelection) { reconfirmDialog.show() }
                        }
                    },
                    
                    // CONFIRMATION DIALOG
                    SystemDialog {
                        id: reconfirmDialog
                        title: "Are you super sure?"
                        body: "All items in all locations in this room are going to be deleted!"
                        defaultButton: SystemUiButton { label: "Yes" }
                        onFinished: {
                            if (reconfirmDialog.result == SystemUiResult.ConfirmButtonSelection) {
                                // Delete the room with the ID
                                _app.deleteRecordRoom(deleteID)
                                
                                // Update data model - room
                                // Updates Rooms tab list
                                _app.readRecordsRoom()
                                
                                // Calculate dataSource
                                roomsSource.load()
                            }
                        }
                    }
                ]
                
                // Occurs when a list item is pressed
                onTriggered: {
                    // Avoid trigger on header items
                    if (indexPath.length > 1) {
                        var selectedItem = dataModel.data(indexPath)
                        _app.readRecordsLocationInRoom(selectedItem.id)
                        _app.readRecordsItemInRoom(selectedItem.id)
                        
                        var page = showRoomDef.createObject()
                        
                        // Set variables for show room
                        page.roomID = selectedItem.id
                        page.roomName = selectedItem.name
                        page.roomDescription = selectedItem.description
                        page.roomImg = selectedItem.img
                        
                        navPaneR.push(page)
                    }
                }
            } 
        } // BODY - END
    } // WRAPPER - END
    
    actions: [ // ACTIONBAR - START
        ActionItem { 
            title: "Add"
            imageSource: "asset:///images/actionbar/add.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            attachedObjects: [
                ComponentDefinition {                      
                    id: addRoomDef          
                    source: "add/addRoom.qml"             
                }
            ]
            
            onTriggered: { showAddRoom() }
            
            function showAddRoom(){
                addRoom = addRoomDef.createObject(addRoomDef)
                addRoom.open()
            }
        }
    ] // ACTIONBAR - END
}
