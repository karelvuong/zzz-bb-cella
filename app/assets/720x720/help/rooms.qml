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
                    text: "<span style='font-size: 60px'>Help / Rooms</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
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
                        text: "Preset rooms are commonly added rooms which when selected will auto-fill the <b>name</b> and <b>icon</b> field."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "The following preset rooms are available:"
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "Attic, balcony, bathroom, bedroom, den, dining room, garage, garden, hallway, kitchen, living room, pantry, porch, room, study, washroom, and yard."
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
                            text: "A name to help you identify the room (preferably in a single glance)"
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
                            text: "An additional statement describing the room."
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
                            text: "A pictorial representation of the room."
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