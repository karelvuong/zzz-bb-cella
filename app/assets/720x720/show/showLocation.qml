import bb.cascades 1.0
import bb.system 1.0

Page {
    
    property Sheet addItem
    
    property string deleteID
    
    property string roomID
    property string roomName
    property string locationID
    property string locationName
    property string locationDescription
    property string locationPosition
    property string locationImg
    
    Container {
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                
                ImageView { imageSource: setHeaderImage (locationImg) }
                
                Container {
                    leftPadding: 20
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        text: "<span style='font-size: 60px'>" + locationName + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                    }
                }
            }
        } // HEADER - END
        
        Container { // BODY - START
            id: cntrInfo
            horizontalAlignment: HorizontalAlignment.Fill
            
            Container { // STATISTICS HEADER - START
                background: Color.create("#7C4420")
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: 90
                leftPadding: 30
                
                Label {
                    text: "<span style='font-size: 30px; letter-spacing: 2px; font-weight: 200'>IN THE <strong>" + roomName.toUpperCase() + "</strong> " + getPosition() + ".</span>"
                    textStyle.color: Color.White
                    textFormat: TextFormat.Html
                    verticalAlignment: VerticalAlignment.Center
                }
            } // STATISTICS HEADER - END
            
            Container {
                id: cntrMsg
                background: Color.create("#EFEFEF")
                visible: isOnFloor()
                horizontalAlignment: HorizontalAlignment.Fill
                
                topPadding: 20
                rightPadding: 20
                bottomPadding: (cntrDesc.visible) ? 20 : 10
                leftPadding: 20
                
                Label {
                    text: (isOnFloor() ? "<span style='font-size: 60px;'><em>Hey, I wouldn't suggest\nleaving things on the floor.</em></span>" : "")
                    textFormat: TextFormat.Html
                    textStyle.fontWeight: FontWeight.W100
                    textStyle.textAlign: TextAlign.Center
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
            
            Container { // DESCRIPTION - START
                id: cntrDesc
                visible: (locationDescription.length > 0)
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
                        text: "<span style='font-size: 50px'>" + locationDescription + "</span>"
                        textStyle.fontWeight: FontWeight.W100
                        textFormat: TextFormat.Html
                        multiline: true
                    }
                }
            } // DESCRIPTION - END
            
            Container { // SEPARATOR - START
                background: Color.create("#EFEFEF")
                visible: (locationDescription.length > 0)
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: 5
            } // SEPARATOR - END
            
            Container { // SEPARATOR - START
                background: Color.create("#555555")
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: 20
            } // SEPARATOR - END
            
            Header { title: "What's in it?"; subtitle: "Items" }
            
            ListView {
                dataModel: _app.dataModelItemInLocation
                horizontalAlignment: HorizontalAlignment.Fill
                
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
                                _app.readRecordsItemInLocation(locationID)
                                
                                // Update total # of items
                                itemsSource.load()
                                
                                // Update total # of items with warranty
                                warrantySource.load()
                            }
                        }
                    }
                ]
                
                // Occurs when a list item is pressed
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath)
                    
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
                    
                    var pane
                    
                    if (activeTab == tabRooms)
                        pane = navigationPaneR
                    else if (activeTab == tabLocations)
                        pane = navigationPaneL
                    
                    pane.push(page)
                }
            }
        }
    }
    
    // ACTIONBAR - START
    actions: [
        // ACTION ITEM - ADD
        ActionItem {
            title: "Add Item"
            imageSource: "asset:///images/actionbar/add_item.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            attachedObjects: [
                ComponentDefinition {                      
                    id: addItemDef          
                    source: "../add/addItem.qml"             
                }
            ]
            
            onTriggered: { showAddItem() }
            
            function showAddItem(){
                addItem = addItemDef.createObject(addItemDef)
                addItem.roomID = roomID
                addItem.roomName = roomName
                addItem.locationID = locationID
                addItem.locationName = locationName
                addItem.open()
            }
        },
        
        // ACTION ITEM - EDIT
        ActionItem {
            title: "Edit"
            imageSource: "asset:///images/actionbar/edit.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: { showEditLocation() }
            
            attachedObjects: [
                ComponentDefinition {
                    id: editLocationDef
                    source: "../edit/editLocation.qml"
                }
            ]
            
            function showEditLocation() {
                var editLocation = editLocationDef.createObject(editLocationDef)
                editLocation.open()
            }
        },
        
        DeleteActionItem {
            title: "Delete"
            imageSource: "asset:///images/delete.png"
            onTriggered: { deleteDialog.show() }
            
            attachedObjects: [
                // DELETE CONFIRMATION DIALOG
                SystemDialog {
                    id: deleteDialog
                    title: "Delete Location?"
                    body: "This will delete the selected location and any items in it."
                    onFinished: {
                        if (deleteDialog.result == 
                        SystemUiResult.ConfirmButtonSelection) { confirmDialog.show() }
                    }
                    defaultButton: SystemUiButton {
                        label: "Delete"
                    }
                },
                
                // CONFIRMATION DIALOG
                SystemDialog {
                    id: confirmDialog
                    title: "Are you sure?"
                    body: "All items in this location will also be deleted!"
                    defaultButton: SystemUiButton { label: "Yes" }
                    onFinished: {
                        if (deleteDialog.result == 
                        SystemUiResult.ConfirmButtonSelection) {
                            // Delete the location with the ID
                            _app.deleteRecordLocation(locationID);
                            
                            // Update data model - location
                            // Updates Locations tab list
                            _app.readRecordsLocation();
                            
                            // Update data model - location in room
                            // Updates Locations list in show room
                            _app.readRecordsLocationInRoom(roomID);
                            
                            // Update data model - items in location
                            // Updates items list in show location
                            _app.readRecordsItemInLocation(locationID);
                            
                            var pane;
                            
                            if (activeTab == tabDashboard)
                                pane = navigationPaneD
                            else if (activeTab == tabRooms)
                                pane = navigationPaneR
                            else if (activeTab == tabLocations)
                                pane = navigationPaneL
                            else if (activeTab == tabItems)
                                pane = navigationPaneI
                            
                            pane.pop();
                        }
                    }
                }
            ]
        }
    ] // ACTIONBAR - END
    
    // HELPER FUNCTIONS
    function setHeaderImage(i) {
        var img = i.replace(".png", "-header.png")
        return img
    }
    
    function getPosition() {
        if (locationPosition == 'Corner')
        	return "IN THE CORNER"
        else if (locationPosition == 'Wall')
        	return "ALONG THE WALL"
        return ""
    }
    
    function isOnFloor() {
        var name = locationName.toLowerCase()
        return (name.indexOf('floor') != -1 || name.indexOf('ground') != -1)
    }
}