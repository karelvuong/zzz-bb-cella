import bb.cascades 1.0

Sheet {
    id: sheet
    
    onOpened: { ddPreset.requestFocus() }
    
    Page {
        titleBar: TitleBar {
            dismissAction: ActionItem { title: "Cancel"; onTriggered: { sheet.close() }}
            title: "Add Room"
            acceptAction: ActionItem {
                id: btnSave
                title: "Save"
                enabled: false
                
                onTriggered: {
                    // Create room record in rooms table
                    _app.createRecordRoom(tfName.text.trim(), taDescription.text.trim(), btnSelectIcon.imageSource)
                    
                    // Update records - List in rooms list
                    _app.readRecordsRoom()
                    
                    // Update total # of rooms
                    roomsSource.load()
                    
                    // Dispose of the sheet
                    sheet.close()
                    
                    // Change tab if adding from dashboard
                    if (activeTab == tabDashboard)
                        activeTab = tabRooms
                }
            }
        }
        
        ScrollView { // BODY - START
            Container { // WRAPPER - START
                topPadding: 20.0
                rightPadding: 20.0
                bottomPadding: 20.0
                leftPadding: 20.0
                
                // PRESETS - START
                Header { title: "Presets"; subtitle: "Select to auto-fill multiple details." }
                Container {
                    id: cntrPresets
                    topPadding: 20.0
                    bottomPadding: 20.0
                    
                    DropDown {
                        id: ddPreset
                        title: "Preset"
                        Option { text: "None"; selected: true }
                        Option { text: "Attic" }
                        Option { text: "Balcony" }
                        Option { text: "Bathroom" }
                        Option { text: "Bedroom" }
                        Option { text: "Den" }
                        Option { text: "Dining Room" }
                        Option { text: "Family Room" }
                        Option { text: "Garage" }
                        Option { text: "Garden" }
                        Option { text: "Kitchen" }
                        Option { text: "Library" }
                        Option { text: "Living Room" }
                        Option { text: "Porch" }
                        Option { text: "Room" }
                        Option { text: "Study" }
                        Option { text: "Washroom" }
                        Option { text: "Yard" }
                        
                        onSelectedOptionChanged: {
                            var opt = selectedOption.text
                            if (opt != "None")
                                tfName.setText(selectedOption.text)
                            
                            if (opt == 'Attic')
                                btnSelectIcon.setImageSource("asset:///images/rooms/attic.png")
                            else if (opt == 'Balcony')
                                btnSelectIcon.setImageSource("asset:///images/rooms/balcony.png")
                            else if (opt == 'Bathroom')
                                btnSelectIcon.setImageSource("asset:///images/rooms/bathroom.png")
                            else if (opt == 'Bedroom')
                                btnSelectIcon.setImageSource("asset:///images/rooms/bedroom.png")
                            else if (opt == 'Den')
                                btnSelectIcon.setImageSource("asset:///images/rooms/study.png")
                            else if (opt == 'Dining Room')
                                btnSelectIcon.setImageSource("asset:///images/rooms/diningroom.png")
                            else if (opt == 'Family Room')
                                btnSelectIcon.setImageSource("asset:///images/rooms/familyroom.png")
                            else if (opt == 'Garage')
                                btnSelectIcon.setImageSource("asset:///images/rooms/garage.png")
                            else if (opt == 'Garden')
                                btnSelectIcon.setImageSource("asset:///images/rooms/yard.png")
                            else if (opt == 'Kitchen')
                                btnSelectIcon.setImageSource("asset:///images/rooms/kitchen.png")
                            else if (opt == 'Library')
                                btnSelectIcon.setImageSource("asset:///images/rooms/library.png")
                            else if (opt == 'Living Room')
                                btnSelectIcon.setImageSource("asset:///images/rooms/livingroom.png")
                            else if (opt == 'Porch')
                                btnSelectIcon.setImageSource("asset:///images/rooms/balcony.png")
                            else if (opt == 'Room')
                                btnSelectIcon.setImageSource("asset:///images/rooms/room.png")
                            else if (opt == 'Study')
                                btnSelectIcon.setImageSource("asset:///images/rooms/study.png")
                            else if (opt == 'Washroom')
                                btnSelectIcon.setImageSource("asset:///images/rooms/bathroom.png")
                            else if (opt == 'Yard')
                                btnSelectIcon.setImageSource("asset:///images/rooms/yard.png")
                            
                            tfName.requestFocus()
                        }
                    }
                }
                
                Header { title: "What"; subtitle: "Describe details about the room." }
                Container {
                    id: cntrWhat
                    topPadding: 20.0
                    
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        TextField {
                            id: tfName
                            hintText: "Name"
                            
                            onTextChanging: {
                                if (text.length > 0){
                                    btnSave.enabled = true
                                } else {
                                    btnSave.enabled = false
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
                
                Container {
                    id: cntrAppearence
                    Header { title: "Appearance"; subtitle: "Pick an icon to represent it." }
                    
                    topPadding: 20.0
                    bottomPadding: 20.0
                    
                    Button {
                        id: btnSelectIcon
                        text: "Select An Icon"
                        imageSource: "asset:///images/rooms/room.png"
                        preferredWidth: 768
                        onClicked: { showSelectIcon() }
                        
                        attachedObjects: [
                            ComponentDefinition {
                                id: sheetAddIconDef
                                source: "select/selectIconRoom.qml"  
                            }
                        ]
                        
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
                onTriggered: { showAddField(); }
                
                attachedObjects: [
                    ComponentDefinition {
                        id: sheetAddFieldDef
                        source: "fields/addFieldRoom.qml"  
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