import bb.cascades 1.0

Sheet { 
    id: sheet
    Page {
        
        // TITLEBAR - START
        titleBar: TitleBar {
            title: "Add Field"
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: { sheet.close() }
            }
        } // TITLEBAR - END
        
        // MAIN CONTENT - START
        Container {
            ListView {
                dataModel: XmlDataModel { source: "models/location.xml" }
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                
                onTriggered: {
                    // Avoid trigger on header items
                    if (indexPath.length > 1) {
                        var selectedItem = dataModel.data(indexPath)
                        if (selectedItem.title == 'Description')
                            taDescription.visible = true
                        else if (selectedItem.title == 'Position')
                            ddPosition.visible = true
                        
                        sheet.close()
                    }
                }
            }
        } // MAIN CONTENT - END
    }         
}