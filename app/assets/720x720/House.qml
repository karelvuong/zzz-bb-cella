import bb.cascades 1.0

Page {
    property Sheet sheet
    
    Container { // WRAPPER - START
        Container { // HEADER - START
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>House</span>"
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
        
        // HOUSE INFORMATION - START
        Container {
            visible: !isHouseInfoFilled()
            layout: DockLayout {}
            
            ImageView {
                imageSource: "asset:///images/placeholders/house/house.png"
                horizontalAlignment: HorizontalAlignment.Fill
                scalingMethod: ScalingMethod.AspectFill
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: "<span style='font-size: 60px'>Haven't set\nyour home yet?</span>"
                    textFormat: TextFormat.Html
                    textStyle.fontWeight: FontWeight.Bold
                    textStyle.textAlign: TextAlign.Center
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label {
                    text: "<span style='font-size: 25px; letter-spacing: 1px'>NO WORRIES, NOTHING IS SENT TO ANYONE.</span>"
                    textFormat: TextFormat.Html
                    textStyle.textAlign: TextAlign.Center
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
        
        // HOUSE INFORMATION - START
        ScrollView {
            visible: isHouseInfoFilled()
            
            Container { // WRAPPER - START
                // ADDRESS - START
                Container {
                    topPadding: 22
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    Label {
                        text: "<span style='font-size: 50px'><strong>" + getStreetAddress() + "</strong></span>"
                        textFormat: TextFormat.Html
                    }
                } // ADDRESS - END
                
                // ROW (SQ FT. + STORIES) - START
                Container {
                    horizontalAlignment: HorizontalAlignment.Fill
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    Container {
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            ImageView { minWidth: 100; imageSource: "asset:///images/icons/house/city.png" }
                            
                            Container {
                                layout: DockLayout {}
                                leftPadding: 20
                                topPadding: 5
                                Label {
                                    text: "<span style='font-size: 50px'>" + getCivicAddress() + "</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 60
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>LOCATION</span>"
                                        textStyle.color: Color.Black
                                        textFormat: TextFormat.Html
                                    }
                                }
                            }
                        }
                    }
                } // ROW (SQ FT. + STORIES) - END
                // ROW (SIZE + ROOMS) - START
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    // SQ FT. - START
                    Container {
                        layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                        
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            ImageView { imageSource: "asset:///images/icons/house/sqft.png" }
                            
                            Container {
                                layout: DockLayout {}
                                leftPadding: 20
                                Label {
                                    text: "<span style='font-size: 60px'><strong>" + checkSqFt() + "</strong></span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 70
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>SQ FT.</span>"
                                        textStyle.color: Color.Black
                                        textFormat: TextFormat.Html
                                    }
                                }
                            }
                        }
                    } // SQ FT. - END
                    
                    // YEAR PURCHASED - START
                    Container {
                        layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            ImageView { imageSource: "asset:///images/icons/house/stories.png" }
                            
                            Container {
                                layout: DockLayout {}
                                leftPadding: 20
                                Label {
                                    text: "<span style='font-size: 60px'><strong>" + checkStories() + "</strong></span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 70
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>STORIES</span>"
                                        textStyle.color: Color.Black
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    function pluralize_stories() {
                                        if (stories == 1)
                                            return 'Story'
                                        return 'Stories'
                                    }
                                }
                            }
                        }
                    } // YEAR PURCHASED - END
                } // ROW (SIZE + ROOMS) - END
                
                // ROW (YEARS) - START
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    rightPadding: 20
                    bottomPadding: 28
                    leftPadding: 20
                    
                    // YEAR PURCHASED - START
                    Container {
                        layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                        
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            ImageView { imageSource: "asset:///images/icons/house/built.png" }
                            
                            Container {
                                layout: DockLayout {}
                                leftPadding: 20
                                Label {
                                    text: "<span style='font-size: 60px'><strong>" + checkYearBuilt() + "</strong></span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 70
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>YEAR BUILT</span>"
                                        textStyle.color: Color.Black
                                        textFormat: TextFormat.Html
                                    }
                                }
                            }
                        }
                    } // YEAR PURCHASED - END
                    
                    // YEAR PURCHASED - START
                    Container {
                        layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                        Container {
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            
                            ImageView { imageSource: "asset:///images/icons/house/purchased.png" }
                            
                            Container {
                                layout: DockLayout {}
                                leftPadding: 20
                                Label {
                                    text: "<span style='font-size: 60px'><strong>" + checkYearPurchased() + "</strong></span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 70
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>YEAR PURCHASED</span>"
                                        textStyle.color: Color.Black
                                        textFormat: TextFormat.Html
                                    }
                                }
                            }
                        }
                    } // YEAR PURCHASED - END
                } // ROW (YEARS) - END
                
                // SEPARATOR - START
                Container {
                    background: Color.create("#DDDDDD")
                    horizontalAlignment: HorizontalAlignment.Fill
                    preferredHeight: 5
                } // SEPARATOR - END
                
                Container { // PICTURE - START
                    ImageView {
                        imageSource: picture
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 384
                        scalingMethod: ScalingMethod.AspectFill
                    }
                }  // PICTURE - END
            } // WRAPPER - END
        } // HOUSE INFORMATION - END
    } // WRAPPER - END
    
    // ACTIONBAR - START
    actions: [
        ActionItem {
            title: getActionTitle()
            imageSource: "asset:///images/actionbar/edit.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                sheet = editDef.createObject(editDef)
                sheet.open()
            }
            attachedObjects: ComponentDefinition {
                id: editDef
                source: "edit/editHouse.qml"
            }
        }
    ] // ACTIONBAR - END
    
    // HELPER FUNCTIONS
    function getActionTitle() {
        if (!isHouseInfoFilled())
            return 'Set'
        return 'Edit'
    }
    function getStreetAddress() {
        if (isHouseInfoFilled())
            return getUnit() + street_num + ' ' + street_name + ' ' + street_suffix
        return 'Your address goes here.'
    }
    
    function isHouseInfoFilled() {
        return (street_num.length > 0 && street_name.length > 0 && street_suffix.length > 0)
    }
    
    function getUnit() {
        var u = unit
        if (u.length > 0)
            return u + '-'
        return ''
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
            return '?'
        return sqft
    }
    
    function checkStories() {
        if (stories.length == 0)
            return '?'
        return stories
    }
    
    function checkYearBuilt() {
        if (year_built.length == 0)
            return '?'
        return year_built
    }
    
    function checkYearPurchased() {
        if (year_purchased.length == 0)
            return '?'
        return year_purchased
    }
}