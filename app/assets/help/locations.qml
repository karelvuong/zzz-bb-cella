import bb.cascades 1.0

Page {
    onCreationCompleted: { Application.menuEnabled = false }
    
    Container {
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Help / Locations</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
        // HERO UNIT - START
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            background: Color.create("#0294B0")
            
            topPadding: 60
            bottomPadding: 60
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView { imageSource: "asset:///images/placeholders/help/hu-locations.png"  }
            }
        } // HERO UNIT - END
        
        ScrollView {
            Container {
                // MAIN CONTENT - START
                Container {
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Label {
                        text: "presets"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Label {
                        text: "Preset locations are commonly added locations which when selected will auto-fill the <b>name</b> and <b>icon</b> field."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "The following preset locations are available:"
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "Basket, bin, bookshelf, cabinet, ceiling, closet, compartment, cupboard, desk, drawer, end table, floor, freezer, rack, refrigerator, shed, shelf, shoe rack, wall, wardrobe."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                }
                
                Divider {}
                
                Container {   
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Label {
                        text: "what is it?"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Name <span style='color:red'>*</span>"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A name to help you identify the location (preferably in a single glance)."
                            multiline: true
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                            }
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Description"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "An additional statement describing the location."
                            multiline: true
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                            }
                        }
                    }
                }
                
                Divider {}
                
                Container {   
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Label {
                        text: "where is it?"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Room <span style='color:red'>*</span>"
                            multiline: true
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A room in which the location is located/found in."
                            multiline: true
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                            }
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Position"
                            multiline: true
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A position within the room in which the location is located/found in."
                            multiline: true
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                            }
                        }
                    }
                }
                
                Divider {}
                
                Container {   
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Label {
                        text: "what does it look like?"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Icon"
                            multiline: true
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A pictorial representation of the location."
                            multiline: true
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                            }
                        }
                    }
                }// MAIN CONTENT - END
            }
        } 
    }
}