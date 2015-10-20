import bb.cascades 1.0
import bb.system 1.0

Sheet { 
    id: sheetEdit
    Page {
        // START TITLE BAR
        titleBar: TitleBar {
            dismissAction: ActionItem { title: "Cancel"; onTriggered: { sheetEdit.close() }}
            title: "Edit Room"
            acceptAction: ActionItem {
                id: btnSave
                title: "Save"
                attachedObjects: [
                    SystemDialog {
                        id: editDialog
                        title: "Save Room?"
                        body: "This will update the selected room."
                        onFinished: {
                            if (editDialog.result == 
                            SystemUiResult.ConfirmButtonSelection) {
                                // Update the current room
                                _app.updateRecordRoom(roomID, tfName.text, taDescription.text, btnSelectIcon.imageSource)
                                
                                _app.readRecordsRoom()
                                
                                // Update properties
                                roomName = tfName.text
                                roomDescription = taDescription.text
                                roomImg = btnSelectIcon.imageSource
                                
                                // Dispose of sheet
                                sheetEdit.close()
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
                
                Header { title: "What"; subtitle: "Describe details about the room." }
                Container {
                    id: cntrWhat
                    topPadding: 20.0
                    
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        TextField {
                            id: tfName
                            hintText: "Name"
                            
                            onCreationCompleted: {
                                text = roomName
                            }
                            
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
                        
                        onCreationCompleted: {
                            // Show Room (Edit)
                            if(roomDescription.length > 0) {
                                visible = true
                                text = roomDescription
                            }
                        }
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
                        imageSource: roomImg
                        preferredWidth: 768
                        
                        attachedObjects: [
                            ComponentDefinition {
                                id: sheetAddIconDef
                                source: "../add/select/selectIconRoom.qml"  
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
        } // END MAIN CONTENT
        
        // START ACTION BAR
        actions: [
            ActionItem {
                title: "Add Field"
                imageSource: "asset:///images/actionbar/add_field.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                attachedObjects: [
                    ComponentDefinition {
                        id: sheetAddFieldDef
                        source: "../add/fields/addFieldRoom.qml"
                    }
                ]
                
                onTriggered: { showAddField(); }
                
                function showAddField() {
                    var addField = sheetAddFieldDef.createObject(sheetAddFieldDef)
                    addField.open()
                }
            }
        ] // END ACTION BAR
    }
}
