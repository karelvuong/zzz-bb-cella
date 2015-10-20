import bb.cascades 1.0

Page {
    onCreationCompleted: { Application.menuEnabled = false }
    
    // MAIN CONTENT - START
    Container {
        layout: DockLayout {}
        
        ImageView {
            imageSource: "asset:///images/cover/cover.jpg"
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
        
        Container {
            topPadding: 80
            horizontalAlignment: HorizontalAlignment.Center
            ImageView { imageSource: "asset:///images/logos/logo-big.png" }
        }
        
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top
            
            topPadding: 300
            Label {
                text: "<span style='font-size: 50px'>The Home Inventory App</span>"
                textFormat: TextFormat.Html
                textStyle.color: Color.White
                textStyle.fontWeight: FontWeight.W100
            }
        }
        
        Container {
            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            
            topPadding: 250
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                bottomPadding: 20
                
                Container {  
                    ImageButton {
                        defaultImageSource: "asset:///images/icons/social/behance.png"
                        onClicked: { behanceInvoke.trigger("bb.action.OPEN") }
                        attachedObjects: [
                            Invocation {
                                id: behanceInvoke
                                query {
                                    mimeType: "text/html"
                                    uri: "http://behance.com/karelvuong"
                                }
                            }
                        ]
                    }
                }
                
                Container {
                    leftPadding: 20
                    ImageButton { 
                        defaultImageSource: "asset:///images/icons/social/dribbble.png"
                        onClicked: { dribbbleInvoke.trigger("bb.action.OPEN") }
                        attachedObjects: [
                            Invocation {
                                id: dribbbleInvoke
                                query {
                                    mimeType: "text/html"
                                    uri: "http://dribbble.com/karelvuong"
                                }
                            }
                        ]
                    }
                }
            }
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                Container {
                    ImageButton { 
                        defaultImageSource: "asset:///images/icons/social/mail.png"
                        onClicked: { mailInvoke.trigger("bb.action.SENDEMAIL") }
                        attachedObjects: [
                            Invocation {
                                id: mailInvoke
                                query {
                                    //id: invokeQuery
                                    uri: "mailto:karelvuongg@gmail.com?subject=cella - Just Wanted To Say Hello"
                                    invokeActionId: "bb.action.SENDEMAIL"
                                    invokeTargetId: "sys.pim.uib.email.hybridcomposer"
                                }
                            }
                        ]
                    }
                }
                
                Container {
                    leftPadding: 20
                    ImageButton { 
                        defaultImageSource: "asset:///images/icons/social/twitter.png"
                        onClicked: { twitterInvoke.trigger("bb.action.OPEN") }
                        attachedObjects: [
                            Invocation {
                                id: twitterInvoke
                                query {
                                    mimeType: "text/html"
                                    uri: "http://twitter.com/karelvuong"
                                }
                            }
                        ]
                    }
                }
            }
        }
        
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            
            bottomPadding: 40
            
            Label {
                text: "<span style='font-size: 30px; letter-spacing: 2px'>@karelvuong</span>"
                textFormat: TextFormat.Html
                textStyle.color: Color.White
            }
        }
    } // MAIN CONTENT - END
    
    // ACTIONBAR - START
    actions: [ 
        InvokeActionItem {
            title: "Review"
            imageSource: "asset:///images/actionbar/review.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            query.mimeType: "text/plain"
            query.invokeTargetId: "sys.appworld"
            query.invokeActionId: "bb.action.OPEN"
            query.uri: "appworld://content/35146895"
        },
        
        InvokeActionItem {
            title: "Share"
            imageSource: "asset:///images/actionbar/share.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: { data = "Hey! Take a look at cella - The Home Inventory App.\n\nWebsite - http://bit.ly/cellakrl\nBlackBerry App World - http://bit.ly/cellabb" }
        }
    ] //ACTIONBAR - END
}