import bb.cascades 1.0
import bb.system 1.0
    
Page {
    property Sheet addLocation
    property string deleteID
    
    Container {
        Container { // HEADER - START
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Locations</span>"
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
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                background: Color.create("#7C4420")
                
                topPadding: 20
                bottomPadding: 20
                
                // TOTAL - START
                Container {
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        horizontalAlignment: HorizontalAlignment.Center
                        attachedObjects: [
                            SystemToast {
                                icon: "asset:///images/icons/locations/total.png"
                                id: toastTotal
                                body: "This represents the number of locations you have added into cella."
                            }   
                        ]
                        gestureHandlers: TapHandler { onTapped: { toastTotal.show() }}
                        
                        ImageView { imageSource: "asset:///images/icons/locations/total.png" }
                        
                        Label {
                            text: "<span style='font-size: 40px; letter-spacing: 2px;'>" + getLocationsTotal() + "</span>"
                            textStyle.color: Color.White
                            textFormat: TextFormat.Html
                            
                            function getLocationsTotal() {
                                if (locationsTotal > 0)
                                    return locationsTotal - 1
                                return locationsTotal
                            }
                        }
                    }
                    
                    layoutProperties: StackLayoutProperties { spaceQuota: 1 }    
                } // TOTAL - END
            } // STATISTICS HEADER - END
            
            Container { // EMPTY MESSAGE - START
                id: lblEmpty
                layout: DockLayout {}
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                visible: (locationsTotal == 0)
                horizontalAlignment: HorizontalAlignment.Fill
                
                Label {
                    text: "<span style='font-size: 30px'><em>No locations have been added.</em></span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                }
            } // EMPTY MESSAGE - END
            
            ListView { // LISTVIEW - START
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                dataModel: _app.dataModelLocation
                visible: (locationsTotal > 0)
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
                                        onTriggered: { listItem.ListItem.view.deleteLocation(ListItemData.id) }
                                    }
                                }
                            ]
                        }
                    }
                ]
	            
                function deleteLocation(id) { deleteID = id; deleteDialog.show() }
	            
	            attachedObjects: [
	                ComponentDefinition {                      
	                    id: showLocationDef          
	                    source: "show/showLocation.qml"             
	                },
	                
	                // DELETE DIALOG
	                SystemDialog {
	                    id: deleteDialog
	                    title: "Delete Location?"
	                    body: "This will delete the selected location and items in it."
	                    defaultButton: SystemUiButton { label: "Delete" }
	                    onFinished: {
	                        if (deleteDialog.result == SystemUiResult.ConfirmButtonSelection) { 
	                            // Delete the location with the ID
	                            _app.deleteRecordLocation(deleteID)
	                            
	                            // Update data model - location
	                            // Updates Locations tab list
                                _app.readRecordsLocation()
                                
                                // Update total # of locations
                                locationsSource.load()
	                        }
	                    }
	                }
	            ]
	            
	            onTriggered: {
	                // Avoid trigger on header items
	                if (indexPath.length > 1) {
	                    var selectedItem = dataModel.data(indexPath)
	                    
	                    _app.readRecordsItemInLocation(selectedItem.id)
	                    
	                    var page = showLocationDef.createObject()
	                    page.locationID = selectedItem.id
	                    page.roomID = selectedItem.room_id
	                    page.roomName = selectedItem.room_name
	                    page.locationName = selectedItem.name
	                    page.locationDescription = selectedItem.description
	                    page.locationPosition = selectedItem.position
	                    page.locationImg = selectedItem.img
	                    
                        navPaneL.push(page)
	                }
	            }
	            
	            function showLocation(){
	                var showLocation = showLocationDef.createObject(showLocationDef)
	                showLocation.open()
	            }
	        }
	    } // BODY - END
    }
    
    actions: [
        ActionItem {
            title: "Add"
            imageSource: "asset:///images/actionbar/add.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: { showAddLocation()  }
            attachedObjects: [
                ComponentDefinition {                      
                    id: addLocationDef          
                    source: "add/addLocation.qml"             
                }
            ]
            
            function showAddLocation(){
                addLocation = addLocationDef.createObject(addLocationDef)
                addLocation.open()
            }
        }
    ]
}