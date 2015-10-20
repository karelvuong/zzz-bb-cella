import bb.cascades 1.0

Sheet { 
    id: sheet
    Page {
        titleBar: TitleBar {
            title: "Add Field"
            dismissAction: ActionItem {
                title: "Cancel"
                onTriggered: { sheet.close() }
            }
        }
        Container {
            ListView {
                dataModel: XmlDataModel { source: "models/room.xml" }
                
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                
                onTriggered: {
                    // Avoid trigger on header items
                    if (indexPath.length > 1) {
                        var selectedItem = dataModel.data(indexPath);
                        if (selectedItem.title == 'Description')
                            taDescription.visible = true
                        
                        sheet.close()
                    }
                }
            }
        }
    }         
}