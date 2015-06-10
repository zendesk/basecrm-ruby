## CHANGELOG

### v1.1.1 (2015-06-10)

**Features and Improvements**

* Sync API support
  * better handling of unexpected entity types
  * `BaseCRM::SyncService#fetch` method returns `BaseCRM::Meta`instead of `BaseCRM::SyncMeta`. 
    This gives you additional information such as type. 
  * High-level `BaseCRM::Sync` wrapper expects either `meta.sync.ack` or `meta.sync.nack` to be called.

### v1.1.0 (2015-05-29)

**Features and Improvements**

* Sync API support
  * New `BaseCRM::SyncService`
  * High-level `BaseCRM::Sync` wrapper

### v1.0.0 (2015-04-17)

* Birth!
