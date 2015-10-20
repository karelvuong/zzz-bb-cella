import bb.cascades 1.0
import bb.system 1.0

Sheet { 
    id: sheetEdit
    Page {
        // TITLE BAR - START
        titleBar: TitleBar {
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: { sheetEdit.close() }
            }
            
            title: "Edit Location"
            
            acceptAction: ActionItem {
                id: btnSave
                title: "Save"
                attachedObjects: [
                    SystemDialog {
                        id: editDialog
                        title: "Save Location?"
                        body: "This will update the selected location."
                        onFinished: {
                            if (editDialog.result == 
                            SystemUiResult.ConfirmButtonSelection) {
                                // Update the current location
                                _app.updateRecordLocation(locationID, roomID, roomName, tfName.text, taDescription.text, ddPosition.selectedOption.text, btnSelectIcon.imageSource);
                                
                                // Update records - List in show room
                                _app.readRecordsLocationInRoom(roomID);
                                
                                // Update records - List in locations list
                                _app.readRecordsLocation();
                                
                                // Update properties
                                locationName = tfName.text
                                locationDescription = taDescription.text
                                locationPosition = ddPosition.selectedOption.text
                                locationImg = btnSelectIcon.imageSource
                                
                                // Dispose of sheet
                                sheetEdit.close();
                            }
                        }
                        defaultButton: SystemUiButton { label: "Save" }
                    }
                ]
                
                onTriggered: { editDialog.show() }
            }
        } // END TITLE BAR
        
        ScrollView { // BODY - START
            Container { // WRAPPER - START
                topPadding: 20.0
                rightPadding: 20.0
                bottomPadding: 20.0
                leftPadding: 20.0
                
                Container {
                    id: cntrWhat
                    Header { title: "What"; subtitle: "Describe details about the location." }
                    Container {
                        topPadding: 20.0
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            TextField {
                                id: tfName
                                text: locationName
                                hintText: "Name"
                                visible: (locationName.length > 0)
                            }
                            
                            Container {
                                background: Color.Red
                                verticalAlignment: VerticalAlignment.Fill
                                minWidth: 5
                            }
                        }
                        
                        TextArea {
                            id: taDescription
                            text: locationDescription
                            hintText: "Description"
                            visible: (locationDescription.length > 0)
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
                        
                        // Autofill type if it exists in items table
                        onCreationCompleted: {
                            if(locationPosition != 'None') {
                                ddPosition.visible = true
                                
                                for (var i = 0; i < ddPosition.count(); i++) {
                                    var o = ddPosition.at(i);
                                    if(o.text == locationPosition)
                                        ddPosition.setSelectedIndex(i);
                                }
                            } else
                                ddPosition.setSelectedIndex(0)
                        }
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
                                source: "../add/select/selectIconLocation.qml"  
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
                attachedObjects: [
                    ComponentDefinition {
                        id: sheetAddFieldDef
                        source: "../add/fields/addFieldLocation.qml"
                    }
                ]
                
                onTriggered: { showAddField(); }
                
                function showAddField() {
                    var addField = sheetAddFieldDef.createObject(sheetAddFieldDef)
                    addField.open()
                }
            }
        ]
    }
}
