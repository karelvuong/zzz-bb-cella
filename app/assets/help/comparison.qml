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
                    text: "<span style='font-size: 60px'>Help / Comparison</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
        // HERO UNIT - START
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            background: Color.create("#008A69")
            
            topPadding: 60
            bottomPadding: 60
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView { imageSource: "asset:///images/placeholders/help/hu-comparison.png"  }
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
                    
                    Container {
                        Label {
                            text: "<b>NOTE: </b><i>Rooms contain locations which in turn contain items.</i>"
                            multiline: true
                            textFormat: TextFormat.Html
                            textStyle {
                                fontSize: FontSize.Small
                                textAlign: TextAlign.Center
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
                        text: "room"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Label {
                        text: "A room is a distinguishable space within your home. A kitchen and study are rooms. Some rooms even have 'room' in their names like a bedroom or a bathroom. Wow, Mr. cella, you're really knowledgable! In cella, the garage, garden and yard are considered to be rooms."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "Rooms contain locations and within those locations are items."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                            fontWeight: FontWeight.Bold
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
                        text: "location"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Label {
                        text: "A location is a place within a room that can be used to store items. A basket, bookshelf, desk and refrigerator are locations."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                    	text: "Locations are found in rooms and contain items."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                            fontWeight: FontWeight.Bold
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
                        text: "item"
                        multiline: true
                        textStyle {
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Label {
                        text: "An item is an object. A television and laptop are items. Some items can be given details which reveal more information about them. An example of this is a laptop which is covered under warranty. In cella, the warranty duration and any contact information you may need to know for later on can be saved."
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Label {
                        text: "Items are found within locations which are found in rooms"
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                            fontWeight: FontWeight.Bold
                        }
                    }
                }// MAIN CONTENT - END
            }
        } 
    }
}