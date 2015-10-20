import bb.cascades 1.0
import bb.system 1.0

Page {
    // So that sheet is destroyed when saved/cancelled
    property Sheet addLocation
    
    property string roomID
    property string roomName
    property string roomDescription
    property string roomImg
    
    Container { // WRAPPER - START
        Container { // HEADER - START
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                
                ImageView { imageSource: setHeaderImage (roomImg) }
                
                Container {
                    leftPadding: 20
	                Label {
	                    text: "<span style='font-size: 60px'>" + roomName + "</span>"
	                    textFormat: TextFormat.Html
	                    textStyle.color: Color.White
	                }
	            }
            }
        } // HEADER - END
        
        Container { // BODY - START
            Container { // DESCRIPTION - START
                id: cntrDesc
                visible: (roomDescription.length > 0)
                layout: DockLayout {}
                
                topPadding: 20
                bottomPadding: 20
                rightPadding: 20
                leftPadding: 20
                
                Label {
                    text: "<span style='font-size: 20px; letter-spacing:2px'>DESCRIPTION</span>"
                    textFormat: TextFormat.Html
                }
                
                Container {
                    topPadding: 30
                    Label {
                        text: "<span style='font-size: 50px'>" + roomDescription + "</span>"
                        textStyle.fontWeight: FontWeight.W100
                        textFormat: TextFormat.Html
                        multiline: true
                    }
                }
            } // DESCRIPTION - END
            
            Container { // SEPARATOR - START
                background: Color.create("#EFEFEF")
                visible: (roomDescription.length > 0)
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: 5
            } // SEPARATOR - END
            
            Container { // SEPARATOR - START
                background: Color.create("#555555")
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: 20
            } // SEPARATOR - END
            
            Header { title: "What's in it?"; subtitle: "Locations" }
            
            ListView {
                dataModel: _app.dataModelLocationInRoom
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: qsTr("%1").arg(ListItemData.name)
                            description: qsTr("%1").arg(ListItemData.description)
                            imageSource: ListItemData.img
                        }
                    }
                ]
                
                attachedObjects: [
                    ComponentDefinition {                      
                        id: showLocationDef          
                        source: "showLocation.qml"             
                    }
                ]
                
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath);
                    
                    _app.readRecordsItemInLocation(selectedItem.id)
                    
                    var page = showLocationDef.createObject();
                    page.locationID = selectedItem.id
                    page.roomID = selectedItem.room_id
                    page.roomName = selectedItem.room_name
                    page.locationName = selectedItem.name
                    page.locationDescription = selectedItem.description
                    page.locationPosition = selectedItem.position
                    page.locationImg = selectedItem.img
                    
                    navigationPaneR.push(page)
                }
            }
            
            Header { subtitle: "Items" }
            
            ListView {
                dataModel: _app.dataModelItemInRoom
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
                                        
                                        Label {
                                            visible: (ListItemData.warranty_date_end.length > 0)
                                            text: "<span style='font-size: 20px; letter-spacing: 2px'>WARRANTY ENDS " + listItem.ListItem.view.formatDate(ListItemData.warranty_date_end) + "</span>"
                                            textStyle.color: Color.create("#777777")
                                            textFormat: TextFormat.Html
                                            multiline: true
                                        }
                                    }
                                    
                                    Container {
                                        rightPadding: 20
                                        horizontalAlignment: HorizontalAlignment.Right
                                        verticalAlignment: VerticalAlignment.Center
                                        ImageView {
                                            visible: (ListItemData.warranty == 'Yes')
                                            imageSource: 'asset:///images/icons/items/warranty.png'
                                        }
                                    }
                                    
                                    Container {
                                        rightPadding: (ListItemData.warranty == 'Yes' ? 90 : 20)
                                        horizontalAlignment: HorizontalAlignment.Right
                                        verticalAlignment: VerticalAlignment.Center
                                        ImageView {
                                            visible: (ListItemData.picture.length > 0)
                                            imageSource: 'asset:///images/icons/items/attach-picture-small.png'
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
                                        onTriggered: { listItem.ListItem.view.deleteItem(ListItemData.id) }
                                    }
                                }
                            ]
                        }
                    }
                ]
                
                // HELPER FUNCTIONS
                // Format date to MM dd, YYYY format
                function formatDate(d) {
                    if (d.length == 0)
                        return '';
                    
                    var mNames = [ "JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
                    "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER" ];
                    var day = d.split(',')[0];
                    var month = d.split(',')[1];
                    var year = d.split(',')[2];
                    
                    return mNames[month] + " " + day + ", " + year;
                }
                function deleteItem(id) { deleteID = id; dlgDeleteItem.show() }
                
                attachedObjects: [
                    ComponentDefinition {                      
                        id: showItemDef          
                        source: "showItem.qml"             
                    },
                    
                    // DELETE DIALOG
                    SystemDialog {
                        id: dlgDeleteItem
                        title: "Delete Item?"
                        body: "This will delete the selected item."
                        defaultButton: SystemUiButton { label: "Delete" }
                        onFinished: {
                            if (dlgDeleteItem.result == SystemUiResult.ConfirmButtonSelection) { 
                                // Delete the item with the ID
                                _app.deleteRecordItem(deleteID)
                                
                                // Update list
                                _app.readRecordsItemInRoom(roomID)
                                
                                // Update total # of items
                                itemsSource.load()
                                
                                // Update total # of items with warranty
                                warrantySource.load()
                            }
                        }
                    }
                ]
                
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath);
                    
                    var page = showItemDef.createObject()
                    page.roomID = selectedItem.room_id
                    page.roomName = selectedItem.room_name
                    page.locationID = selectedItem.location_id
                    page.locationName = selectedItem.location_name
                    page.itemImg = selectedItem.img
                    page.itemPicture = selectedItem.picture
                    page.itemID = selectedItem.id
                    page.itemName = selectedItem.name
                    page.itemDescription = selectedItem.description
                    page.itemType = selectedItem.type
                    page.itemBrand = selectedItem.brand
                    page.itemModelNumber = selectedItem.model_number
                    page.itemSerialNumber = selectedItem.serial_number
                    page.itemVersion = selectedItem.version
                    page.itemCapacity = selectedItem.capacity
                    page.itemExpiryDate = selectedItem.expiry_date
                    page.itemArtist = selectedItem.artist
                    page.itemAuthor = selectedItem.author
                    page.itemGenre = selectedItem.genre
                    page.itemYear = selectedItem.year
                    page.itemPurchaseDate = selectedItem.purchase_date
                    page.itemPurchaseLocation = selectedItem.purchase_location
                    page.itemPurchaseMethod = selectedItem.purchase_method
                    page.itemPurchaseNotes = selectedItem.purchase_notes
                    page.itemPurchasePrice = selectedItem.purchase_price
                    page.itemWarranty = selectedItem.warranty
                    page.itemWarrantyName = selectedItem.warranty_name
                    page.itemWarrantyNum = selectedItem.warranty_num
                    page.itemWarrantyNum2 = selectedItem.warranty_num2
                    page.itemWarrantyDateStart = selectedItem.warranty_date_start
                    page.itemWarrantyDateEnd = selectedItem.warranty_date_end
                    page.itemWarrantyNotes = selectedItem.warranty_notes
                    page.itemNotes = selectedItem.notes
                    
                    navigationPaneR.push(page)
                }
            }
        } // BODY - END
    }
    
    // START ACTION BAR
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Back"
            imageSource: "asset:///images/back.png"
            onTriggered: { navigationPaneR.pop() }
        }
    }
    
    actions: [
        ActionItem {
            title: "Add Location"
            imageSource: "asset:///images/actionbar/add_location.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: { showAddLocation() }
            attachedObjects: [
                ComponentDefinition {                      
                    id: addLocationDef          
                    source: "../add/addLocation.qml"             
                }
            ]
            
            function showAddLocation(){
                addLocation = addLocationDef.createObject(addLocationDef)
                addLocation.roomID = roomID
                addLocation.roomName = roomName
                addLocation.open()
            }
        },
        
        ActionItem {
            title: "Edit"
            imageSource: "asset:///images/actionbar/edit.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: { showEditRoom() }
            attachedObjects: [
                ComponentDefinition {
                    id: editRoomDef
                    source: "../edit/editRoom.qml"
                }
            ]
            
            function showEditRoom() {
                var editRoom = editRoomDef.createObject(editRoomDef)
                editRoom.open()
            }
        },
        
        DeleteActionItem {
            title: "Delete"
            imageSource: "asset:///images/delete.png"
            onTriggered: { deleteDialog.show() }
            attachedObjects: [
                // DELETE DIALOG
                SystemDialog {
                    id: deleteDialog
                    title: "Delete Room?"
                    body: "This will delete the selected room and any locations and items within it."
                    defaultButton: SystemUiButton { label: "Delete" }
                    onFinished: { if (deleteDialog.result == SystemUiResult.ConfirmButtonSelection) { confirmDialog.show() }}
                },
                
                // CONFIRMATION DIALOG
                SystemDialog {
                    id: confirmDialog
                    title: "Are you sure?"
                    body: "All locations in this room along with any items in those locations will also be deleted!"
                    defaultButton: SystemUiButton { label: "Yes" }
                    onFinished: { if (confirmDialog.result == SystemUiResult.ConfirmButtonSelection) { reconfirmDialog.show() }}
                },
                
                // CONFIRMATION DIALOG
                SystemDialog {
                id: reconfirmDialog
                    title: "Are you super sure?"
                    body: "All items in all locations in this room are going to be deleted!"
                    defaultButton: SystemUiButton { label: "Yes" }
                    onFinished: {
                    if (confirmDialog.result == SystemUiResult.ConfirmButtonSelection) {
                        // Delete the room with the ID
                        _app.deleteRecordRoom(roomID)
                        
                        // Update data model - location
                        // Updates Locations tab list
                        _app.readRecordsRoom()
                        
                        // Calculate dataSource
                        roomsSource.load()
                        
                        var pane
                        if (activeTab == tabDashboard)
                            pane = navigationPaneD
                        else if (activeTab == tabRooms)
                            pane = navigationPaneR
                        else if (activeTab == tabLocations)
                            pane = navigationPaneL
                        else if (activeTab == tabItems)
                            pane = navigationPaneI
                        pane.pop()
                        }
                    }
                }
            ]
        }
    ]
    
    function setHeaderImage(i){
        var img = i.replace(".png", "-header.png");
        return img;
    }
}