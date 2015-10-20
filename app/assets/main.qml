import bb.cascades 1.0
import bb.data 1.0

TabbedPane {
    id: tabbedPane
    
    property Page page
    
    property int roomsTotal: 0
    property int locationsTotal: 0
    property int itemsTotal: 0
    property int valueTotal: 0
    property int warrantyTotal: 0
    
    property string unit: _app.getValueFor('home-unit', '')
    property string street_num: _app.getValueFor('home-street_num', '')
    property string street_name: _app.getValueFor('home-street_name', '')
    property string street_suffix: _app.getValueFor('home-street_suffix', '')
    property string municipality: _app.getValueFor('home-municipality', '')
    property string province: _app.getValueFor('home-province', '')
    property string postal_code: _app.getValueFor('home-postal_code', '')
    property string sqft: _app.getValueFor('home-sqft', '')
    property string stories: _app.getValueFor('home-stories', '')
    property string year_built: _app.getValueFor('home-year_built', '')
    property string year_purchased: _app.getValueFor('home-year_purchased', '')
    property string picture: _app.getValueFor('home-picture', 'asset:///images/placeholders/home/home-placeholder-add.png')
    
    showTabsOnActionBar: false
    
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                title: "About"
                imageSource: "asset:///images/actionbar/info.png" 
                onTriggered : { 
                    var pane
                    if (activeTab == tabDashboard)
                        pane = navPaneD
                    else if (activeTab == tabHome)
                        pane = navPaneH
                    else if (activeTab == tabRooms)
                        pane = navPaneR
                    else if (activeTab == tabLocations)
                        pane = navPaneL
                    else if (activeTab == tabItems)
                        pane = navPaneI
                    
                    page = aboutDef.createObject()
                    pane.push(page)
                }
                
                attachedObjects: [
                    ComponentDefinition {
                        id: aboutDef
                        source: 'about.qml'
                    }
                ]
            }, 
            
            ActionItem {
                title: "Help"
                imageSource: "asset:///images/actionbar/help.png" 
                onTriggered : { 
                    var pane
                    if (activeTab == tabDashboard)
                        pane = navPaneD
                    else if (activeTab == tabHome)
                        pane = navPaneH
                    else if (activeTab == tabRooms)
                        pane = navPaneR
                    else if (activeTab == tabLocations)
                        pane = navPaneL
                    else if (activeTab == tabItems)
                        pane = navPaneI
                    
                    page = helpDef.createObject()
                    pane.push(page)
                }
                
                attachedObjects: [
                    ComponentDefinition {
                        id: helpDef
                        source: 'help.qml'
                    }
                ]
            }
        ]
    }

    Tab { //Dashboard tab
        id: tabDashboard
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Dashboard") + Retranslate.onLocaleOrLanguageChanged
        description: 'Statistics and numbers galore!'
        imageSource: "asset:///images/actionbar/dashboard.png"
        onTriggered: { 
            roomsSource.load()
            locationsSource.load()
            itemsSource.load()
            valueSource.load()
            warrantySource.load()
            
            // Update labels in dashboard
            street_num = _app.getValueFor('home-street_num', '')
            street_name = _app.getValueFor('home-street_name', '')
            street_suffix = _app.getValueFor('home-street_suffix', '')
            unit = _app.getValueFor('home-unit', '')
            municipality = _app.getValueFor('home-municipality', '')
            province = _app.getValueFor('home-province', '')
            postal_code = _app.getValueFor('home-postal_code', '')
            sqft = _app.getValueFor('home-sqft', '')
            stories = _app.getValueFor('home-stories', '')
            year_built = _app.getValueFor('home-year_built', '')
            year_purchased = _app.getValueFor('home-year_purchased', '')
        }
        
        NavigationPane {
            id: navPaneD
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
            Dashboard {}
        }
    } // DASHBOARD - END
    
    Tab { // HOME - START
        id: tabHome
        title: "Home"
        description: 'Nothing like home sweet home.'
        imageSource: "asset:///images/actionbar/home.png"
        onTriggered: { }
        
        NavigationPane {
            id: navPaneH
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
            Home {}
        }
    } // HOME - END
    
    Tab { // ROOMS - START
        id: tabRooms
        title: "Rooms"
        description: 'The space occupied by locations and items.'
        imageSource: "asset:///images/actionbar/rooms.png"
        onTriggered: { _app.readRecordsRoom(); roomsSource.load() }
        
        NavigationPane {
            id: navPaneR
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
            Rooms {}
        }
    } // ROOMS - END
    
    Tab { // LOCATIONS - START
        id: tabLocations
        title: "Locations"
        description: 'The places items are found in/on.'
        imageSource: "asset:///images/actionbar/locations.png"
        onTriggered: { _app.readRecordsLocation(); locationsSource.load() }
        
        NavigationPane {
            id: navPaneL
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
            Locations {}
        }
    } // LOCATIONS - END
    
    Tab { // ITEMS - START
        id: tabItems
        title: "Items"
        description: 'Everything else!'
        imageSource: "asset:///images/actionbar/items.png"
        onTriggered: { _app.readRecordsItem(); itemsSource.load(); warrantySource.load() }
        
        NavigationPane {
            id: navPaneI
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
            Items {}
        }
    } // ITEMS - END
    
    Tab { // COLLECTIONS - START
        id: tabCollections
        title: "Collections"
        description: 'Everything else!'
        imageSource: "asset:///images/actionbar/collections.png"
        onTriggered: { }
        
        NavigationPane {
            id: navPaneC
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
            Collections {}
        }
    } // COLLECTIONS - END
    
    attachedObjects: [
        GroupDataModel { id: roomsModel; onItemAdded: { roomsTotal += 1 }},
        GroupDataModel { id: locationsModel; onItemAdded: { locationsTotal += 1 }},
        GroupDataModel { id: itemsModel; onItemAdded: { itemsTotal += 1 }},
        GroupDataModel { id: valueModel; 
            onItemAdded: { 
                var i = data(indexPath)
                var p = i.purchase_price
                
                if (!isNaN(p))
                    valueTotal += parseFloat(p)
            }
        },
        GroupDataModel { id: warrantyModel; onItemAdded: { warrantyTotal += 1 }},
        
        DataSource {
            id: roomsSource
            source: paths.db
            query: "SELECT * FROM rooms"
            onDataLoaded: { roomsTotal = 0; roomsModel.clear(); roomsModel.insertList(data) }
        },
        
        DataSource {
            id: locationsSource
            source: paths.db
            query: "SELECT * FROM locations"
            onDataLoaded: { locationsTotal = 0; locationsModel.clear(); locationsModel.insertList(data) }
        },
        
        DataSource {
            id: itemsSource
            source: paths.db
            query: "SELECT * FROM items"
            onDataLoaded: { itemsTotal = 0; itemsModel.clear(); itemsModel.insertList(data) }
        },
        
        DataSource {
            id: valueSource
            source: paths.db
            query: "SELECT * FROM items WHERE purchase_price IS NOT NULL AND TRIM(purchase_price) <> ''"
            onDataLoaded: { valueTotal = 0; valueModel.clear(); valueModel.insertList(data) }
        },
        
        DataSource {
            id: warrantySource
            source: paths.db
            query: "SELECT * FROM items WHERE warranty = 'Yes'"
            onDataLoaded: { warrantyTotal = 0; warrantyModel.clear(); warrantyModel.insertList(data) }
        }
    ]
}
