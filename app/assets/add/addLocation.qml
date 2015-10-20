import bb.cascades 1.0

Sheet {
    id: sheet
    
    property string roomID
    property string roomName: 'Select A Room'
    
    onOpened: { ddPreset.requestFocus() }
    
    Page {
        titleBar: TitleBar {
            dismissAction: ActionItem { title: "Cancel"; onTriggered: { sheet.close() }}
            title: "Add Location"
            acceptAction: ActionItem {
                id: btnSave
                title: "Save"
                enabled: false
                
                onTriggered: {
                    // Create location record in locations table
                    _app.createRecordLocation(roomID, btnSelectRoom.text, tfName.text, taDescription.text, ddPosition.selectedOption.text, btnSelectIcon.imageSource);
                    
                    // Update records - List in show room
                    _app.readRecordsLocationInRoom(roomID)
                    
                    // Update records - List in locations list
                    _app.readRecordsLocation()
                    
                    // Update total # of locations
                    locationsSource.load()
                    
                    // Dispose of sheet
                    sheet.close()
                    
                    // Change tab if adding from dashboard
                    if (activeTab == tabDashboard)
                        activeTab = tabLocations
                }
            }
        }
        
        ScrollView { // BODY - START
            Container { // WRAPPER - START
                topPadding: 20.0
                rightPadding: 20.0
                bottomPadding: 20.0
                leftPadding: 20.0
                
                Container { // PRESETS - START
                    id: cntrPresets
                    Header { title: "Presets"; subtitle: "Select to auto-fill multiple details." }
                    bottomPadding: 20.0
                    
                    DropDown {
                        id: ddPreset
                        title: "Preset"
                        Option { text: "None"; selected: true }
                        Option { text: "Basket" }
                        Option { text: "Bin" }
                        Option { text: "Bookshelf" }
                        Option { text: "Box" }
                        Option { text: "Cabinet" }
                        Option { text: "Ceiling" }
                        Option { text: "Closet" }
                        Option { text: "Compartment" }
                        Option { text: "Cupboard" }
                        Option { text: "Desk" }
                        Option { text: "Drawer" }
                        Option { text: "Dresser" }
                        Option { text: "End Table" }
                        Option { text: "Floor" }
                        Option { text: "Freezer" }
                        Option { text: "Location" }
                        Option { text: "Locker" }
                        Option { text: "Rack" }
                        Option { text: "Refrigerator" }
                        Option { text: "Shed" }
                        Option { text: "Shelf" }
                        Option { text: "Shoe Rack" }
                        Option { text: "Table" }
                        Option { text: "Tray" }
                        Option { text: "Wardrobe" }
                        
                        onSelectedOptionChanged: {
                            var opt = selectedOption.text
                            if (opt != "None")
                                tfName.setText(selectedOption.text)
                            
                            if (opt == 'Basket')
                                btnSelectIcon.setImageSource("asset:///images/locations/basket.png")
                            else if (opt == 'Bin')
                                btnSelectIcon.setImageSource("asset:///images/locations/bin.png")
                            else if (opt == 'Bookshelf')
                                btnSelectIcon.setImageSource("asset:///images/locations/bookshelf1.png")
                            else if (opt == 'Box')
                                btnSelectIcon.setImageSource("asset:///images/locations/box.png")
                            else if (opt == 'Cabinet')
                                btnSelectIcon.setImageSource("asset:///images/locations/cabinet.png")
                            else if (opt == 'Closet')
                                btnSelectIcon.setImageSource("asset:///images/locations/closet.png")
                            else if (opt == 'Cupboard')
                                btnSelectIcon.setImageSource("asset:///images/locations/cupboard.png")
                            else if (opt == 'Desk')
                                btnSelectIcon.setImageSource("asset:///images/locations/table.png")
                            else if (opt == 'Drawer')
                                btnSelectIcon.setImageSource("asset:///images/locations/drawer.png")
                            else if (opt == 'Dresser')
                                btnSelectIcon.setImageSource("asset:///images/locations/dresser.png")
                            else if (opt == 'Floor')
                                btnSelectIcon.setImageSource("asset:///images/locations/floor.png")
                            else if (opt == 'Freezer')
                                btnSelectIcon.setImageSource("asset:///images/locations/freezer.png")
                            else if (opt == 'Locker')
                                btnSelectIcon.setImageSource("asset:///images/locations/locker.png")
                            else if (opt == 'Location')
                                btnSelectIcon.setImageSource("asset:///images/locations/location.png")
                            else if (opt == 'Rack')
                                btnSelectIcon.setImageSource("asset:///images/locations/rack.png")
                            else if (opt == 'Refrigerator')
                                btnSelectIcon.setImageSource("asset:///images/locations/refrigerator.png")
                            else if (opt == 'Shed')
                                btnSelectIcon.setImageSource("asset:///images/locations/shed.png")
                            else if (opt == 'Shelf')
                                btnSelectIcon.setImageSource("asset:///images/locations/shelf.png")
                            else if (opt == 'Shoe Rack')
                                btnSelectIcon.setImageSource("asset:///images/locations/shoerack.png")
                            else if (opt == 'Table')
                                btnSelectIcon.setImageSource("asset:///images/locations/table.png")
                            else if (opt == 'Tray')
                                btnSelectIcon.setImageSource("asset:///images/locations/tray.png")
                            else if (opt == 'Wardrobe')
                                btnSelectIcon.setImageSource("asset:///images/locations/wardrobe.png")
                            
                            tfName.requestFocus()
                        }
                    }
                }
                
                Container {
                    id: cntrWhat
                    Header { title: "What"; subtitle: "Describe details about the location." }
                    Container {
                        topPadding: 20.0
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            TextField {
                                id: tfName
                                hintText: "Name"
                                
                                onTextChanging: {
                                    // Room already selected
                                    if (text.length > 0 && roomName != 'Select A Room')
                                        btnSave.enabled = true
                                    
                                    // Room selected but user changes name
                                    else if (text.length == 0 && roomName != 'Select A Room')
                                        btnSave.enabled = false
                                    
                                    // Room not selected and name is valid
                                    else if (text.length > 0) {
                                        btnSave.enabled = false
                                        btnSelectRoom.enabled = true
                                        
                                        // Room not selected, name tf empty
                                    } else {
                                        btnSave.enabled = false
                                        btnSelectRoom.enabled = false
                                    }
                                }
                            }
                            
                            Container {
                                background: Color.Red
                                verticalAlignment: VerticalAlignment.Fill
                                minWidth: 5
                            }
                        }
                        
                        TextArea {
                            id: taDescription
                            hintText: "Description"
                            visible: false
                        }
                    }
                }
                
                Container {
                    id: cntrAppearence
                    Header { title: "Where"; subtitle: "What room and where in it is this location?" }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        
                        topPadding: 20.0
                        Button {
                            id: btnSelectRoom
                            text: roomName
                            enabled: false
                            preferredWidth: 768
                            attachedObjects: [
                                ComponentDefinition {
                                    id: selectRoomDef
                                    source: "select/selectRoom.qml"
                                }
                            ]
                            
                            onClicked: { _app.readRecordsRoom(); showSelectRoom() }
                            
                            onTextChanged: 
                                if (tfName.text.length > 0
                                    && text != 'Select A Room')
                                    btnSave.enabled = true
                            
                            
                            function showSelectRoom() {
                                var selectRoom = selectRoomDef.createObject(selectRoomDef)
                                selectRoom.open()
                            }
                        }
                        
                        Container {
                            background: Color.Red
                            verticalAlignment: VerticalAlignment.Fill
                            minWidth: 5
                        }
                    }
                    
                    DropDown {
                        id: ddPosition
                        title: "Position"
                        visible: false
                        
                        Option { text: "None"; selected: true }
                        Option { text: "Corner" }
                        Option { text: "Wall" }
                    }
                }
                
                Container {
                    id: cntrWhere
                    Header { title: "Appearance"; subtitle: "Pick an icon to represent it." }
                    
                    topPadding: 20.0
                    bottomPadding: 20.0
                    
                    Button {
                        id: btnSelectIcon
                        text: "Select An Icon"
                        imageSource: "asset:///images/locations/location.png"
                        preferredWidth: 768
                        attachedObjects: [
                            ComponentDefinition {
                                id: sheetAddIconDef
                                source: "select/selectIconLocation.qml"  
                            }
                        ]
                        
                        onClicked: { showSelectIcon() }
                        
                        function showSelectIcon() {
                            var selectIcon = sheetAddIconDef.createObject(sheetAddIconDef)
                            selectIcon.open()
                        }
                    }
                }
            }
        }
        
        actions: [
            ActionItem {
                title: "Add Field"
                imageSource: "asset:///images/actionbar/add_field.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: { showAddField() }
                attachedObjects: [
                    ComponentDefinition {
                        id: sheetAddFieldDef
                        source: "fields/addFieldLocation.qml"  
                    }
                ]
                
                function showAddField() {
                    var addField = sheetAddFieldDef.createObject(sheetAddFieldDef)
                    addField.open()
                }
            }
        ]
    }
}