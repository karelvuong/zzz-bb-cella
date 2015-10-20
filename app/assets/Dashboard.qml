import bb.cascades 1.0

Page {
    property Sheet addRoom
    property Sheet addLocation
    property Sheet addItem
    
    property int minSlide: 1
    property int slide: 1
    property int maxSlide: 2
    
    property string quote: 'Out of clutter, find simplicity.'
    
    // DEBUGGING PROPERTIES
//    property int roomsTotal: 2
//    property int locationsTotal: 8
//    property int itemsTotal: 16
//    property int warrantyTotal: 3
//    property real valueTotal: 3
    
    // Occurs when app is first opened
    onCreationCompleted: {
        // Calculate total # of rooms
        roomsSource.load() 
        
        // Calculate total # of locations
        locationsSource.load()
        
        // Calculate total # of items
        itemsSource.load() 
        
        // Calculate total # of items with warranty
        warrantySource.load() 
        
        // Calculate total value
        valueSource.load() 
    }
    
    Container {
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                leftPadding: 30
                verticalAlignment: VerticalAlignment.Center
                
                ImageView { imageSource: "asset:///images/logos/logo.png" }
            }
        } // HEADER - END
        
        // ROW 1 - START
        Container {
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            
            // ROOMS - START
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                gestureHandlers: [ TapHandler { onTapped: { _app.readRecordsRoom(); activeTab = tabRooms }}]
                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-room.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>" + getRoomsTotal() + "</strong></span>"
                            textFormat: TextFormat.Html
                            
                            function getRoomsTotal() {
                                if (roomsTotal > 0)
                                    return roomsTotal - 1
                                return roomsTotal
                            }
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>" + getRoomsPlural() + "</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                                
                                function getRoomsPlural() {
                                    if ((roomsTotal - 1) == 1)
                                        return "ROOM"
                                    return "ROOMS"
                                }
                            }
                        }
                    }
                }
            } // ROOMS - END
            
            // LOCATIONS - START
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                gestureHandlers: [ TapHandler { onTapped: { _app.readRecordsLocation(); activeTab = tabLocations }}]
                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-location.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>" + getLocationsTotal() + "</strong></span>"
                            textFormat: TextFormat.Html
                            
                            function getLocationsTotal() {
                                if (locationsTotal > 0)
                                    return locationsTotal - 1
                                return locationsTotal
                            }
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>" + getLocationsPlural() + "</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                                
                                function getLocationsPlural() {
                                    if ((roomsTotal - 1) == 1)
                                        return "LOCATION"
                                    return "LOCATIONS"
                                }
                            }
                        }
                    }
                }
            } // LOCATIONS - END
        } // ROW 1 - END
        
        // ROW 2 - START
        Container {
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            
            // ITEMS - START
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                gestureHandlers: [ TapHandler { onTapped: { _app.readRecordsItem(); activeTab = tabItems }}]
                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-item.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>" + getItemsTotal() + "</strong></span>"
                            textFormat: TextFormat.Html
                            
                            function getItemsTotal() {
                                if (itemsTotal > 0)
                                    return itemsTotal - 1
                                return itemsTotal
                            }
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>" + getItemsPlural() + "</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                                
                                function getItemsPlural() {
                                    if ((itemsTotal - 1) == 1)
                                        return "ITEM"
                                    return "ITEMS"
                                }
                            }
                        }
                    }
                }
            } // ITEMS - END
            
            // WARRANTIES - START
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                gestureHandlers: [ TapHandler { onTapped: { _app.readRecordsItem(); activeTab = tabItems }}]
                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-warranty.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>" + getWarrantyTotal() + "</strong></span>"
                            textFormat: TextFormat.Html
                            
                            function getWarrantyTotal() {
                                if (warrantyTotal > 0)
                                    return warrantyTotal - 1
                                return warrantyTotal
                            }
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>" + getWarrantiesPlural() + "</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                                
                                function getWarrantiesPlural() {
                                    if ((warrantyTotal - 1) == 1)
                                        return "WARRANTY"
                                    return "WARRANTIES"
                                }
                            }
                        }
                    }
                }
            } // WARRANTIES - END
        } // ROW 2 - END
        
        Container { // SEPARATOR - START
            background: Color.create("#DEDEDE")
            horizontalAlignment: HorizontalAlignment.Fill
            preferredHeight: 5
        } // SEPARATOR - END
        
        // ROW 3 - START
        Container {
            id: cntrHouse
            background: Color.create("#EAEAEA")
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            gestureHandlers: [ TapHandler { onTapped: { activeTab = tabHome }}]
            
            ImageView { imageSource: "asset:///images/icons/dashboard/icon-house.png" }
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                layout: DockLayout {}
                leftPadding: 120
                
                // ADDRESS - START
                Container {
                    Label {
                        text: "<span style='font-size: 40px'><strong>" + getStreetAddress() + "</strong></span>"
                        textFormat: TextFormat.Html
                    }
                } // ADDRESS - END
                
                // CITY, PROVINCE/STATE, COUNTRY - START
                Container {
                    topPadding: 50
                    Label {
                        text: "<span style='font-size: 30px'>" + getCivicAddress() + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.fontWeight: FontWeight.W100
                    }
                } // CITY, PROVINCE/STATE, COUNTRY - END
                
                // STORIES - START
                Container {
                    topPadding: 90
                    Container {
                        Label {
                            text: "<span style='font-size: 30px'>" + checkStories() + "</span>"
                            textFormat: TextFormat.Html
                            textStyle.fontWeight: FontWeight.W100
                        }
                    }
                } // STORIES - END
                
                // SQ FT. - START
                Container {
                    topPadding: 140
                    Container {
                        Label {
                            text: "<span style='font-size: 50px'>" + checkSqFt() + "</span>"
                            textFormat: TextFormat.Html
                            textStyle.fontWeight: FontWeight.W100
                        }
                    }
                } // SQ FT. - END
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                Label {
                    text: "<span style='font-size: 20px; letter-spacing: 2px'>HOME</span>"
                    textFormat: TextFormat.Html
                }
            }
        } // ROW 3 - END
        
        // SEPARATOR - START
        Container {
            background: Color.create("#DEDEDE")
            horizontalAlignment: HorizontalAlignment.Fill
            preferredHeight: 5
        } // SEPARATOR - END
        
        // CAROUSEL - START
        Container {
            layout: DockLayout {}
            layoutProperties: StackLayoutProperties { spaceQuota: 1 }
            horizontalAlignment: HorizontalAlignment.Fill
            
            // VALUE - START
            Container {
                visible: (slide == 1)
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "<span style='font-size: 40px'>You own</span>"
                        textFormat: TextFormat.Html
                    }
                    
                    Container {
                        background: Color.create("#A6D168")
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        topPadding: 10
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 10
                        
                        Label {
                            text: "<span style='font-size: 60px'><strong>" + getValue() + "</strong></span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            
                            function getValue() {
                                var n = valueTotal;
                                if (n >= 1000000000) {
                                    return '$' + (n / 1000000000).toFixed(1) + 'B';
                                }
                                if (n >= 1000000) {
                                    return '$' + (n / 1000000).toFixed(1) + 'M';
                                }
                                if (n >= 1000) {
                                    return '$' + (n / 1000).toFixed(1) + 'K';
                                }
                                
                                var num = n.toString().replace(/\$|\,/g, '');
                                num = Math.floor(num * 100 + 0.50000000001);
                                var cents = num % 100;
                                num = Math.floor(num / 100).toString();
                                if (cents < 10) cents = "0" + cents;
                                for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
                                num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
                                return ('$' + num + '.' + cents);
                            }
                        }
                    }
                    
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "<span style='font-size: 40px'>worth of stuff.</span>"
                        textFormat: TextFormat.Html
                    }    
                }
            } // VALUE- END
            
            Container { // QUOTE - START
                visible: (slide == 2)
                layout: DockLayout {}
                
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                leftPadding: 120
                rightPadding: 120
                
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    text: "<span style='font-size: 40px'><em>" + quote + "</em></span>"
                    textFormat: TextFormat.Html
                    textStyle.fontWeight: FontWeight.W100
                    textStyle.textAlign: TextAlign.Center
                    multiline: true
                }
            } // QUOTE- END
            
            // PREVIOUS ARROW - START
            Container {
                leftPadding: 20 
                verticalAlignment: VerticalAlignment.Center
                ImageView { imageSource: "asset:///images/icons/dashboard/previous.png" }
                gestureHandlers: TapHandler { onTapped: { getRandomQuote(); if(slide == minSlide) { slide = maxSlide } else { slide += -1}}}
            } // PREVIOUS ARROW - START
            
            Container { // NEXT ARROW - START
                rightPadding: 20 
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                ImageView { imageSource: "asset:///images/icons/dashboard/next.png" }
                gestureHandlers: TapHandler { onTapped: { getRandomQuote(); if(slide == maxSlide) { slide = minSlide } else { slide += 1 }}}
            } // NEXT ARROW - END
        } // CAROUSEL - END
        
        Container { // SEPARATOR - START
            background: Color.create("#7C4420")
            horizontalAlignment: HorizontalAlignment.Fill
            preferredHeight: 10
        } // SEPARATOR - END
        
        Container { // CONTROLS - START
            background: Color.create("#333333")
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            topPadding: 20
            bottomPadding: 20
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 3 }
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/dashboard/room.png"
                    pressedImageSource: "asset:///images/icons/dashboard/room-pressed.png"
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: { activeTab = tabRooms; _app.readRecordsRoom() }
                }
            }
            
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 3 }
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/dashboard/location.png"
                    pressedImageSource: "asset:///images/icons/dashboard/location-pressed.png"
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: { activeTab = tabLocations; _app.readRecordsLocation() }
                }
            }
            
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 3 }
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/dashboard/item.png"
                    pressedImageSource: "asset:///images/icons/dashboard/item-pressed.png"
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: { activeTab = tabItems; _app.readRecordsItem() }
                }
            }
        } // CONTROLS - END
    }
    
    // ACTIONBAR- START
    actions: [
        ActionItem {
            title: "Add Room"
            imageSource: "asset:///images/actionbar/add_room.png"
            attachedObjects: [
                ComponentDefinition {                      
                    id: addRoomDef          
                    source: "add/addRoom.qml"             
                }
            ]
            
            onTriggered: { showAddRoom() }
            
            function showAddRoom(){
                addRoom = addRoomDef.createObject(addRoomDef)
                addRoom.open()
            }
        },
        
        ActionItem {
            title: "Add Location"
            imageSource: "asset:///images/actionbar/add_location.png"
            
            attachedObjects: [
                ComponentDefinition {                      
                    id: addLocationDef          
                    source: "add/addLocation.qml"             
                }
            ]
            
            onTriggered: { showAddLocation() }
            
            function showAddLocation(){
                addLocation = addLocationDef.createObject(addLocationDef)
                addLocation.open()
            }
        },
        
        ActionItem {
            title: "Add Item"
            imageSource: "asset:///images/actionbar/add_item.png"
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
        },
        
        ActionItem {
            title: "Invite to Download (BBM)"
            imageSource: "asset:///images/bbm.png"
            onTriggered: { _app.inviteUserToDownloadViaBBM() }
        },
        
        InvokeActionItem {
            title: "Share"
            imageSource: "asset:///images/actionbar/share.png"
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: { data = "Hey! Take a look at cella - The Home Inventory App.\n\nWebsite - http://bit.ly/cellakrl\nBlackBerry App World - http://bit.ly/cellabb" }
        }
    ] // ACTIONBAR- END
    
    // HELPER FUNCTIONS
    // Returns unit formatted for display
    function getUnit() {
        var u = unit
        if (u.length > 0)
            return u + '-'
        return ''
    }
    
    function getStreetAddress() {
        if (isHouseInfoFilled())
            return getUnit() + street_num + ' ' + street_name + ' ' + street_suffix
        return 'Your address goes here.'
    }
    
    function isHouseInfoFilled() {
        return (street_num.length > 0 && street_name.length > 0 && street_suffix.length > 0)
    }
    
    function getCivicAddress() {
        if (municipality.length == 0 && province.length == 0 && postal_code.length == 0)
            return 'Somewhere in the world...'
        return municipality + checkComma() + province + " " + postal_code
    }
    
    function checkComma() {
        if (municipality.length > 0 && province.length > 0)
            return ', '
        return ''
    }
    
    function checkSqFt() {
        if (sqft.length == 0)
            return ' '
        return sqft + ' sq ft.'
    }
    
    function checkStories() {
        var s = stories
        if (s.length == 0)
            return ' '
        
        if (parseInt(s) == 1)
            return s + ' story'
        return s + ' stories'
    }
    
    // Returns a randomized quote.
    function getRandomQuote() {
        var quotes = [
            'Happiness is a place between too little and too much.', 
            'Less is usually more.',
            'If you have to dust it, you’d better love it.',
            'Stow as you go. (Put things back right after using them!)',
            'Out of clutter, find simplicity.'];
        quote = quotes[Math.floor(Math.random() * quotes.length)];
    }
}
