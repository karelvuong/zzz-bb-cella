import bb.cascades 1.0
import bb.system 1.0

Page { // PAGE - START
    property string roomID
    property string roomName
    property string locationID
    property string locationName
    property string itemImg
    property string itemPicture
    property string itemID
    property string itemName
    property string itemDescription
    property string itemType
    property string itemBrand
    property string itemModelNumber
    property string itemSerialNumber
    property string itemVersion
    property string itemCapacity
    property string itemExpiryDate
    property string itemArtist
    property string itemAuthor
    property string itemGenre
    property string itemYear
    property string itemPurchaseDate
    property string itemPurchaseLocation
    property string itemPurchaseMethod
    property string itemPurchaseNotes
    property string itemPurchasePrice
    property string itemWarranty: 'Yes'
    property string itemWarrantyName
    property string itemWarrantyNum
    property string itemWarrantyNum2
    property string itemWarrantyDateStart
    property string itemWarrantyDateEnd
    property string itemWarrantyNotes
    property string itemNotes
    
    Container { // WRAPPER - START
        background: Color.create("#DDDDDD")
        Container { // HEADER - START
            layout: DockLayout {}
            ImageView { imageSource: "asset:///images/cover/header.jpg"; minHeight: 110 }
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                verticalAlignment: VerticalAlignment.Center
                leftPadding: 30
                
                ImageView { imageSource: setHeaderImage (itemImg) }
                
                Container {
                    leftPadding: 20
                    Label {
                        text: "<span style='font-size: 60px'>" + itemName + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                    }
                }
            }
        } // HEADER - END
        
        Container { // STATISTICS HEADER - START
            background: Color.create("#7C4420")
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            preferredHeight: 90
            leftPadding: 30
            
            Label {
                text: "<span style='font-size: 30px; letter-spacing: 2px; font-weight: 200'>IN THE <strong>" + roomName.toUpperCase() + "</strong>" + getConnector() + "<strong>"+ locationName.toUpperCase() + "</strong>.</span>"
                textStyle.color: Color.White
                textFormat: TextFormat.Html
                verticalAlignment: VerticalAlignment.Center
            }
        } // STATISTICS HEADER - END
        
        ScrollView { // SCROLLVIEW - START
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            Container { // BODY - START
                horizontalAlignment: HorizontalAlignment.Fill
                topPadding: 20
                rightPadding: 20
                bottomPadding: 20
                leftPadding: 20
                
                Container { // DETAILS - START
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Container { // WRAPPER - START
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        Container { // PICTURE - START
                            id: cntrPicture
                            visible: (itemPicture.length > 0)
                            
                            Container {
                                ImageView {
                                    id: ivPicture
                                    imageSource: itemPicture
                                    scalingMethod: ScalingMethod.AspectFit
                                    loadEffect: ImageViewLoadEffect.Subtle
                                    preferredWidth: 768
                                }
                            }
                        } // PICTURE - END
                        
                        Container { // WHAT - START
                            id: cntrWhat
                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            Container { // DESCRIPTION - START
                                id: cntrDesc
                                visible: (itemDescription.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>DESCRIPTION</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemDescription + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // DESCRIPTION - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemDescription.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrType
                                visible: (itemType != 'None')
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>TYPE</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemType + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            }
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemType != 'None')
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrBrand
                                visible: (itemBrand.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>BRAND</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemBrand + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            }
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemBrand.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrModelNumber
                                visible: (itemModelNumber.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>MODEL NUMBER</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemModelNumber + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            }
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemModelNumber.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrSerialNumber
                                visible: (itemSerialNumber.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>SERIAL NUMBER</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemSerialNumber + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            }
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemSerialNumber.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container { // VERSION - START
                                id: cntrVersion
                                visible: (itemVersion.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>VERSION</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemVersion + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // VERSION - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemVersion.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrFood
                                visible: (cntrCapacity.visible
                                || cntrExpiryDate.visible)
                                
                                Header { title: "Food Information "}
                                
                                Container { // CAPACITY - START
                                    id: cntrCapacity
                                    visible: (itemCapacity.length > 0)
                                    layout: DockLayout {}
                                    
                                    topPadding: 20
                                    bottomPadding: 20
                                    rightPadding: 20
                                    leftPadding: 20
                                    
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>CAPACITY</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Container {
                                        topPadding: 30
                                        Label {
                                            text: "<span style='font-size: 50px'>" + itemCapacity + "</span>"
                                            textStyle.fontWeight: FontWeight.W100
                                            textFormat: TextFormat.Html
                                            multiline: true
                                        }
                                    }
                                } // CAPACITY - END
                                
                                Container { // SEPARATOR - START
                                    background: Color.create("#EFEFEF")
                                    visible: (itemVersion.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    preferredHeight: 5
                                } // SEPARATOR - END
                                
                                Container {
                                    id: cntrExpiryDate
                                    visible: (itemExpiryDate.length > 0)
                                    layout: DockLayout {}
                                    
                                    topPadding: 20
                                    bottomPadding: 20
                                    rightPadding: 20
                                    leftPadding: 20
                                    
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>EXPIRY DATE</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Container {
                                        topPadding: 30
                                        Label {
                                            text: "<span style='font-size: 50px'>" + formatDate(itemExpiryDate) + "</span>"
                                            textStyle.fontWeight: FontWeight.W100
                                            textFormat: TextFormat.Html
                                            multiline: true
                                        }
                                    }
                                } // CAPACITY - END
                                
                                Container { // SEPARATOR - START
                                    background: Color.create("#EFEFEF")
                                    visible: (itemExpiryDate.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    preferredHeight: 5
                                } // SEPARATOR - END
                            }
                        } // WHAT - END
                        
                        Container { // MEDIA - START
                            id: cntrMedia
                            visible: (cntrArtist.visible 
                            || cntrAuthor.visible
                            || cntrYear.visible)
                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            Container {
                                id: cntrArtist
                                visible: (itemArtist.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>ARTIST</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemArtist + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // AUTHOR - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemArtist.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container { // AUTHOR - START
                                id: cntrAuthor
                                visible: (itemAuthor.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>AUTHOR</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemAuthor + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // AUTHOR - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemAuthor.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrGenre
                                visible: (itemGenre.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>GENRE</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemGenre + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // AUTHOR - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemGenre.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrYear
                                visible: (itemYear.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>YEAR</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemYear + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // AUTHOR - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#EFEFEF")
                                visible: (itemYear.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                        } // MEDIA - END
                        
                        Container {
                            id: cntrMore
                            visible: (cntrNotes.visible)
                            
                            Container {
                                id: cntrNotes
                                visible: (itemNotes.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>NOTES</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemNotes + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // NOTES - END
                        } // MORE - END
                        
                        Container { // SEPARATOR - START
                            background: Color.create("#BBBBBB")
                            horizontalAlignment: HorizontalAlignment.Fill
                            preferredHeight: 20
                        } // SEPARATOR - END
                    } // WRAPPER - END
                } // DETAILS - END
                
                Container { // PURCHASE - START
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Container { // WRAPPER - START
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        Container {
                            id: cntrPurchase
                            background: Color.create("#FAFEDE")
                            visible: (cntrPurchaseDate.visible 
		                            || cntrPurchaseLocation.visible
		                            || cntrPurchaseMethod.visible
		                            || cntrPurchaseNotes.visible)
                            
                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            Container {
                                horizontalAlignment: HorizontalAlignment.Fill
                                
                                Container { // PURCHASE DATE - START
                                    id: cntrPurchaseDate
                                    visible: (itemPurchaseDate.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    layout: DockLayout {}
                                    
                                    topPadding: 20
                                    bottomPadding: 20
                                    rightPadding: 20
                                    leftPadding: 20
                                    
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>PURCHASE DATE</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Container {
                                        topPadding: 30
                                        Label {
                                            text: "<span style='font-size: 50px'>" + formatDate(itemPurchaseDate) + "</span>"
                                            textStyle.fontWeight: FontWeight.W100
                                            textFormat: TextFormat.Html
                                        }
                                    }
                                } // PURCHASE DATE - END
                                
                                Container { // SEPARATOR - START
                                    background: Color.create("#EBF9B6")
                                    visible: (itemPurchaseDate.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    preferredHeight: 5
                                } // SEPARATOR - END
                                
                                Container { // PURCHASE LOCATION - START
                                    id: cntrPurchaseLocation
                                    visible: (itemPurchaseLocation.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    layout: DockLayout {}
                                    
                                    topPadding: 20
                                    bottomPadding: 20
                                    rightPadding: 20
                                    leftPadding: 20
                                    
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>PURCHASE LOCATION</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Container {
                                        topPadding: 30
                                        Label {
                                            text: "<span style='font-size: 50px'>" + itemPurchaseLocation + "</span>"
                                            textStyle.fontWeight: FontWeight.W100
                                            textFormat: TextFormat.Html
                                        }
                                    }
                                } // PURCHASE LOCATION - END
                                
                                Container { // SEPARATOR - START
                                    background: Color.create("#EBF9B6")
                                    visible: (itemPurchaseLocation.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    preferredHeight: 5
                                } // SEPARATOR - END
                                
                                Container { // PURCHASE METHOD - START
                                    id: cntrPurchaseMethod
                                    visible: (itemPurchaseMethod.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    layout: DockLayout {}
                                    
                                    topPadding: 20
                                    bottomPadding: 20
                                    rightPadding: 20
                                    leftPadding: 20
                                    
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>PURCHASE METHOD</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Container {
                                        topPadding: 30
                                        Label {
                                            text: "<span style='font-size: 50px'>" + itemPurchaseMethod + "</span>"
                                            textStyle.fontWeight: FontWeight.W100
                                            textFormat: TextFormat.Html
                                        }
                                    }
                                } // PURCHASE METHOD - END
                                
                                Container { // SEPARATOR - START
                                    background: Color.create("#EBF9B6")
                                    visible: (itemPurchaseMethod.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    preferredHeight: 5
                                } // SEPARATOR - END
                                
                                Container { // PURCHASE NOTES - START
                                    id: cntrPurchaseNotes
                                    visible: (itemPurchaseNotes.length > 0)
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    layout: DockLayout {}
                                    
                                    topPadding: 20
                                    bottomPadding: 20
                                    rightPadding: 20
                                    leftPadding: 20
                                    
                                    Label {
                                        text: "<span style='font-size: 20px; letter-spacing:2px'>PURCHASE NOTES</span>"
                                        textFormat: TextFormat.Html
                                    }
                                    
                                    Container {
                                        topPadding: 30
                                        Label {
                                            text: "<span style='font-size: 50px'>" + itemPurchaseNotes + "</span>"
                                            textStyle.fontWeight: FontWeight.W100
                                            textFormat: TextFormat.Html
                                        }
                                    }
                                } // PURCHASE NOTES - END
                            }
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#DEF598")
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 20
                            } // SEPARATOR - END
                        } // PURCHASE - END
                    }
                }
                
                Container { // WARRANTY - START
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Container { // WRAPPER - START
                        background: Color.White
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        Container {
                            id: cntrWarranty
                            background: Color.create("#FFEBCC")
                            visible: (cntrWarrantyName.visible
                            		|| cntrWarrantyNum.visible
		                            || cntrWarrantyNum2.visible
		                            || cntrWarrantyDateStart.visible
		                            || cntrWarrantyDateEnd.visible)

                            horizontalAlignment: HorizontalAlignment.Fill
                            
                            Container { // WARRANTY CONTACT NAME - START
                                id: cntrWarrantyName
                                visible: (itemWarrantyName.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                rightPadding: 20
                                bottomPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>WARRANTY CONTACT NAME</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemWarrantyName + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // WARRANTY CONTACT NAME - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#FED8B3")
                                visible: (itemWarrantyName.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container { // WARRANTY PHONE NUMBER - START
                                id: cntrWarrantyNum
                                visible: (itemWarrantyNum.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>WARRANTY PHONE NUMBER</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemWarrantyNum + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // WARRANTY PHONE NUMBER (2) - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#FED8B3")
                                visible: (itemWarrantyNum.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container { // WARRANTY PHONE NUMBER (2) - START
                                id: cntrWarrantyNum2
                                visible: (itemWarrantyNum2.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>WARRANTY PHONE NUMBER (2)</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemWarrantyNum2 + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // WARRANTY PHONE NUMBER (2) - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#FED8B3")
                                visible: (itemWarrantyNum2.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container { // WARRANTY START DATE - START
                                id: cntrWarrantyDateStart
                                visible: (itemWarrantyDateStart.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>WARRANTY START DATE</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + formatDate(itemWarrantyDateStart) + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // WARRANTY START DATE - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#FED8B3")
                                visible: (itemWarrantyDateStart.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container { // WARRANTY END DATE - START
                                id: cntrWarrantyDateEnd
                                visible: (itemWarrantyDateEnd.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>WARRANTY END DATE</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + formatDate(itemWarrantyDateEnd) + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // WARRANTY END DATE - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#FED8B3")
                                visible: (itemWarrantyDateEnd.length > 0)
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 5
                            } // SEPARATOR - END
                            
                            Container {
                                id: cntrWarrantyNotes
                                visible: (itemWarrantyNotes.length > 0)
                                layout: DockLayout {}
                                
                                topPadding: 20
                                bottomPadding: 20
                                rightPadding: 20
                                leftPadding: 20
                                
                                Label {
                                    text: "<span style='font-size: 20px; letter-spacing:2px'>NOTES</span>"
                                    textFormat: TextFormat.Html
                                }
                                
                                Container {
                                    topPadding: 30
                                    Label {
                                        text: "<span style='font-size: 50px'>" + itemWarrantyNotes + "</span>"
                                        textStyle.fontWeight: FontWeight.W100
                                        textFormat: TextFormat.Html
                                        multiline: true
                                    }
                                }
                            } // WARRANTY END DATE - END
                            
                            Container { // SEPARATOR - START
                                background: Color.create("#FB986A")
                                horizontalAlignment: HorizontalAlignment.Fill
                                preferredHeight: 20
                            } // SEPARATOR - END
                        }
                    }
                } // WARRANTY - END
            } // BODY - END    
        } // SCROLLVIEW - END
        
        Container { // STATUS (WARRANTY + VALUE) - START
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            Container { // WARRANTY - START
                background: Color.create("#E56148")
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                gestureHandlers: TapHandler { onTapped: { toastWarranty.show() }}
                attachedObjects: [
                    SystemToast {
                        id: toastWarranty
                        body: "This tells you if you have warranty on the current item."
                    }   
                ]
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Fill
                    preferredHeight: 100
                    
                    Container {
                        topPadding: 15
                        horizontalAlignment: HorizontalAlignment.Center
                        Label {
                            text: "<span style='font-size: 60px; font-weight: 700; letter-spacing: 2px'>" + itemWarranty.toUpperCase() + "</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                        }
                    }
                    
                    Container {
                        topPadding: 10
                        bottomPadding: 25
                        horizontalAlignment: HorizontalAlignment.Center
                        Label {
                            text: "<span style='font-size: 30px; letter-spacing: 2px'>WARRANTY</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                        }
                    }
                }
            } // WARRANTY - END
            
            Container { // VALUE - START
                background: Color.create("#A6D067")
                layoutProperties: StackLayoutProperties { spaceQuota: 2 }
                gestureHandlers: TapHandler { onTapped: { toastValue.show() }}
                attachedObjects: [
                    SystemToast {
                        id: toastValue
                        body: "The value represents the price you purchased this item for.\nYou can change this by modifying the 'Purchase Price' field."
                    }   
                ]
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Fill
                    preferredHeight: 100
                    
                    Container {
                        topPadding: 15
                        horizontalAlignment: HorizontalAlignment.Center
                        Label {
                            text: "<span style='font-size: 60px; font-weight: 700'>" + formatPrice(itemPurchasePrice) + "</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                        }
                    }
                    
                    Container {
                        topPadding: 10
                        bottomPadding: 25
                        horizontalAlignment: HorizontalAlignment.Center
                        Label {
                            text: "<span style='font-size: 30px; letter-spacing: 2px'>VALUE</span>"
                            textFormat: TextFormat.Html
                            textStyle.color: Color.White
                        }
                    }
                }
            } // VALUE - END
        } // STATUS (WARRANTY + VALUE) - END
    } // WRAPPER - END
    
    // ACTION-BAR - START
    // ACTION ITEM - BACK
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Back"
            imageSource: "asset:///images/back.png"
            onTriggered: { 
                _app.readRecordsItem()
                
                var pane
                
                if (activeTab == tabRooms)
                    pane = navPaneR
                else if (activeTab == tabLocations)
                    pane = navPaneL
                else if (activeTab == tabItems)
                    pane = navPaneI
                
                pane.pop()
            }
        }
    }
    
    actions: [
        ActionItem { // EDIT - START
            title: "Edit"
            imageSource: "asset:///images/actionbar/edit.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: { showEditItem() }
            
            attachedObjects: [
                ComponentDefinition {
                    id: editItemDef
                    source: "../edit/editItem.qml"
                }
            ]
            
            function showEditItem() {
                var editItem = editItemDef.createObject(editItemDef)
                editItem.open()
            }
        }, // EDIT - END
        
        DeleteActionItem { // DELETE - START
            title: "Delete"
            imageSource: "asset:///images/delete.png"
            
            attachedObjects: [
                SystemDialog {
                    id: dlgDelete
                    title: "Delete Item?"
                    body: "This will delete the selected item."
                    defaultButton: SystemUiButton { label: "Delete" }
                    onFinished: {
                        if (dlgDelete.result == 
                        SystemUiResult.ConfirmButtonSelection) {
                            _app.deleteRecordItem(itemID)
                            
                            // Update records - List in items list
                            _app.readRecordsItem()
                            
                            // Update total # of items
                            itemsSource.load()
                            
                            // Update total # of items with warranty
                            warrantySource.load()
                            
                            var pane
                            
                            if (activeTab == tabRooms)
                                pane = navPaneR
                            else if (activeTab == tabLocations)
                                pane = navPaneL
                            else if (activeTab == tabItems)
                                pane = navPaneI
                            
                            pane.pop()
                        }
                    }
                }
            ]
            
            onTriggered: { dlgDelete.show() }
        }  // DELETE - END
    ] // END ACTION BAR
    
    
    // HELPER FUNCTIONS
    function getConnector() {
        var l = locationName.toLowerCase()
        var arrOnA = ['end table', 'shelf', 'table']
        var arrOnThe = ['ceiling', 'floor']
        if (arrOnA.indexOf(l) != -1) {
            if (l.substring(0, 1) == 'a' ||
	            l.substring(0, 1) == 'e' || 
	            l.substring(0, 1) == 'i' || 
	            l.substring(0, 1) == 'o' || 
	            l.substring(0, 1) == 'u')
            	return " ON AN "
            return " ON A "
        }
        if (arrOnThe.indexOf(l) != -1)
            return " ON THE "
        return " IN A "
    }
    
    // Format date to MM dd, YYYY format
    function formatDate(d) {
        if (d.length == 0)
            return '';
            
        var mNames = [ "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December" ];
        var day = d.split(',')[0];
        var month = d.split(',')[1];
        var year = d.split(',')[2];
        
        return mNames[month] + " " + day + ", " + year;
    }
    
    function formatPrice(num) {
        if(num.length == 0) { return '?' }
        if (num >= 1000000000) { return '$' + (num / 1000000000).toFixed(1) + 'B' }
        if (num >= 1000000) { return '$' + (num / 1000000).toFixed(1) + 'M' }
        if (num >= 10000) { return '$' + (num / 1000).toFixed(1) + 'K' }
            
        num = num.toString().replace(/\$|\,/g, '')
        num = Math.floor(num * 100 + 0.50000000001)
        var cents = num % 100
        num = Math.floor(num / 100).toString()
        if (cents < 10) cents = "0" + cents
        for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3))
        return ('$' + num + '.' + cents)
    }
    
    function setHeaderImage(i){
        var img = i.replace(".png", "-header.png");
        return img;
    }
}