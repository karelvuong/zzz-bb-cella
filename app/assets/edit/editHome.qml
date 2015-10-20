import bb.cascades 1.0
import bb.cascades.pickers 1.0

Sheet {
    id: sheetEdit
    
    onOpened: { tfStreetNumber.requestFocus() }
    
    Page {    
        titleBar: TitleBar {
            dismissAction: ActionItem { title: "Cancel"; onTriggered: { sheetEdit.close() }}
            title: "Edit Home"
            acceptAction: ActionItem {
                id: aiSave
                title: "Save"
                enabled: enableSave()
                onTriggered: {
                    if (ddStories.selectedIndex != -1)
                    	var s = (ddStories.selectedOption.text == '-' ? '' : ddStories.selectedOption.text)
                    
                    var p = ivPicture.imageSource
                    if (p == 'asset:///images/placeholders/home/home-placeholder-add.png')
                         p = 'asset:///images/placeholders/home/home-placeholder.png'
                    
                    // SAVE VALUES
                    _app.saveValueFor('home-street_num', tfStreetNumber.text.trim())
                    _app.saveValueFor('home-street_name', tfStreetName.text.trim())
                    _app.saveValueFor('home-street_suffix', ddStreetSuffix.selectedOption.text)
                    _app.saveValueFor('home-unit', tfUnit.text.trim())
                    _app.saveValueFor('home-municipality', tfMunicipality.text.trim())
                    _app.saveValueFor('home-province', tfProvince.text.trim())
                    _app.saveValueFor('home-postal_code', tfPostal.text.trim())
                    _app.saveValueFor('home-sqft', tfSqFt.text.trim())
                    _app.saveValueFor('home-stories', s)
                    _app.saveValueFor('home-year_built', tfYearBuilt.text.trim())
                    _app.saveValueFor('home-year_purchased', tfYearPurchased.text.trim())
                    _app.saveValueFor('home-picture', p)
                    
                    // UPDATE LABELS IN HOUSE TAB
                    street_num = _app.getValueFor('home-street_num', '')
                    street_name = _app.getValueFor('home-street_name', '')
                    street_suffix = _app.getValueFor('home-street_suffix', '')
                    unit = _app.getValueFor('home-unit', '')
                    municipality = _app.getValueFor('home-municipality', '')
                    province = _app.getValueFor('home-province', '')
                    postal_code = _app.getValueFor('home-postal_code', '')
                    sqft = _app.getValueFor('home-sqft', '')
                    stories = _app.getValueFor('home-stories', '')
                    year_built = _app.getValueFor('home-year_built', '')
                    year_purchased = _app.getValueFor('home-year_purchased', '')
                    picture = _app.getValueFor('home-picture', 'asset:///images/placeholders/home/home-placeholder.png')
                    
                    sheetEdit.close()
                }
            }
        }
        
        Container {
            Container { // PICTURE - START
                layout: DockLayout {}
                ImageView {
                    id: ivPicture
                    imageSource: (picture == 'asset:///images/placeholders/home/home-placeholder.png' ? 'asset:///images/placeholders/home/home-placeholder-add.png' : picture)
                    horizontalAlignment: HorizontalAlignment.Fill
                    preferredHeight: 384
                    scalingMethod: ScalingMethod.AspectFill
                    gestureHandlers: TapHandler { onTapped: { filePicker.open() }}
                    attachedObjects: [
                        FilePicker {
                            id: filePicker
                            type : FileType.Picture
                            title : "Attach Picture"
                            directories : ["/accounts/1000/shared"]
                            onFileSelected : {
                                console.log("FileSelected signal received : " + selectedFiles)
                                itPicture.imageSource = "file://" + selectedFiles[0]
                                ivPicture.requestFocus()
                            }
                        }, 
                        ImageTracker {
                            id: itPicture
                            onStateChanged: {                    
                                if (state == ResourceState.Loaded)
                                    ivPicture.image = itPicture.image
                            }
                        }
                    ]
                }
                
                ImageButton {
                    id: btnRemovePicture
                    defaultImageSource: "asset:///images/actionbar/reset.png"
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Bottom
                    visible: (ivPicture.imageSource != 'asset:///images/placeholders/home/home-placeholder-add.png')
                    onClicked: { ivPicture.imageSource = 'asset:///images/placeholders/home/home-placeholder-add.png' }
                }
            }  // PICTURE - END
            
            // SEPARATOR - START
            Container {
                background: Color.create("#DDDDDD")
                horizontalAlignment: HorizontalAlignment.Fill
                preferredHeight: 5
            } // SEPARATOR - END
            
            ScrollView { // SCROLLVIEW - START
                Container {
                    topPadding: 10
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    // ADDRESS - START
                    Header { title: "Address"; subtitle: '(e.g.) 123 Main Street'}
                    Container {
                        topPadding: 10
                        bottomPadding: 10
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        TextField {
                            id: tfStreetNumber
                            hintText: "Number"
                            text: _app.getValueFor('home-street_num', '')
                            inputMode: TextFieldInputMode.PhoneNumber
                            layoutProperties: StackLayoutProperties { spaceQuota: 3 }
                            verticalAlignment: VerticalAlignment.Center
                            onTextChanging: {
                                var t = tfStreetNumber.text
                                if (isNaN(t)) 
                                    tfStreetNumber.text = t.substring(0, t.length - 1)
                                aiSave.enabled = enableSave()
                            }
                        }
                        
                        TextField {
                            id: tfStreetName
                            hintText: "Street Name"
                            text: _app.getValueFor('home-street_name', '')
                            layoutProperties: StackLayoutProperties { spaceQuota: 3 }
                            verticalAlignment: VerticalAlignment.Center
                            onTextChanging: { aiSave.enabled = enableSave() }
                        }
                        
                        DropDown {
                            id: ddStreetSuffix
                            layoutProperties: StackLayoutProperties { spaceQuota: 3 }
                            options: [
                                Option { text: 'Avenue'},
                                Option { text: 'Boulevard'},
                                Option { text: 'Court'},
                                Option { text: 'Crescent'},
                                Option { text: 'Drive'},
                                Option { text: 'Road'},
                                Option { text: 'Street'},
                                Option { text: 'None'; selected: true },
                                Option { text: 'Alley'},
                                Option { text: 'Avenue'},
                                Option { text: 'Bend'},
                                Option { text: 'Boardwalk'},
                                Option { text: 'Boulevard'},
                                Option { text: 'Circle'},
                                Option { text: 'Close'},
                                Option { text: 'Court'},
                                Option { text: 'Cove'},
                                Option { text: 'Crescent'},
                                Option { text: 'Drive'},
                                Option { text: 'Drung'},
                                Option { text: 'Esplanade'},
                                Option { text: 'Extension'},
                                Option { text: 'Field'},
                                Option { text: 'Garden'},
                                Option { text: 'Gate'},
                                Option { text: 'Green'},
                                Option { text: 'Grove'},
                                Option { text: 'Heights'},
                                Option { text: 'Hill'},
                                Option { text: 'Lane'},
                                Option { text: 'Line'},
                                Option { text: 'Loop'},
                                Option { text: 'Manor'},
                                Option { text: 'Mews'},
                                Option { text: 'Park'},
                                Option { text: 'Parkway'},
                                Option { text: 'Path'},
                                Option { text: 'Pike'},
                                Option { text: 'Place'},
                                Option { text: 'Plaza'},
                                Option { text: 'Promenade'},
                                Option { text: 'Road'},
                                Option { text: 'Route'},
                                Option { text: 'Row'},
                                Option { text: 'Run'},
                                Option { text: 'Spur'},
                                Option { text: 'Square'},
                                Option { text: 'Stravenue'},
                                Option { text: 'Street'},
                                Option { text: 'Terrace'},
                                Option { text: 'Thruway'},
                                Option { text: 'Trace'},
                                Option { text: 'Trail'},
                                Option { text: 'Townline'},
                                Option { text: 'Way'},
                                Option { text: 'Woods'}
                            ]
                            
                            // Autofill street if found
                            onCreationCompleted: {
                                var s = _app.getValueFor('home-street_suffix', '')
                                var dd = ddStreetSuffix
                                if(s.length > 0) {
                                    dd.visible = true
                                    
                                    for (var i = 0; i < dd.count(); i++) {
                                        var o = dd.at(i);
                                        if(o.text == s)
                                            dd.setSelectedIndex(i);
                                    }
                                }
                            }
                            
                            onSelectedOptionChanged:
                            if (ddStreetSuffix.selectedOption.text != 'None') 
                                aiSave.enabled = enableSave()
                            onExpandedChanged: {
                                if (expanded) {
                                    tfStreetNumber.visible = false
                                    tfStreetName.visible = false
                                    ddStreetSuffix.layoutProperties.spaceQuota = 1
                                } else {
                                    tfStreetNumber.visible = true
                                    tfStreetName.visible = true
                                }
                            }
                        } 
                        
                        Container {
                            background: Color.Red
                            verticalAlignment: VerticalAlignment.Fill
                            minWidth: 5
                        }
                    } // ADDRESS - END
                    
                    // LOCATION - START
                    Header { title: "Location"; subtitle: '(e.g.) Toronto, ON A1B 2C3'}
                    Container {
                        topPadding: 20
                        bottomPadding: 20
                        
                        TextField {
                            id: tfUnit
                            hintText: "Unit Number"
                            text: _app.getValueFor('home-unit', '')
                            inputMode: TextFieldInputMode.Pin
                            input.submitKey: SubmitKey.Next
                            onTextChanging: {
                                var t = tfUnit.text
                                if (isNaN(t)) 
                                    tfUnit.text = t.substring(0, t.length - 1)
                            }
                        }
                        
                        TextField {
                            id: tfMunicipality
                            hintText: "Municipality (e.g. Toronto)"
                            text: _app.getValueFor('home-municipality', '')
                            input.submitKey: SubmitKey.Next
                        }
                        
                        TextField {
                            id: tfProvince
                            hintText: "Province/State (e.g. ON)"
                            text: _app.getValueFor('home-province', '')
                            input.submitKey: SubmitKey.Next
                            onTextChanging: {
                                var t = tfProvince.text
                                tfProvince.text = t.toUpperCase()
                                if (t.length > 2)
                                    tfProvince.text = t.substring(0, t.length - 1)
                                if (!/^[a-zA-Z()]*$/.test(t))
                                    tfProvince.text = t.substring(0, t.length - 1)
                            }
                        }
                        
                        TextField {
                            id: tfPostal
                            hintText: "Postal/ZIP Code (e.g. A1B 2C3, 12300)"
                            text: _app.getValueFor('home-postal_code', '')
                            input.submitKey: SubmitKey.Next
                        }
                    }  // LOCATION - END
                    
                    // NUMBERS - START
                    Header { title: "Numbers"; subtitle: 'Some numbers about your home.'}
                    Container {
                        topPadding: 20
                        bottomPadding: 20
                        TextField {
                            id: tfSqFt
                            hintText: "Sq. Ft"
                            text: _app.getValueFor('home-sqft', '')
                            inputMode: TextFieldInputMode.Pin
                            input.submitKey: SubmitKey.Next
                            onTextChanging: {
                                var t = tfSqFt.text
                                if (isNaN(t)) 
                                    tfSqFt.text = t.substring(0, t.length - 1)
                            }
                        }
                        
                        DropDown {
                            id: ddStories
                            title: 'Stories'
                            options: [
                                Option { text: '1'},
                                Option { text: '2'},
                                Option { text: '3'},
                                Option { text: '4'},
                                Option { text: '5'}
                            ]
                            // Autofill # of stories if found
                            onCreationCompleted: {
                                var s = _app.getValueFor('home-stories', '')
                                var dd = ddStories
                                if(s.length > 0) {
                                    dd.visible = true
                                    
                                    for (var i = 0; i < dd.count(); i++) {
                                        var o = dd.at(i);
                                        if(o.text == s)
                                            dd.setSelectedIndex(i);
                                    }
                                }
                            }
                        }
                    } // NUMBERS - END
                    
                    // DATES - START
                    Header { title: "Dates"; subtitle: "It's important to remember these milestones."}
                    Container {
                        topPadding: 20
                        bottomPadding: 20
                        TextField {
                            id: tfYearBuilt
                            hintText: "Year Built"
                            text: _app.getValueFor('home-year_built', '')
                            inputMode: TextFieldInputMode.Pin
                            input.submitKey: SubmitKey.Next
                            onTextChanging: {
                                var t = tfYearBuilt.text
                                if (isNaN(t)) 
                                    tfYearBuilt.text = t.substring(0, t.length - 1)
                                if (t.length > 4)
                                    tfYearBuilt.text = t.substring(0, t.length - 1)
                            }
                        }
                        
                        TextField {
                            id: tfYearPurchased
                            hintText: "Year Purchased"
                            text: _app.getValueFor('home-year_purchased', '')
                            inputMode: TextFieldInputMode.Pin
                            input.submitKey: SubmitKey.Next
                            onTextChanging: {
                                var t = tfYearPurchased.text
                                if (isNaN(t)) 
                                    tfYearPurchased.text = t.substring(0, t.length - 1)
                                if (t.length > 4)
                                    tfYearPurchased.text = t.substring(0, t.length - 1)
                            }
                        }
                    } // DATES - END
                }
            } // SCROLLVIEW - END
        }
        
        actions: [
            ActionItem {
                title: 'Reset Fields'
                imageSource: "asset:///images/actionbar/reset.png"
                onTriggered: {
                    tfStreetNumber.text = ''
                    tfStreetName.text = ''
                    for (var i = 0; i < ddStreetSuffix.count(); i++) {
                        var o = ddStreetSuffix.at(i);
                        if(o.text == 'None')
                            ddStreetSuffix.setSelectedIndex(i);
                    }
                    tfUnit.text = ''
                    tfMunicipality.text = ''
                    tfProvince.text = ''
                    tfPostal.text = ''
                    tfSqFt.text = ''
                    ddStories.setSelectedIndex(-1)
                    tfYearBuilt.text = ''
                    tfYearPurchased.text = ''
                }
            }
        ]
    }
    
    function enableSave() {
        return (tfStreetNumber.text.length > 0 && tfStreetName.text.length > 0 && ddStreetSuffix.selectedOption.text != 'None')
    }
}