# ios-cache
iOS Cache

## Save cache using CoreData and SQLite

1) SQLite:

	- SQLite is, as advertised, lightweight.
	- SQLite uses less memory and storage space.
	- SQLite can be tedious and error-prone to code.
	- SQLite is supported on Android and Microsoft Windows Phone.

2) Core Data

[https://cms-assets.tutsplus.com/uploads/users/41/posts/20926/image/figure-03.jpg]

	- Longer learning curve: it takes some study to understand.
	- Objects are easier to work with.
	- Underlying storage details are handled atomically (support for iCloud).
	- Undo and Redo features.

Core Data Stack: NSManagedObjectModel, NSPersistentStoreCoordinator, NSManagedObjectContext

3) App Extensions

Requires: iOS 8, OS X Yosemite

3.1) Action

3.2) Share

3.3) Today
"Your apps can now display widgets in the Today view of Notification Center, providing quick updates or enabling brief tasks — for example, posting updates on package deliveries, the latest surf reports, or breaking news stories."


## References

iOS Data Storage: Core Data vs. SQLite: http://www.drdobbs.com/mobile/ios-data-storage-core-data-vs-sqlite/240168843	

An iOS 7 Core Data Tutorial: http://www.techotopia.com/index.php/An_iOS_7_Core_Data_Tutorial

App Extensions: https://developer.apple.com/app-extensions/