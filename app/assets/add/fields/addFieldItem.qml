import bb.cascades 1.0

Sheet { 
    id: sheet
    
    property string fieldSelected: 'none'
    property string fieldTypeSelected: 'none'
    
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
                dataModel: XmlDataModel { source: "models/item.xml" }
                layout: StackListLayout { headerMode: ListHeaderMode.Sticky }
                
                onTriggered: {
                    // Avoid trigger on header items
                    if (indexPath.length > 1) {
                        var selectedItem = dataModel.data(indexPath)
                        fieldSelected = selectedItem.title
                        if (typeof selectedItem.type != 'undefined')
                        	fieldTypeSelected = selectedItem.type
                        sheet.close()
                    }
                }
            }
        } // MAIN CONTENT - END
    }         
    
    onClosed: {
        // WHAT IS IT?
        if (fieldSelected == 'Brand') {
            divWhat.visible = true
            tfBrand.visible = true
            tfBrand.requestFocus()
        } else if (fieldSelected == 'Description') {
            taDescription.visible = true
            taDescription.requestFocus()
        } else if (fieldSelected == 'Model Number') {
            divWhat.visible = true
            tfModelNumber.visible = true
            tfModelNumber.requestFocus()
        } else if (fieldSelected == 'Serial Number') {
            divWhat.visible = true
            tfSerialNumber.visible = true
            tfSerialNumber.requestFocus()
        } else if (fieldSelected == 'Version') {
            divWhat.visible = true
            tfVersion.visible = true
            tfVersion.requestFocus()
            
            // FOOD RELATED INFORMATION
        } else if (fieldSelected == 'Capacity') {
            divFood.visible = true
            tfCapacity.visible = true
            tfCapacity.requestFocus()
        } else if (fieldSelected == 'Expiry Date') {
            divFood.visible = true
            cntrExpiryDate.visible = true
            pkrExpiryDate.requestFocus()
            
            // MEDIA RELATED INFORMATION
        } else if (fieldSelected == 'Artist') {
            divMedia.visible = true
            tfArtist.visible = true
            tfArtist.requestFocus()
        } else if (fieldSelected == 'Author') {
            divMedia.visible = true
            tfAuthor.visible = true
            tfAuthor.requestFocus()
        } else if (fieldSelected == 'Genre') {
            divMedia.visible = true
            tfGenre.visible = true
            tfGenre.requestFocus()
        } else if (fieldSelected == 'Year') {
            divMedia.visible = true
            tfYear.visible = true
            tfYear.requestFocus()
            
            // PURCHASE INFORMATION
        } else if (fieldSelected == 'Date') {
            // If any of forms under purchase information are chosen
            // Show the Purchase Information container
            cntrPurchase.visible = true 
            cntrPurchaseDate.visible = true
            pkrPurchaseDate.requestFocus()
        } else if (fieldSelected == 'Location') {
            // ^
            cntrPurchase.visible = true
            tfPurchaseLocation.visible = true;
            tfPurchaseLocation.requestFocus()
        } else if (fieldSelected == 'Method') {
            // ^
            cntrPurchase.visible = true
            tfPurchaseMethod.visible = true;
            tfPurchaseMethod.requestFocus()
        } else if (fieldSelected == 'Notes' && fieldTypeSelected == 'Purchase') {
            // ^
            cntrPurchase.visible = true;
            taPurchaseNotes.visible = true
            taPurchaseNotes.requestFocus()
        } else if (fieldSelected == 'Price') {
            // ^
            cntrPurchase.visible = true;
            tfPurchasePrice.visible = true
            tfPurchasePrice.requestFocus()
            
        // WARRANTY INFORMATION
        } else if (fieldSelected == 'Contact Name') {
            // If any of forms under warranty information are chosen
            // Show the Warranty container
            cntrWarranty.visible = true 
            tfWarrantyName.visible = true 
            scWarranty.requestFocus()
        } else if (fieldSelected == 'Duration') {
            // If any of forms under warranty information are chosen
            // Show the Warranty container
            cntrWarranty.visible = true 
            cntrWarrantyDate.visible = true 
            cntrWarrantyDateStart.visible = true
            lblWarranty.visible = true
            cntrWarrantyDateEnd.visible = true
            scWarranty.requestFocus()
        } else if (fieldSelected == 'Phone Number') {
            // If any of forms under warranty information are chosen
            // Show the Warranty container
            cntrWarranty.visible = true 
            tfWarrantyNum.visible = true 
            scWarranty.requestFocus()
        } else if (fieldSelected == 'Phone Number (Alt.)') {
            // If any of forms under warranty information are chosen
            // Show the Warranty container
            cntrWarranty.visible = true 
            tfWarrantyNum2.visible = true 
            scWarranty.requestFocus()
        } else if (fieldSelected == 'Notes' && fieldTypeSelected == 'Warranty') {
            // ^
            cntrWarranty.visible = true;
            taWarrantyNotes.visible = true
            taWarrantyNotes.requestFocus()
        
        // MORE INFORMATION
		} else if (fieldSelected == 'Notes' && fieldTypeSelected == 'More') {
			// ^
			cntrMore.visible = true;
			taNotes.visible = true
            taNotes.requestFocus()
		} 
    }
}