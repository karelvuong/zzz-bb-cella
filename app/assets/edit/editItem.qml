import bb.cascades 1.0
import bb.system 1.0
import bb.cascades.pickers 1.0

Sheet { 
    id: sheetEdit
    Page {
        titleBar: TitleBar {
            dismissAction: ActionItem { title: "Cancel"; onTriggered: { sheetEdit.close() }}
            title: "Edit Item"
            acceptAction: ActionItem {
                id: btnSave
                title: "Save"
                onTriggered: { editDialog.show() }
            }
            
            attachedObjects: [
                SystemDialog {
                    id: editDialog
                    title: "Save Item?"
                    body: "This will update the selected item."
                    defaultButton: SystemUiButton { label: "Save" }
                    onFinished: {
                        if (editDialog.result == 
                        SystemUiResult.ConfirmButtonSelection) {
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
                            if (tfArtist.visible)
                                artist = tfArtist.text
                            if (tfAuthor.visible)
                                author = tfAuthor.text
                            if (tfGenre.visible)
                                genre = tfGenre.text
                            if (tfYear.visible)
                                year = tfYear.text
                            if (cntrExpiryDate.visible) {
                                var expiryDay = pkrExpiryDate.value.getDate()
                                var expiryMonth = pkrExpiryDate.value.getMonth()
                                var expiryYear = pkrExpiryDate.value.getFullYear()
                                expiryDate = expiryDay + "," + expiryMonth + "," + expiryYear
                            }
                            if (cntrPurchaseDate.visible) {
                                var purchaseDay = pkrPurchaseDate.value.getDate()
                                var purchaseMonth = pkrPurchaseDate.value.getMonth()
                                var purchaseYear = pkrPurchaseDate.value.getFullYear()
                                purchaseDate = purchaseDay + "," + purchaseMonth + "," + purchaseYear
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
                            
                            // Update the current item
                            _app.updateRecordItem(
                                itemID,
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
                                
                            // Update properties in show item
                            itemImg = btnSelectIcon.imageSource
                            itemPicture = picture
                            itemName = tfName.text
                            itemDescription = description
                            itemType = ddType.selectedOption.text
                            itemBrand = brand
                            itemCapacity = capacity
                            itemExpiryDate = expiryDate
                            itemModelNumber = modelNumber
                            itemSerialNumber = serialNumber
                            itemVersion = version
                            itemArtist = artist
                            itemAuthor = author
                            itemGenre = genre
                            itemYear = year
                            itemPurchaseDate = purchaseDate
                            itemPurchaseLocation = purchaseLocation
                            itemPurchaseMethod = purchaseMethod
                            itemPurchasePrice = purchasePrice
                            itemPurchaseNotes = purchaseNotes
                            itemWarranty = scWarranty.selectedOption.text
                            itemWarrantyName = warrantyName
                            itemWarrantyNum = warrantyNum
                            itemWarrantyNum2 = warrantyNum2
                            itemWarrantyDateStart = warrantyDateStart
                            itemWarrantyDateEnd = warrantyDateEnd
                            itemWarrantyNotes = warrantyNotes
                            itemNotes = notes
                            
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
                            sheetEdit.close()
                        }
                    }
                }
            ]
        }
        
        ScrollView { 
            scrollViewProperties.overScrollEffectMode: OverScrollEffectMode.None // BODY - START
            
            Container { // WRAPPER - START
                Container { // PICTURE - START
                    Container {
                        ImageView {
                            id: ivPicture
                            imageSource: (itemPicture.length > 0 ? itemPicture : 'asset:///images/placeholders/items/picker-placeholder.png')
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
                
	            Container { // WRAPPER - START
	                topPadding: 20.0
	                rightPadding: 20.0
	                bottomPadding: 20.0
	                leftPadding: 20.0
	                Container { // WHAT - START
	                    id: cntrWhat
	                    Header { title: "What"; subtitle: "Describe details about the item." }
	                    
	                    Container {
	                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
	                        topPadding: 20.0
	                        TextField {
	                            id: tfName
	                            text: itemName
	                            hintText: "Name"
	                            
	                            onTextChanging: 
	                                if (text.trim().length > 0)
	                                    btnSave.enabled = true
	                                else
	                                	btnSave.enabled = false
	                        }
	                        
	                        Container {
	                            background: Color.Red
	                            verticalAlignment: VerticalAlignment.Fill
	                            minWidth: 5
	                        }
	                    }
	                    
	                    TextArea  {
	                        id: taDescription
	                        text: itemDescription
	                        hintText: "Description"
	                        visible: (itemDescription.length > 0)
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
	                        
	                        // Autofill type if it exists in items table
	                        onCreationCompleted: {
	                            if(itemType != 'None') {
	                                ddType.visible = true
	                                
	                                for (var i = 0; i < ddType.count(); i++) {
	                                    var o = ddType.at(i);
	                                    if(o.text == itemType)
	                                        ddType.setSelectedIndex(i);
	                                }
	                            } else
	                                ddType.setSelectedIndex(0); // None
	                        }
	                    }
	                    
	                    Divider { id: divWhat; visible: false }
	                    
	                    TextField  {
	                        id: tfBrand
	                        text: itemBrand
	                        hintText: "Brand (e.g. Bose, Sony)"
	                        visible: (itemBrand.length > 0)
	                    }
	                    
	                    TextField  {
	                        id: tfModelNumber
	                        text: itemModelNumber
	                        hintText: "Model Number (e.g. KDL-46HX853)"
	                        visible: (itemModelNumber.length > 0)
	                    }
	                    
	                    TextField  {
	                        id: tfSerialNumber
	                        text: itemSerialNumber
	                        hintText: "Serial Number"
	                        visible: (itemSerialNumber.length > 0)
	                    }
	                    
	                    TextField  {
	                        id: tfVersion
	                        text: itemVersion
	                        hintText: "Version"
	                        visible: (itemVersion.length > 0)
	                    }
	                    
	                    Divider { id: divFood; visible: false }
	                    
	                    TextField  {
	                        id: tfCapacity
	                        text: itemCapacity
	                        hintText: "Capacity (e.g. 125mL, 200g)"
	                        visible: (itemCapacity.length > 0)
	                    }
	                    
	                    Container {
	                        id: cntrExpiryDate
	                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
	                        visible: (itemExpiryDate.length > 0)
	                        
	                        DateTimePicker {
	                            id: pkrExpiryDate
	                            title: "Expiry Date"
	                            horizontalAlignment: HorizontalAlignment.Fill
	                            
	                            onCreationCompleted: {
	                                if (itemExpiryDate.length > 0) {
	                                    value = new Date(itemExpiryDate.split(',')[2],
	                                    itemExpiryDate.split(',')[1],
	                                    itemExpiryDate.split(',')[0])
	                                }
	                            }
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
	                        text: itemArtist
	                        hintText: "Artist (e.g. Justin Bieber)"
	                        visible: (itemArtist.length > 0)
	                    }
	                    
	                    TextField  {
	                        id: tfAuthor
	                        text: itemAuthor
	                        hintText: "Author (e.g. Margaret Atwood)"
	                        visible: (itemAuthor.length > 0)
	                    }
	                    
	                    TextField  {
	                        id: tfGenre
	                        text: itemGenre
	                        hintText: "Genre (e.g. Rock, Country)"
	                        visible: (itemGenre.length > 0)
	                    }
	                    
	                    TextField  {
	                        id: tfYear
	                        text: itemYear
	                        hintText: "Year (e.g. 1993, 2013)"
	                        inputMode: TextFieldInputMode.NumbersAndPunctuation
	                        visible: (itemYear.length > 0)
	                    }
	                }
	                
	                Container { 
	                    id: cntrPurchase
	                    Header { title: "Purchase"; subtitle: "Details of when you first purchased it." }
	                    visible: isPurchaseVisible()
	                    
	                    topPadding: 20
	                    
	                    Container {
	                        topPadding: 20
	                        Container {
	                            id: cntrPurchaseDate
	                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
	                            visible: (itemPurchaseDate.length > 0)
	                            
	                            DateTimePicker {
	                                id: pkrPurchaseDate
	                                title: "Purchase Date"
	                                
	                                onCreationCompleted: {
	                                    if (itemPurchaseDate.length > 0) {
	                                        value = new Date(itemPurchaseDate.split(',')[2],
	                                        itemPurchaseDate.split(',')[1],
	                                        itemPurchaseDate.split(',')[0])
	                                    }
	                                }
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
	                        
	                        TextField {
	                            id: tfPurchasePrice
	                            text: itemPurchasePrice
	                            hintText: "Purchase Price (e.g. 123.45, 67, 0.98)"
	                            inputMode: TextFieldInputMode.NumbersAndPunctuation
	                            visible: (itemPurchasePrice.length > 0)
	                            onTextChanging: {
	                                var p = tfPurchasePrice.text
	                                var d = p.indexOf('.')
	                                if (!/^[0-9.]*$/.test(p))
	                                    tfPurchasePrice.text = p.substring(0, p.length - 1)
	                                if (isNaN(p))
	                                    tfPurchasePrice.text = p.substring(0, p.length - 1)
	                                if (d != -1 && (d + 3) < p.length)
	                                    tfPurchasePrice.text = p.substring(0, p.length - 1)
	                            }
	                        }
	                        
	                        TextField  {
	                            id: tfPurchaseLocation
	                            text: itemPurchaseLocation
	                            hintText: "Purchase Location (e.g. Best Buy)"
	                            visible: (itemPurchaseLocation.length > 0)
	                        }
	                        
	                        TextField  {
	                            id: tfPurchaseMethod
	                            text: itemPurchaseMethod
	                            hintText: "Purchase Method (e.g. Cash, Credit Card)"
	                            visible: (itemPurchaseMethod.length > 0)
	                        }
	                        
	                        TextArea  {
	                            id: taPurchaseNotes
	                            text: itemPurchaseNotes
	                            hintText: "Notes"
	                            visible: (itemPurchaseNotes.length > 0)
	                        }
	                    }
	                }
	                
	                Container {
	                    id: cntrWarranty
	                    Header { title: "Warranty"; subtitle: "Information regarding the warranty." }
	                    
	                    visible: isWarrantyVisible() 
	                    
	                    topPadding: 20
	                    
	                    SegmentedControl {
	                        id: scWarranty
	                        Option { text: "No" }
	                        Option { text: "Yes"; selected: itemWarranty == 'Yes' }
	                        
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
	                            text: itemWarrantyName
	                            hintText: "Contact Name"
	                            visible: (itemWarrantyName.length > 0)
	                        }
	                        
	                        Container {
	                            id: cntrWarrantyDate
	                            visible: (cntrWarrantyDateStart.visible || cntrWarrantyDateEnd.visible)
	                            
	                            Container {
	                                id: cntrWarrantyDateStart
	                                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
	                                visible: (itemWarrantyDateStart.length > 0)
	                                
	                                DateTimePicker {
	                                    id: pkrWarrantyDateStart
	                                    title: "Start"
	                                    horizontalAlignment: HorizontalAlignment.Fill
	                                    
	                                    onCreationCompleted: {
	                                        if (itemWarrantyDateStart.length > 0) {
	                                            value = new Date(itemWarrantyDateStart.split(',')[2],
	                                            				 itemWarrantyDateStart.split(',')[1],
	                                            				 itemWarrantyDateStart.split(',')[0])
	                                        }
	                                    }
	                                }
	                                
	                                ImageButton {
	                                    defaultImageSource: "asset:///images/icons/field_remove.png"
	                                    pressedImageSource: "asset:///images/icons/field_remove-pressed.png"
	                                    minWidth: 71
	                                    horizontalAlignment: HorizontalAlignment.Right
	                                    verticalAlignment: VerticalAlignment.Center
	                                    onClicked: {  cntrWarrantyDateStart.visible = false; lblWarranty.visible = false }
	                                }
	                            }
	                            
	                            Label {
	                                id: lblWarranty
	                                text: "to"
	                                horizontalAlignment: HorizontalAlignment.Center
	                                verticalAlignment: VerticalAlignment.Center
	                                visible: (cntrWarrantyDateStart.visible && cntrWarrantyDateEnd.visible)
	                            }
	                            
	                            Container {
	                                id: cntrWarrantyDateEnd
	                                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
	                                visible: (itemWarrantyDateEnd.length > 0)
	                                
	                                DateTimePicker {
	                                    id: pkrWarrantyDateEnd
	                                    title: "End"
	                                    horizontalAlignment: HorizontalAlignment.Fill
	                                    
	                                    onCreationCompleted: {
	                                        if (itemWarrantyDateEnd.length > 0) {
	                                            value = new Date(itemWarrantyDateEnd.split(',')[2],
					                                             itemWarrantyDateEnd.split(',')[1],
					                                             itemWarrantyDateEnd.split(',')[0])
	                                        }
	                                    }
	                                }
	                                
	                                ImageButton {
	                                    defaultImageSource: "asset:///images/icons/field_remove.png"
	                                    pressedImageSource: "asset:///images/icons/field_remove-pressed.png"
	                                    minWidth: 71
	                                    horizontalAlignment: HorizontalAlignment.Right
	                                    verticalAlignment: VerticalAlignment.Center
	                                    onClicked: { cntrWarrantyDateEnd.visible = false; lblWarranty.visible = false }
	                                }
	                            }
	                        }
	                        
	                        TextField {
	                            id: tfWarrantyNum
	                            text: itemWarrantyNum
	                            hintText: "Phone Number (e.g. (416) 123-4567)"
	                            inputMode: TextFieldInputMode.PhoneNumber
	                            visible: (itemWarrantyNum.length > 0)
	                            onTextChanging: {
	                                var tf = tfWarrantyNum
	                                // Filter out non-numbers
	                                if (isNaN(text.charAt(text.length - 1)) || text.charAt(text.length - 1) == ' ') {
	                                    tf.text = text.substring(0, text.length - 1)
	                                    
	                                // Insert bracket in front of area code
	                                } else if (text.length == 1) {
	                                    if (!isNaN(text)) {
	                                        var s = text
	                                        tf.text = '(' + s
	                                    }
	                                    
	                                // Insert bracket at end of area code
	                                } else if (text.length == 5) {
	                                    var beg = text.substring(0, text.length - 1)
	                                    var end = text.charAt(text.length - 1)
	                                    tf.text = beg + ') ' + end
	                                    
	                                // Insert hyphen in mid of 3-4
	                                } else if (text.length == 10) {
	                                    var beg = text.substring(0, text.length - 1)
	                                    var end = text.charAt(text.length - 1)
	                                    tf.text = beg + '-' + end
	                                    
	                                // Limit length of phone number
	                                } else if (text.length == 15)
	                                    tf.text = text.substring(0, text.length - 1)
	                            }
	                        }
	                        
	                        TextField {
	                            id: tfWarrantyNum2
	                            text: itemWarrantyNum2
	                            hintText: "Phone Number (Alt.) (e.g. (416) 123-4567)"
	                            inputMode: TextFieldInputMode.PhoneNumber
	                            visible: (itemWarrantyNum2.length > 0)
	                            onTextChanging: {
	                                var tf = tfWarrantyNum2
	                                // Filter out non-numbers
	                                if (isNaN(text.charAt(text.length - 1)) || text.charAt(text.length - 1) == ' ') {
	                                    tf.text = text.substring(0, text.length - 1)
	                                    
	                                    // Insert bracket in front of area code
	                                } else if (text.length == 1) {
	                                    if (!isNaN(text)) {
	                                        var s = text
	                                        tf.text = '(' + s
	                                    }
	                                    
	                                    // Insert bracket at end of area code
	                                } else if (text.length == 5) {
	                                    var beg = text.substring(0, text.length - 1)
	                                    var end = text.charAt(text.length - 1)
	                                    tf.text = beg + ') ' + end
	                                    
	                                    // Insert hyphen in mid of 3-4
	                                } else if (text.length == 10) {
	                                    var beg = text.substring(0, text.length - 1)
	                                    var end = text.charAt(text.length - 1)
	                                    tf.text = beg + '-' + end
	                                    
	                                    // Limit length of phone number
	                                } else if (text.length == 15)
	                                    tf.text = text.substring(0, text.length - 1)
	                            }
	                        }
	                        
	                        TextArea  {
	                            id: taWarrantyNotes
	                            text: itemWarrantyNotes
	                            hintText: "Notes"
	                            visible: (itemWarrantyNotes.length > 0)
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
	                        text: itemNotes
	                        hintText: "Notes"
	                        visible: (itemNotes.length > 0)
	                    }
	                }
	                
	                Container {
	                    id: cntrWhere
	                    Header { title: "Where"; subtitle: "Where'd you put this item?" }
	                    topPadding: 20.0
	                    
	                    Button { text: roomName; enabled: false; preferredWidth: 768 }
	                    Button { text: locationName; enabled: false; preferredWidth: 768 }
	                }
	                
	                Container {
	                    Header { title: "Appearance"; subtitle: "What does the item look like?" }
	                    
	                    topPadding: 20.0
	                        
	                    Button {
	                        id: btnSelectIcon
	                        text: "Select Icon"
	                        imageSource: itemImg
	                        preferredWidth: 768
	                        
	                        attachedObjects: [
	                            ComponentDefinition {
	                                id: sheetAddIconDef
	                                source: "../add/select/selectIconItem.qml"  
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
        }        
        
        actions: [ // ACTION-BAR - START
            ActionItem {
                title: "Add Field"
                imageSource: "asset:///images/actionbar/add_field.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                attachedObjects: [
                    ComponentDefinition {
                        id: sheetAddFieldDef
                        source: "../add/fields/addFieldItem.qml"
                    }
                ]
                
                onTriggered: { showAddField() }
                
                function showAddField() {
                    var addField = sheetAddFieldDef.createObject(sheetAddFieldDef)
                    addField.open()
                }
            }
        ] // ACTION-BAR - END
    }
    
    // HELPER FUNCTIONS
    function isPurchaseVisible() {
        return (tfPurchaseLocation.visible
	        || tfPurchaseMethod.visible
	        || tfPurchasePrice.visible
	        || taPurchaseNotes.visible)
    }
    
    function isWarrantyVisible() {
        return (tfWarrantyName.visible
	        || itemWarranty == 'Yes'
            || cntrWarrantyDate.visible
	        || tfWarrantyNum.visible
	        || tfWarrantyNum2.visible
	        || taWarrantyNotes.visible)
    }
}
