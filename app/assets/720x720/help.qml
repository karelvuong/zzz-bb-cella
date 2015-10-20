import bb.cascades 1.0

Page {
    onCreationCompleted: { Application.menuEnabled = false }
    
    property Page page
    
    Container {
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Help</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
        ListView { // BODY - START
            dataModel: XmlDataModel { source: "help/models/help.xml" }
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    Container {
                        Container {
                            layout: DockLayout {}
                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            topPadding: 20
                            rightPadding: 20
                            leftPadding: 20
                            
                            Container {
                                layout: DockLayout {}
                                horizontalAlignment: HorizontalAlignment.Fill
                                
                                ImageView {
                                    imageSource: ListItemData.img
                                    verticalAlignment: VerticalAlignment.Center
                                    minWidth: 81
                                    minHeight: 81
                                }
                                
                                Container {
                                    rightPadding: 101
                                    leftPadding: 101
                                    verticalAlignment: VerticalAlignment.Center
                                    Label {
                                        text: "<span style='font-size: 40px'>" + ListItemData.title + "</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Label {
                                        text: "<span style='font-size: 25px'>" + ListItemData.description + "</span>"
                                        textStyle.color: Color.create("#777777")
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            }
                        }
                        
                        Divider { opacity: 0.33 }
                    }
                }
            ]
            
            onTriggered: {
                var selectedItem = dataModel.data(indexPath);
                var name = selectedItem.title
                
                var pane
                if (activeTab == tabDashboard)
                    pane = navigationPaneD
                else if (activeTab == tabHouse)
                    pane = navigationPaneH
                else if (activeTab == tabRooms)
                    pane = navigationPaneR
                else if (activeTab == tabLocations)
                    pane = navigationPaneL
                else if (activeTab == tabItems)
                    pane = navigationPaneI
                
                if (name == 'Introduction')
                    page = helpIntroDef.createObject()
                else if (name == 'Comparison')
                    page = helpCompareDef.createObject()
                else if (name == 'Dashboard')
                    page = helpDashboardDef.createObject()
                else if (name == 'Rooms')
                    page = helpRoomsDef.createObject()
                else if (name == 'Locations')
                    page = helpLocationsDef.createObject()
                else if (name == 'Items')
                    page = helpItemsDef.createObject()
                
                pane.push(page)
            }
            
            attachedObjects: [
                ComponentDefinition {
                    id: helpIntroDef
                    source: 'help/introduction.qml'
                }, 
                ComponentDefinition {
                    id: helpCompareDef
                    source: 'help/comparison.qml'
                }, 
                ComponentDefinition {
                    id: helpDashboardDef
                    source: 'help/dashboard.qml'
                }, 
                ComponentDefinition {
                    id: helpRoomsDef
                    source: 'help/rooms.qml'
                }, 
                ComponentDefinition {
                    id: helpLocationsDef
                    source: 'help/locations.qml'
                }, 
                ComponentDefinition {
                    id: helpItemsDef
                    source: 'help/items.qml'
                }
            ]
        } // BODY - END
    }
}