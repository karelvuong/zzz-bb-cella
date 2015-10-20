import bb.cascades 1.0
import bb.cascades.pickers 1.0

Sheet {
    id: sheet
    
    property string roomID
    property string roomName: "Select A Room"
    property string locationID
    property string locationName: "Select A Location"
    
    property bool isNameValid: false
    property bool isRoomSelected: false
    property bool isLocationSelected: false
    
    Page {
        // TITLEBAR - START
        titleBar: TitleBar {
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: { sheet.close() }
            }
            
            title: "Add Item"
            
            acceptAction: ActionItem {
                id: btnSave
                title: "Save"
                enabled: false
                
                onTriggered: {
                    // Just to be doubly sure that the correct values are passed
                    var description ='',  brand = '', modelNumber = '', serialNumber = '', 
                        version = '', 
                        capacity = '', expiryDate = '', 
                        artist = '', author = '', genre = '', year = '',
                        purchaseDate = '', purchaseLocation = '', purchaseMethod = '', purchaseNotes = '', purchasePrice = '',
                        warrantyName = '', warrantyNum = '', warrantyNum2 = '', warrantyDateStart = '', warrantyDateEnd = '', warrantyNotes = '',
                        notes = '', picture = '';
                        
                    if (taDescription.visible)
                        description = taDescription.text
                    if (tfBrand.visible)
                        brand = tfBrand.text
                    if (tfModelNumber.visible)
                        modelNumber = tfModelNumber.text
                    if (tfSerialNumber.visible)
                        serialNumber = tfSerialNumber.text
                    if (tfVersion.visible)
                        version = tfVersion.text
                    if (tfCapacity.visible)
                        capacity = tfCapacity.text
                    if (cntrExpiryDate.visible) {
                        var d = pkrExpiryDate.value.getDate()
                        var m = pkrExpiryDate.value.getMonth()
                        var y = pkrExpiryDate.value.getFullYear()
                        expiryDate = d + "," + m + "," + y
                    }
                    if (tfArtist.visible)
                        artist = tfArtist.text
                    if (tfAuthor.visible)
                        author = tfAuthor.text
                    if (tfGenre.visible)
                        genre = tfGenre.text
                    if (tfYear.visible)
                        year = tfYear.text
                    if (cntrPurchaseDate.visible) {
                        var d = pkrPurchaseDate.value.getDate()
                        var m = pkrPurchaseDate.value.getMonth()
                        var y = pkrPurchaseDate.value.getFullYear()
                        purchaseDate = d + "," + m + "," + y
                    }
                    if (tfPurchaseLocation.visible)
                        purchaseLocation = tfPurchaseLocation.text
                    if (tfPurchaseMethod.visible)
                        purchaseMethod = tfPurchaseMethod.text
                    if (taPurchaseNotes.visible)
                        purchaseNotes = taPurchaseNotes.text
                    if (tfPurchasePrice.visible)
                        purchasePrice = tfPurchasePrice.text
                    if (scWarranty.selectedOption.text == "Yes" && tfWarrantyName.visible)
                        warrantyName = tfWarrantyName.text
                    if (scWarranty.selectedOption.text == "Yes" && tfWarrantyNum.visible)
                        warrantyNum = tfWarrantyNum.text
                    if (scWarranty.selectedOption.text == "Yes" && tfWarrantyNum2.visible)
                        warrantyNum2 = tfWarrantyNum2.text
                    if (scWarranty.selectedOption.text == "Yes" && cntrWarrantyDateStart.visible && cntrWarrantyDate.visible) {
                        var d = pkrWarrantyDateStart.value.getDate()
                        var m = pkrWarrantyDateStart.value.getMonth()
                        var y = pkrWarrantyDateStart.value.getFullYear()
                        warrantyDateStart = d + "," + m + "," + y
                    }
                    if (scWarranty.selectedOption.text == "Yes" && cntrWarrantyDateEnd.visible && cntrWarrantyDate.visible) {
                        var d = pkrWarrantyDateEnd.value.getDate()
                        var m = pkrWarrantyDateEnd.value.getMonth()
                        var y = pkrWarrantyDateEnd.value.getFullYear()
                        warrantyDateEnd = d + "," + m + "," + y
                    }
                    if (scWarranty.selectedOption.text == "Yes" && taWarrantyNotes.visible)
                        warrantyNotes = taWarrantyNotes.text
                    if (taNotes.visible)
                        notes = taNotes.text
                        
                    var pictureSrc = ivPicture.imageSource
                    if (pictureSrc != 'asset:///images/placeholders/items/picker-placeholder.png')
                        picture = pictureSrc
                    
                    // Create item record in items table
                    _app.createRecordItem(
                        roomID,
                        roomName, 
                        locationID, 
                        locationName,
                        btnSelectIcon.imageSource,
                        picture,
                        tfName.text, 
                        description, 
                        ddType.selectedOption.text, 
                        brand,
                        modelNumber,
                        serialNumber,
                        version,
                        capacity,
                        expiryDate,
                        artist,
                        author,
                        genre,
                        year,
                        purchaseDate,
                        purchaseLocation,
                        purchaseMethod,
                        purchaseNotes,
                        purchasePrice,
                        scWarranty.selectedOption.text,
                        warrantyName,
                        warrantyNum,
                        warrantyNum2,
                        warrantyDateStart,
                        warrantyDateEnd,
                        warrantyNotes,
                        notes)
                        
                    // Update records - List in show room
                    _app.readRecordsItemInRoom(roomID)
                    
                    // Update records - List in show location
                    _app.readRecordsItemInLocation(locationID)
                    
                    // Update records - List in items list
                    _app.readRecordsItem()
                    
                    // Update total # of items
                    itemsSource.load()
                    
                    // Update total # of items with warranty
                	warrantySource.load()
                    
                    // Dispose of the sheet
                    sheet.close()
                    
                    // Change tab if adding from dashboard
                    if (activeTab == tabDashboard)
                    	activeTab = tabItems
                }
            }
        } // TITLEBAR - END
        
        ScrollView {
            scrollViewProperties.overScrollEffectMode: OverScrollEffectMode.None // BODY - START
            
            Container { // WRAPPER - START
                Container { // PICTURE - START
                    Container {
                        ImageView {
                            id: ivPicture
                            imageSource: 'asset:///images/placeholders/items/picker-placeholder.png'
                            horizontalAlignment: HorizontalAlignment.Fill
                            scalingMethod: ScalingMethod.AspectFill
                            preferredWidth: 768
                            maxHeight: 768
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
                                
                                ImageTracker { id: itPicture; onStateChanged: { if (state == ResourceState.Loaded) { ivPicture.image = itPicture.image }}}
                            ]
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.create("#333333")
                        visible: (ivPicture.imageSource != 'asset:///images/placeholders/items/picker-placeholder.png')
                        verticalAlignment: VerticalAlignment.Bottom
                        preferredWidth: 768
                        
                        ImageButton {
                            id: btnRemovePicture
                            horizontalAlignment: HorizontalAlignment.Right
                            defaultImageSource: "asset:///images/actionbar/reset.png"
                            onClicked: { ivPicture.imageSource = 'asset:///images/placeholders/items/picker-placeholder.png' }
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#444444")
                        visible: (ivPicture.imageSource != 'asset:///images/placeholders/items/picker-placeholder.png')
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                }  // PICTURE - END
                
                Container { // BODY - START
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Container { // PRESETS - START
                        id: cntrPresets
                        Header { title: "Presets"; subtitle: "Select to auto-fill multiple details." }
                        bottomPadding: 20.0
                        
                        DropDown {
                            id: ddPreset
                            title: "Preset"
                            Option { text: "None"; selected: true }
                            Option { text: "Beverage"; description: "Grocery"
                                onSelectedChanged: 
                                if (selected == true) {
                                    hideAllFields()
                                    divFood.visible = true
                                    tfCapacity.visible = true
                                    cntrExpiryDate.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/cup.png"
                                }
                            }
                            Option { 
                                text: "Computer"
                                description: "Electronic"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Electronic")
                                    hideAllFields()
                                    divWhat.visible = true
                                    tfBrand.visible = true
                                    tfBrand.hintText = "Brand (e.g. Lenovo, Sony)"
                                    tfModelNumber.visible = true
                                    tfSerialNumber.visible = true
                                    tfVersion.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/desktop.png"
                                }
                            }
                            Option { 
                                text: "Game"
                                description: "Entertainment"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Entertainment - Video Game")
                                    hideAllFields()
                                    divWhat.visible = true
                                    tfBrand.visible = true
                                    tfBrand.hintText = "Brand (e.g. PlayStation, Wii)"
                                    btnSelectIcon.imageSource = "asset:///images/items/controller.png"
                                }
                            }
                            Option { text: "Game System"
                                description: "Electronic"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Electronic")
                                    hideAllFields()
                                    divWhat.visible = true
                                    tfBrand.visible = true
                                    tfBrand.hintText = "Brand (e.g. Nintendo, Sony)"
                                    tfVersion.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/controller.png"
                                }
                            }
                            Option { text: "Music"; description: "Entertainment"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Entertainment - Music")
                                    hideAllFields()
                                    divMedia.visible = true
                                    tfArtist.visible = true
                                    tfGenre.visible = true
                                    tfYear.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/music.png"
                                }
                            }
                            Option { 
                                text: "Pants"
                                description: "Wearable"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Wearable - Pants")
                                    hideAllFields()
                                    divWhat.visible = true
                                    tfBrand.visible = true
                                    tfBrand.hintText = "Brand (e.g. Levis)"
                                    tfPurchaseLocation.visible = true
                                    tfPurchasePrice.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/pants.png"
                                }
                            }
                            Option { 
                                text: "Shirt"
                                description: "Wearable"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Wearable - Shirt")
                                    hideAllFields()
                                    divWhat.visible = true
                                    tfBrand.visible = true
                                    tfBrand.hintText = "Brand (e.g. Burberry, Marc Jacobs)"
                                    tfPurchaseLocation.visible = true
                                    tfPurchasePrice.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/shirt2.png"
                                }
                            }
                            Option { text: "Software"
                                description: "Software"
                                onSelectedChanged: 
                                if (selected == true) {
                                    setDropDownOptionByValue(ddType, "Software")
                                    hideAllFields()
                                    divWhat.visible = true
                                    tfBrand.visible = true
                                    tfBrand.hintText = "Brand (e.g. Kaspersky, Norton)"
                                    tfSerialNumber.visible = true
                                    tfVersion.visible = true
                                    btnSelectIcon.imageSource = "asset:///images/items/cd.png"
                                }
                            }
                            
                            onSelectedOptionChanged: { tfName.requestFocus() }
                        }
                    }
                    
                    Container {
                        id: cntrWhat
                        Header { title: "What"; subtitle: "Describe details about the item." }
                        
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            topPadding: 20.0
                            TextField {
                                id: tfName
                                hintText: "Name"
                                
                                onTextChanging: {
                                    if (text.length > 0)
                                        isNameValid = true
                                    
                                    // Room and Location selected 
                                    if (isNameValid == true
	                                    && isRoomSelected == true 
	                                    && isLocationSelected == true)
                                        btnSave.enabled = true
                                    else if (text.length > 0) {
                                        isNameValid = true
                                        btnSelectRoom.enabled = true
                                    }
                                }
                            }
                            
                            Container {
                                background: Color.Red
                                verticalAlignment: VerticalAlignment.Fill
                                minWidth: 5
                            }
                        }
                        
                        TextArea  {
                            id: taDescription
                            hintText: "Description"
                            visible: false
                        }
                        
                        DropDown {
                            id: ddType
                            title: "Type"
                            
                            Option { text: "None"; selected: true }
                            Option { text: "Appliance" }
                            Option { text: "Electronic" }
                            Option { text: "Entertainment - Book" }
                            Option { text: "Entertainment - Music"; description: "e.g. Justin Bieber" }
                            Option { text: "Entertainment - Movie"; description: "e.g. World War Z" }
                            Option { text: "Entertainment - Video Game"; description: "e.g. StarCraft, Call of Duty" }
                            Option { text: "Furniture" }
                            Option { text: "Grocery - Beverage"; description: "e.g. Coke, Pepsi" }
                            Option { text: "Grocery - Condiment"; description: "e.g. ketchup, mustard" }
                            Option { text: "Grocery - Food (Canned)"; description: "e.g. canned tuna, spaghetti sauce" }
                            Option { text: "Grocery - Food (Dried)"; description: "e.g. pasta" }
                            Option { text: "Grocery - Fruit"; description: "e.g. apple, orange" }
                            Option { text: "Grocery - Ingredient"; description: "e.g. flour, sugar" }
                            Option { text: "Grocery - Spice"; description: "e.g. basil, garlic" }
                            Option { text: "Grocery - Vegetable"; description: "e.g. brocolli, spinach" }
                            Option { text: "Lighting" }
                            Option { text: "Medicine" }
                            Option { text: "Vehicle" }
                            Option { text: "Wearable - Jewellery" }
                            Option { text: "Wearable - Pants" }
                            Option { text: "Wearable - Shirt" }
                            Option { text: "Wearable - Shoes" }
                        }
                        
                        Divider { id: divWhat; visible: false }
                        
                        TextField  {
                            id: tfBrand
                            hintText: "Brand (e.g. Bose, Sony)"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfModelNumber
                            hintText: "Model Number (e.g. KDL-46HX853)"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfSerialNumber
                            hintText: "Serial Number"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfVersion
                            hintText: "Version"
                            visible: false
                        }
                        
                        Divider { id: divFood; visible: false }
                        
                        TextField  {
                            id: tfCapacity
                            hintText: "Capacity (e.g. 125mL, 200g)"
                            visible: false
                        }
                        
                        Container {
                            id: cntrExpiryDate
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            visible: false
                            
                            DateTimePicker {
                                id: pkrExpiryDate
                                title: "Expiry Date"
                                horizontalAlignment: HorizontalAlignment.Fill
                            }
                            
                            ImageButton {
                                defaultImageSource: "asset:///images/icons/field_remove.png"
                                pressedImageSource: "asset:///images/icons/field_remove-pressed.png"
                                minWidth: 71
                                horizontalAlignment: HorizontalAlignment.Right
                                verticalAlignment: VerticalAlignment.Center
                                onClicked: { cntrExpiryDate.visible = false }
                            }
                        }
                        
                        Divider { id: divMedia; visible: false }
                        
                        TextField  {
                            id: tfArtist
                            hintText: "Artist (e.g. Justin Bieber)"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfAuthor
                            hintText: "Author (e.g. Margaret Atwood)"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfGenre
                            hintText: "Genre (e.g. Rock, Country)"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfYear
                            inputMode: TextFieldInputMode.NumbersAndPunctuation
                            hintText: "Year (e.g. 1993, 2013)"
                            visible: false
                        }
                    }
                    
                    Container {
                        id: cntrPurchase
                        Header { title: "Purchase"; subtitle: "Details of when you first purchased it." }
                        visible: false 
                        
                        topPadding: 20.0
                        
                        Container {
                            id: cntrPurchaseDate
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            topPadding: 20.0
                            visible: false
                            
                            DateTimePicker {
                                id: pkrPurchaseDate
                                title: "Purchase Date"
                                horizontalAlignment: HorizontalAlignment.Fill
                            }
                            
                            ImageButton {
                                defaultImageSource: "asset:///images/icons/field_remove.png"
                                pressedImageSource: "asset:///images/icons/field_remove-pressed.png"
                                minWidth: 71
                                horizontalAlignment: HorizontalAlignment.Right
                                verticalAlignment: VerticalAlignment.Center
                                onClicked: { cntrPurchaseDate.visible = false }
                            }
                        }
                        
                        TextField  {
                            id: tfPurchaseLocation
                            hintText: "Location (e.g. Best Buy)"
                            visible: false
                        }
                        
                        TextField  {
                            id: tfPurchaseMethod
                            hintText: "Method (e.g. Credit Card)"
                            visible: false
                        }
                        
                        TextField {
                            id: tfPurchasePrice
                            hintText: 'Price (e.g. 123, 4.56, 0.98)'
                            inputMode: TextFieldInputMode.NumbersAndPunctuation
                            visible: false
                            onTextChanging: {
                                var p = tfPurchasePrice.text
                                var d = p.indexOf('.')
                                if (isNaN(p))
                                    tfPurchasePrice.text = p.substring(0, p.length - 1)
                                else if (d != -1 && (d + 3) < p.length)
                                    tfPurchasePrice.text = p.substring(0, p.length - 1)
                            }
                        }
                        
                        TextArea  {
                            id: taPurchaseNotes
                            hintText: "Notes"
                            visible: false
                        }
                    }
                    
                    Container {
                        id: cntrWarranty
                        Header { title: "Warranty"; subtitle: "Information regarding the warranty." }
                        
                        visible: false 
                        
                        topPadding: 20.0
                        
                        SegmentedControl {
                            id: scWarranty
                            Option { text: "No" }
                            Option { text: "Yes" }
                            onSelectedOptionChanged: {
                                if (selectedOption.text == "Yes")
                                    cntrWarrantyFields.visible = true
                                else
                                    cntrWarrantyFields.visible = false
                            }
                        }
                        
                        Container {
                            id: cntrWarrantyFields
                            visible: false
                            
                            TextField {
                                id: tfWarrantyName
                                hintText: "Contact Name"
                                visible: false
                            }
                            
                            Container {
                                id: cntrWarrantyDate
                                visible: false 
                                
                                Container {
                                    id: cntrWarrantyDateStart
                                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                                    
                                    DateTimePicker {
                                        id: pkrWarrantyDateStart
                                        title: "Start"
                                        horizontalAlignment: HorizontalAlignment.Fill
                                    }
                                    
                                    ImageButton {
                                        defaultImageSource: "asset:///images/icons/field_remove.png"
                                        pressedImageSource: "asset:///images/icons/field_remove-pressed.png"
                                        minWidth: 71
                                        horizontalAlignment: HorizontalAlignment.Right
                                        verticalAlignment: VerticalAlignment.Center
                                        onClicked: { 
                                            cntrWarrantyDateStart.visible = false
                                            lblWarranty.visible = false
                                            if (cntrWarrantyDateEnd.visible == false)
                                                cntrWarrantyDate.visible = false
                                        }
                                    }
                                }
                                
                                Label {
                                    id: lblWarranty
                                    text: "to"
                                    horizontalAlignment: HorizontalAlignment.Center
                                    verticalAlignment: VerticalAlignment.Center
                                }
                                
                                Container {
                                    id: cntrWarrantyDateEnd
                                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                                    
                                    DateTimePicker {
                                        id: pkrWarrantyDateEnd
                                        title: "End"
                                        horizontalAlignment: HorizontalAlignment.Fill
                                    }
                                    
                                    ImageButton {
                                        defaultImageSource: "asset:///images/icons/field_remove.png"
                                        pressedImageSource: "asset:///images/icons/field_remove-pressed.png"
                                        minWidth: 71
                                        horizontalAlignment: HorizontalAlignment.Right
                                        verticalAlignment: VerticalAlignment.Center
                                        onClicked: { 
                                            cntrWarrantyDateEnd.visible = false
                                            lblWarranty.visible = false 
                                            if (cntrWarrantyDateStart.visible == false)
                                                cntrWarrantyDate.visible = false
                                        }
                                    }
                                }
                            }
                            
                            TextField {
                                id: tfWarrantyNum
                                hintText: "Contact Phone Number"
                                inputMode: TextFieldInputMode.PhoneNumber
                                visible: false
                                onTextChanging: {
                                    var field = tfWarrantyNum
                                    // Filter out non-numbers
                                    if (isNaN(text.charAt(text.length - 1)) || text.charAt(text.length - 1) == ' ') {
                                        field.text = text.substring(0, text.length - 1)
                                        
                                        // Insert bracket in front of area code
                                    } else if (text.length == 1) {
                                        if (!isNaN(text)) {
                                            var s = text
                                            field.text = '(' + s
                                        }
                                        
                                        // Insert bracket at end of area code
                                    } else if (text.length == 5) {
                                        var beg = text.substring(0, text.length - 1)
                                        var end = text.charAt(text.length - 1)
                                        field.text = beg + ') ' + end
                                        
                                        // Insert hyphen in mid of 3-4
                                    } else if (text.length == 10) {
                                        var beg = text.substring(0, text.length - 1)
                                        var end = text.charAt(text.length - 1)
                                        field.text = beg + '-' + end
                                        
                                        // Limit length of phone number
                                    } else if (text.length == 15) {
                                        field.text = text.substring(0, text.length - 1)
                                    }
                                }
                            }
                            
                            TextField {
                                id: tfWarrantyNum2
                                hintText: "Contact Phone Number (Alt.)"
                                inputMode: TextFieldInputMode.PhoneNumber
                                visible: false
                                onTextChanging: {
                                    var field = tfWarrantyNum
                                    // Filter out non-numbers
                                    if (isNaN(text.charAt(text.length - 1)) || text.charAt(text.length - 1) == ' ') {
                                        field.text = text.substring(0, text.length - 1)
                                        
                                        // Insert bracket in front of area code
                                    } else if (text.length == 1) {
                                        if (!isNaN(text)) {
                                            var s = text
                                            field.text = '(' + s
                                        }
                                        
                                        // Insert bracket at end of area code
                                    } else if (text.length == 5) {
                                        var beg = text.substring(0, text.length - 1)
                                        var end = text.charAt(text.length - 1)
                                        field.text = beg + ') ' + end
                                        
                                        // Insert hyphen in mid of 3-4
                                    } else if (text.length == 10) {
                                        var beg = text.substring(0, text.length - 1)
                                        var end = text.charAt(text.length - 1)
                                        field.text = beg + '-' + end
                                        
                                        // Limit length of phone number
                                    } else if (text.length == 15) {
                                        field.text = text.substring(0, text.length - 1)
                                    }
                                }
                            }
                            
                            TextArea  {
                                id: taWarrantyNotes
                                hintText: "Notes"
                                visible: false
                            }
                        }
                    }
                    
                    Container {
                        id: cntrMore
                        Header { title: "More"; subtitle: "Anything else you want to tell me?" }
                        
                        visible: false 
                        
                        topPadding: 20.0
                        
                        TextArea  {
                            id: taNotes
                            hintText: "Notes"
                            visible: false
                        }
                    }
                    
                    Container {
                        id: cntrWhere
                        Header { title: "Where"; subtitle: "Where'd you put this item?" }
                        
                        topPadding: 20.0
                        Container {
                            topPadding: 20.0
                            bottomPadding: 20.0
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
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
                                
                                onClicked: {
                                    _app.readRecordsRoom()
                                    showSelectRoom()
                                    btnSelectLocation.enabled = true
                                }
                                
                                // Room already set from adding item from show location
                                onCreationCompleted: {
                                    if (text != 'Select A Room'){
                                        enabled: false
                                        isRoomSelected = true
                                    }
                                }
                                
                                onTextChanged: {
                                    // User chooses another room after selecting a location 
                                    // in the previous room
                                    if (text != 'Select A Room') {
                                        btnSelectLocation.setText('Select A Location')
                                        isRoomSelected = true
                                        btnSave.enabled = false
                                    } else
                                        isRoomSelected = false
                                }
                                
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
                        
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            Button {
                                id: btnSelectLocation
                                text: locationName
                                enabled: false
                                preferredWidth: 768
                                attachedObjects: [
                                    ComponentDefinition {
                                        id: selectLocationDef
                                        source: "select/selectLocation.qml"
                                    }
                                ]
                                
                                // Location already set from adding item from show location
                                onCreationCompleted: {
                                    if(locationName != 'Select A Location') {
                                        enabled: false
                                        isLocationSelected = true
                                    }
                                }
                                
                                onTextChanged: {
                                    if(locationName != 'Select A Location') 
                                        isLocationSelected = true
                                    else
                                        isLocationSelected = false
                                }
                                
                                onClicked: {
                                    _app.readRecordsLocationInRoom(roomID);
                                    showSelectLocation();
                                }
                                
                                function showSelectLocation() {
                                    var selectLocation = selectLocationDef.createObject(selectLocationDef)
                                    selectLocation.roomID = roomID
                                    selectLocation.roomName = roomName
                                    selectLocation.open()
                                }
                            }
                            
                            Container {
                                background: Color.Red
                                verticalAlignment: VerticalAlignment.Fill
                                minWidth: 5
                            }
                        }
                    }
                    
                    Container {
                        Header { title: "Appearance"; subtitle: "What does the item look like?" }
                        
                        topPadding: 20.0
                        
                        Button {
                            id: btnSelectIcon
                            text: "Select Icon"
                            imageSource: "asset:///images/items/item.png"
                            preferredWidth: 768
                            attachedObjects: [
                                ComponentDefinition {
                                    id: sheetAddIconDef
                                    source: "select/selectIconItem.qml"  
                                }
                            ]
                            
                            onClicked: { showSelectIcon() }
                            
                            function showSelectIcon() {
                                var selectIcon = sheetAddIconDef.createObject(sheetAddIconDef)
                                selectIcon.open()
                            }
                        }
                    }
                } // BODY - END
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
                        source: "fields/addFieldItem.qml"  
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
    
    // Hide all fields
    function hideAllFields() {
        tfBrand.visible = false
        divFood.visible = false
        divMedia.visible = false
        divWhat.visible = false
        taDescription.visible = false
        tfModelNumber.visible = false
        tfSerialNumber.visible = false
        tfVersion.visible = false
        tfCapacity.visible = false
        cntrExpiryDate.visible = false
        tfArtist.visible = false
        tfGenre.visible = false
        tfYear.visible = false
        cntrPurchaseDate.visible = false
        tfPurchaseLocation.visible = false
        tfPurchaseMethod.visible = false
        taPurchaseNotes.visible = false
        tfPurchasePrice.visible = false
        tfWarrantyName.visible = false
        tfWarrantyNum.visible = false
        tfWarrantyNum2.visible = false
        taWarrantyNotes.visible = false
        taNotes.visible = false
    }
    
    // Search for option with the specified text and set the selected index to that
    function setDropDownOptionByValue(dropdown, value) {
        for (var i = 0; i < dropdown.options.length; i++) {
            var o = dropdown.options[i];
            if (o.text == value) {
                dropdown.setSelectedOption(o);
                dropdown.setVisible(true);
                return true;
            }
        }
        return false;
    }
}