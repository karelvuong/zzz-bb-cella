import bb.cascades 1.0

Page { // PAGE - START
    
    property int totalBugs: 0
    property int totalCards: 0
    property int totalMovies: 18
    property int totalMusic: 47
    property int totalRocks: 0
    property int totalStamps: 126
    property int totalTV: 9
    
    Container { // WRAPPER - START
        background: Color.create("#DDDDDD")
        
        Container { // HEADER - START
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Collections</span>"
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
        
	    ScrollView { // SCROLLVIEW - START
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            Container { // WRAPPER - START
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                horizontalAlignment: HorizontalAlignment.Fill
                
                Container { // BUGS - START
                    topPadding: 20
                    rightPadding: 20
                    leftPadding: 20
                    
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/bugs.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>BUGS</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalBugs, 'BUGS') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                            opacity: 0.2
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // BUGS - END
	            
                Container { // CARDS - START
	                topPadding: 20
	                rightPadding: 20
	                leftPadding: 20
	                
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/cards.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>CARDS</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalCards, 'CARDS') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                            opacity: 0.2
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // CARDS - END
                
                Container { // MOVIES - START
                    topPadding: 20
                    rightPadding: 20
                    leftPadding: 20
                    
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/movies.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>MOVIES</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalMovies, 'MOVIES') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // MOVIES - END
                
                Container { // MUSIC - START
                    topPadding: 20
                    rightPadding: 20
                    leftPadding: 20
                    
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/music.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>MUSIC</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalMusic, 'ALBUMS') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // MUSIC - END
                
                Container { // ROCKS - START
                    topPadding: 20
                    rightPadding: 20
                    leftPadding: 20
                    
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/rocks.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>ROCKS</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalRocks, 'ROCKS') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                            opacity: 0.2
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // ROCKS - END
                
                Container { // STAMPS - START
                    topPadding: 20
                    rightPadding: 20
                    leftPadding: 20
                    
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/stamps.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>STAMPS</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalStamps, 'STAMPS') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // STAMPS - END
                
                Container { // TV SHOWS - START
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Container {
                        layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 250
                        
                        ImageView { imageSource: "asset:///images/placeholders/collections/tv.jpg"; scalingMethod: ScalingMethod.AspectFill }
                        
                        Label {
                            text: "<span style='font-size: 60px; letter-spacing: 2px'>TV SHOWS</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                            textStyle.fontWeight: FontWeight.Bold
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        minHeight: 50
                        
                        Label {
                            text: "<span style='font-size: 25px; letter-spacing:2px'>" + isCollectionStarted(totalTV, 'SHOWS') + "</span>"
                            textStyle.color: Color.Black
                            textFormat: TextFormat.Html
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                        }
                    }
                    
                    Container { // SEPARATOR - START
                        background: Color.create("#BBBBBB")
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredHeight: 5
                    } // SEPARATOR - END
                } // TV SHOWS - END
	        } // WRAPPER - END
	    } // SCROLLVIEW - END
	} // WRAPPER - END
    
    // HELPER FUNCTIONS
    function isCollectionStarted(total, collection) {
        if (total == 0)
            return "COLLECTION NOT YET STARTED"
        return '<strong>' + total + '</strong> ' + collection + " IN COLLECTION"
    }
} // PAGE - END
