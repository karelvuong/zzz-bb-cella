import bb.cascades 1.0

Page {
    property Sheet sheet
    
    // WRAPPER - START
    Container {
        background: Color.create("#DDDDDD")
        
        // HEADER - START
        Container {
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                Label {
                    text: "<span style='font-size: 60px'>Home</span>"
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
            
            Container { // BODY - START
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                horizontalAlignment: HorizontalAlignment.Fill
            
	            Container { // INFORMATION - START
	                topPadding: 20
	                rightPadding: 20
	                leftPadding: 20
	                
	                gestureHandlers: TapHandler { onTapped: { var page = showHomeDef.createObject(); navPaneH.push(page) }}
	                attachedObjects: ComponentDefinition {                      
	                    id: showHomeDef          
	                    source: "show/showHome.qml"             
	                }
	                
	                Container {
	                    layout: DockLayout {}
	                    horizontalAlignment: HorizontalAlignment.Fill
	                    preferredHeight: 250
	                    
	                    ImageView { imageSource: "asset:///images/placeholders/home/information.jpg"; scalingMethod: ScalingMethod.AspectFill }
	                    
	                    Label {
	                        text: "<span style='font-size: 60px; letter-spacing: 2px'>INFORMATION</span>"
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
	                        text: "<span style='font-size: 25px; letter-spacing:2px'>SQ FT., PURCHASE PRICE, MORTGAGE...</span>"
	                        textStyle.color: Color.Black
	                        textFormat: TextFormat.Html
	                        horizontalAlignment: HorizontalAlignment.Center
	                        verticalAlignment: VerticalAlignment.Center
	                    }
	                }
	                
	                Container { // SEPARATOR - START
	                    background: Color.create("#CCCCCC")
	                    horizontalAlignment: HorizontalAlignment.Fill
	                    preferredHeight: 5
	                } // SEPARATOR - END
                } // INFORMATION - END
	        } // BODY - END
        } // SCROLLVIEW - END
    } // WRAPPER - END
} // PAGE - END