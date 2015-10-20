import bb.cascades 1.0

Sheet { 
    id: sheetSelectIcon
    Page {
        titleBar: TitleBar {
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: {
                    sheetSelectIcon.close()
                }
            }
            
            title: "Select Icon"
        }
        Container {
            ListView {
                dataModel: XmlDataModel { source: "icons/item.xml" }
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                
                listItemComponents: [
                    ListItemComponent {
                        type: "header"
                        Header {
                            title: ListItemData.title
                        }
                    },
                    
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: ListItemData.title
                            
                            imageSpaceReserved: true
                            imageSource: ListItemData.img
                        }
                    }
                ]
                
                onTriggered: {
                    // Avoid trigger on header items
                    if (indexPath.length > 1) {
                        var selectedItem = dataModel.data(indexPath)
                        btnSelectIcon.setImageSource(selectedItem.img)
                        sheetSelectIcon.close()
                    }
                }
            }
        }
    }         
}