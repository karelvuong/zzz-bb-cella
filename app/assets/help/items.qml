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
                    text: "<span style='font-size: 60px'>Help / Items</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
        // HERO UNIT - START
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            background: Color.create("#F2B13B")
            
            topPadding: 60
            bottomPadding: 60
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView { imageSource: "asset:///images/placeholders/help/hu-items.png"  }
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
                        text: "Preset items are commonly added items which when selected will auto-fill the <b>name</b> and <b>icon</b> field as well as reveal a number of forms related to the item."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "The following preset items are available:"
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "Beverage, computer, game, game system, music and software."
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
                            text: "A name to help you identify the room (preferably in a single glance)."
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
                            text: "An additional statement describing the item."
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
                            text: "Type"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A category of items with common characteristics."
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
                            text: "Brand"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "Think of Apple or Sony, these are brands."
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
                            text: "Model Number"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "Numbers assigned by the manufacturer to identify the item."
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
                            text: "Serial Number"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A unique code assigned for the identification of an item."
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
                            text: "Version"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A particular form or variation of an item."
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
                        text: "food related"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Capacity"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The maximum amount an item can contain."
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
                            text: "Expiry Date"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The date on which something like the shelf life or warranty is no longer in effect or considered unsuitable."
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
                        text: "media related"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Artist"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The writer/artist behind the song."
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
                            text: "Author"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The writer of the book."
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
                            text: "Genre"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A category of artistic composition."
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
                            text: "Year"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The year the item was created."
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
                        text: "purchase related"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Date"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The date the item was purchased."
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
                            text: "Location"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The location where the item was purchased."
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
                            text: "Method"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "How the item was purchased."
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
                            text: "Notes"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "Any additional things to be said about the purchase of the item."
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
                            text: "Price"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The amount paid for the item upon purchase."
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
                        text: "warranty related"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Name"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The name of the warranty issuer."
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
                            text: "Duration"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "The duration of the warranty (start and end date)."
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
                            text: "Phone #"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A number to contact the warranty issuer."
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
                            text: "Phone # (Alt.)"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "An alternative number to contact the warranty issuer."
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
                            text: "Notes"
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                textAlign: TextAlign.Justify
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "Any additional things to be said about the item's warranty."
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
                            text: "A room in which the item is located/found in."
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
                            text: "Location <span style='color:red'>*</span>"
                            multiline: true
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "A location in which the item is located/found in."
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
                        text: "more"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Container {
                        layout: StackLayout{ orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: "Notes"
                            multiline: true
                            minWidth: 200
                            textFormat: TextFormat.Html
                            textStyle {
                                fontSize: FontSize.Small
                                fontWeight: FontWeight.Bold
                            }
                        }
                        Label {
                            text: "Any additional things to be said about the item."
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