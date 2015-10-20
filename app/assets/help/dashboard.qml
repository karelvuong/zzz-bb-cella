import bb.cascades 1.0
import bb.system 1.0

Page { // PAGE - START
    onCreationCompleted: { Application.menuEnabled = false }
    
    Container { // BODY - START
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Help / Dashboard</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
        // HERO UNIT - START
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            layout: DockLayout {}
            background: Color.create("#B94D4B")
            
            topPadding: 60
            bottomPadding: 60
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView { imageSource: "asset:///images/placeholders/help/hu-dashboard.png"  }
            }
        } // HERO UNIT - END
        
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
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-room.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>6</strong></span>"
                            textFormat: TextFormat.Html
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>ROOMS</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                            }
                        }
                    }
                    Container {
                        leftPadding: 80 
                        horizontalAlignment: HorizontalAlignment.Right
                        verticalAlignment: VerticalAlignment.Center
                        gestureHandlers: TapHandler { onTapped: { toastRooms.show() }}
                        attachedObjects: SystemToast {
                            id: toastRooms
                            body: "This section displays the number of rooms you have added into cella. Tapping it will bring you to the rooms tab."
                        }
                        ImageView { imageSource: "asset:///images/icons/help/help.png" }
                    }
                }
            } // ROOMS - END
            
            // LOCATIONS - START
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-location.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>27</strong></span>"
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
                                text: "<span style='font-size: 20px; letter-spacing:2px'>LOCATIONS</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                            }
                        }
                    }
                    Container {
                        leftPadding: 60 
                        horizontalAlignment: HorizontalAlignment.Right
                        verticalAlignment: VerticalAlignment.Center
                        gestureHandlers: TapHandler { onTapped: { toastLocations.show() }}
                        attachedObjects: SystemToast {
                            id: toastLocations
                            body: "This section displays the number of locations you have added into cella. Tapping it will bring you to the locations tab."
                        }
                        ImageView { imageSource: "asset:///images/icons/help/help.png" }
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
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-item.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>402</strong></span>"
                            textFormat: TextFormat.Html
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>ITEMS</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                            }
                        }
                    }
                    Container {
                        leftPadding: 50 
                        horizontalAlignment: HorizontalAlignment.Right
                        verticalAlignment: VerticalAlignment.Center
                        gestureHandlers: TapHandler { onTapped: { toastItems.show() }}
                        attachedObjects: SystemToast {
                            id: toastItems
                            body: "This section displays the number of items you have added into cella. Tapping it will bring you to the items tab."
                        }
                        ImageView { imageSource: "asset:///images/icons/help/help.png" }
                    }
                }
            } // ITEMS - END
            
            // WARRANTIES - START
            Container {
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    verticalAlignment: VerticalAlignment.Center
                    
                    ImageView { imageSource: "asset:///images/icons/dashboard/icon-warranty.png" }
                    
                    Container {
                        layout: DockLayout {}
                        leftPadding: 20
                        Label {
                            text: "<span style='font-size: 60px'><strong>18</strong></span>"
                            textFormat: TextFormat.Html
                        }
                        
                        Container {
                            topPadding: 70
                            Label {
                                text: "<span style='font-size: 20px; letter-spacing:2px'>WARRANTIES</span>"
                                textStyle.color: Color.Black
                                textFormat: TextFormat.Html
                            }
                        }
                    }
                    Container {
                        leftPadding: 50 
                        horizontalAlignment: HorizontalAlignment.Right
                        verticalAlignment: VerticalAlignment.Center
                        gestureHandlers: TapHandler { onTapped: { toastWarranty.show() }}
                        attachedObjects: SystemToast {
                            id: toastWarranty
                            body: "This section displays the number of warranties you own on your items. Tapping it will bring you to the items tab."
                        }
                        ImageView { imageSource: "asset:///images/icons/help/help.png" }
                    }
                }
            } // WARRANTIES - END
        } // ROW 2 - END
        
        // SEPARATOR - START
        Container {
            background: Color.create("#dedede")
            horizontalAlignment: HorizontalAlignment.Fill
            preferredHeight: 5
        } // SEPARATOR - END
        
        // ROW 3 - START
        Container {
            background: Color.create("#eaeaea")
            horizontalAlignment: HorizontalAlignment.Fill
            layout: DockLayout {}
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            ImageView { imageSource: "asset:///images/icons/dashboard/icon-house.png" }
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                layout: DockLayout {}
                leftPadding: 120
                
                // ADDRESS - START
                Container {
                    Label {
                        text: "<span style='font-size: 40px'><strong>308 Negra Arroyo Lane</strong></span>"
                        textFormat: TextFormat.Html
                    }
                } // ADDRESS - END
                
                // CITY, PROVINCE/STATE, COUNTRY - START
                Container {
                    topPadding: 50
                    Label {
                        text: "<span style='font-size: 30px'>Albuquerque, New Mexico 87112</span>"
                        textFormat: TextFormat.Html
                        textStyle.fontWeight: FontWeight.W100
                    }
                } // CITY, PROVINCE/STATE, COUNTRY - END
                
                Container {
                    topPadding: 90
                    Container {
                        Label {
                            text: "<span style='font-size: 30px'>1 Story</span>"
                            textFormat: TextFormat.Html
                            textStyle.fontWeight: FontWeight.W100
                        }
                    }
                }
                
                Container {
                    topPadding: 140
                    Container {
                        Label {
                            text: "<span style='font-size: 50px'>1470 sq ft.</span>"
                            textFormat: TextFormat.Html
                            textStyle.fontWeight: FontWeight.W100
                        }
                    }
                }
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                Label {
                    text: "<span style='font-size: 20px; letter-spacing: 2px'>HOUSE</span>"
                    textFormat: TextFormat.Html
                }
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Top
                Container {
                    leftPadding: 20 
                    verticalAlignment: VerticalAlignment.Center
                    gestureHandlers: TapHandler { onTapped: { toastHouse.show() }}
                    attachedObjects: SystemToast {
                        id: toastHouse
                        body: "This section displays information about your home like the street and civic address, and the number of stories and square feet. Tapping it will bring you to the house tab."
                    }
                    ImageView { imageSource: "asset:///images/icons/help/help.png" }
                }
            }
        } // ROW 3 - END
        
        // SEPARATOR - START
        Container {
            background: Color.create("#dedede")
            horizontalAlignment: HorizontalAlignment.Fill
            preferredHeight: 5
        } // SEPARATOR - END
        
        // CAROUSEL - START
        Container {
            background: Color.create("#ffffff")
            horizontalAlignment: HorizontalAlignment.Fill
            
            // CONTENT - START
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                horizontalAlignment: HorizontalAlignment.Center
                topPadding: 80
                
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    text: "<span style='font-size: 40px'>You own</span>"
                    textFormat: TextFormat.Html
                }
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    Container {
                        background: Color.create("#A6D168")
                        verticalAlignment: VerticalAlignment.Center
                        
                        topPadding: 10
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 10
                        
                        Label {
                            text: "<span style='font-size: 60px'><strong>80m</strong></span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                        }
                    }
                } 
                
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    text: "<span style='font-size: 40px'>worth of stuff.</span>"
                    textFormat: TextFormat.Html
                }
            } // CONTENT- END
            
            // HELP - START
            Container {
                topPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                gestureHandlers: TapHandler { onTapped: { toastCarousel.show() }}
                attachedObjects: SystemToast {
                    id: toastCarousel
                    body: "The carousel displays additional information. By using the left and right arrows, you can cycle through the content."
                }
                ImageView { imageSource: "asset:///images/icons/help/help.png" }
            } // HELP - END
        } // CAROUSEL - END
    } // BODY - END
} // PAGE - END