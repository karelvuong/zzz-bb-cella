import bb.cascades 1.0
import bb.system 1.0
    
Page {
    property Sheet addItem
    property string deleteID
    
    Container {
        Container { // HEADER - START
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Items</span>"
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
       
        Container { // BODY - START
            horizontalAlignment: HorizontalAlignment.Fill
           
            Container { // STATISTICS HEADER - START
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                background: Color.create("#7C4420")
                
                topPadding: 20
                bottomPadding: 20
                
                // TOTAL - START
                Container {
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        horizontalAlignment: HorizontalAlignment.Center
                        gestureHandlers: TapHandler { onTapped: { toastTotal.show() }}
                        attachedObjects: [
                            SystemToast {
                                id: toastTotal
                                icon: "asset:///images/icons/items/total.png"
                                body: "This represents the number of items you have added into cella."
                            }   
                        ]
                        
                        ImageView { imageSource: "asset:///images/icons/items/total.png" }
                        
                        Label {
                            text: "<span style='font-size: 40px; letter-spacing: 2px;'>" + getItemsTotal() + "</span>"
                            textStyle.color: Color.White
                            textFormat: TextFormat.Html
                            
                            function getItemsTotal() {
                                if (itemsTotal > 0)
                                    return itemsTotal - 1
                                return itemsTotal
                            }
                        }
                    }
                    
                    layoutProperties: StackLayoutProperties { spaceQuota: 2 }    
                } // TOTAL - END
                
                // WARRANTY - START
                Container {
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        horizontalAlignment: HorizontalAlignment.Center
                        gestureHandlers: TapHandler { onTapped: { toastWarranty.show() }}
                        attachedObjects: [
                            SystemToast {
                                id: toastWarranty
                                icon: "asset:///images/icons/items/warranty.png"
                                body: "This represents the number of items with warranty you have added into cella."
                            }   
                        ]
                        
                        ImageView { imageSource: "asset:///images/icons/items/warranty.png" }
                        
                        Label {
                            text: "<span style='font-size: 40px; letter-spacing: 2px;'>" + getWarrantyTotal() + "</span>"
                            textStyle.color: Color.White
                            textFormat: TextFormat.Html
                            
                            function getWarrantyTotal() {
                                if (warrantyTotal > 0)
                                    return warrantyTotal - 1
                                return warrantyTotal
                            }
                        }
                    }
                    
                    layoutProperties: StackLayoutProperties { spaceQuota: 2 }    
                } // WARRANTY - END
            } // STATISTICS HEADER - END
            
            Container { // EMPTY MESSAGE - START
                id: lblEmpty
                layout: DockLayout {}
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                visible: (itemsTotal == 0)
                horizontalAlignment: HorizontalAlignment.Fill
                
                Label {
                    text: "<span style='font-size: 30px'><em>No items have been added.</em></span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                }
            } // EMPTY MESSAGE - END
            
            ListView {
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                dataModel: _app.dataModelItem
                visible: (itemsTotal > 0)
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
                function deleteItem(id) { deleteID = id; dlgDelete.show() }
	            
	            attachedObjects: [
	                ComponentDefinition {                      
	                    id: showItemDef          
	                    source: "show/showItem.qml"             
	                },
	                
	                // DELETE DIALOG
	                SystemDialog {
	                    id: dlgDelete
	                    title: "Delete Item?"
	                    body: "This will delete the selected item."
	                    defaultButton: SystemUiButton { label: "Delete" }
	                    onFinished: {
                            if (dlgDelete.result == SystemUiResult.ConfirmButtonSelection) { 
	                            // Delete the item with the ID
	                            _app.deleteRecordItem(deleteID)
                                
                                // Update records - List in items list
                                _app.readRecordsItem()
                                
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
	                // Avoid trigger on header items
	                if (indexPath.length > 1) {
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
	                    
	                    navPaneI.push(page)
	                }
	            }
            }
        } // MAIN CONTENT - END
    }
    
    actions: [
        ActionItem {
            title: "Add"
            imageSource: "asset:///images/actionbar/add.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            
            attachedObjects: [
                ComponentDefinition {                      
                    id: addItemDef          
                    source: "add/addItem.qml"             
                }
            ]
            
            onTriggered: { showAddItem() }
            
            function showAddItem(){
                addItem = addItemDef.createObject(addItemDef)
                addItem.open()
            }
        }
    ]
}