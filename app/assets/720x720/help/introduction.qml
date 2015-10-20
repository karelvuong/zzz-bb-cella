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
                    text: "<span style='font-size: 60px'>Help / Introduction</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
        } // HEADER - END
        
        // MAIN CONTENT - START
        ScrollView {
            Container {
                // MAIN CONTENT - START
                Container {
                    topPadding: 20
                    rightPadding: 20
                    bottomPadding: 20
                    leftPadding: 20
                    
                    Label {
                        text: "cella is the home inventory application built for Blackberry 10. The purpose of cella is to keep you organized and in control of your possessions."
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                            fontStyle: FontStyle.Italic
                        }
                    }
                    
                    Divider {}
                    
                    Label {
                        text: "story"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Label {
                        text: 'Far too many times have I gone somewhere to try and find something, only to find it somewhere else twenty minutes later. One day, I thought to myself, <i>"There\'s gotta be another way."</i> So I decided to create cella.'
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                    
                    Divider {}
                    
                    Label {
                        text: "features"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Large
                            fontWeight: FontWeight.Bold
                        }
                    }
                    
                    Label {
                        text: 'cella hopes to become the one place you can rely on when it comes to finding what you want quick and easy. The only caveat being: you have to enter things into cella. It would be nice if cella could auto-detect everything you own, but that\'d be too easy. With three levels of organization, cella adds enormous depth and detail to your possessions, allowing you to track and make sense of everything in an easy and timely manner. After all, time is too precious to be spent searching for things you swear you put on your shelf.'
                        multiline: true
                        textFormat: TextFormat.Html
                        textStyle {
                            textAlign: TextAlign.Justify
                            fontSize: FontSize.Small
                        }
                    }
                }// MAIN CONTENT - END
            }
        } 
    }
}