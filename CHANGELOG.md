## CHANGELOG

v1.2.1 (2016-11-18)

**Features and Improvements**

* Fix deal creation with hash as argument [#39](https://github.com/basecrm/basecrm-ruby/pull/39)

## v1.2.0 (2016-07-24)

**Features and Improvements**

* Decimal deal values support [#34](https://github.com/basecrm/basecrm-ruby/pull/34)
* Deal value is now a BigDecimal [#34](https://github.com/basecrm/basecrm-ruby/pull/34)

### v1.1.3 (2015-06-17)

**Features and Improvements**

* Compatibility with Ruby 2.0.0+

### v1.1.2 (2015-06-17)

**Features and Improments**

* `BaseCRM::HttpClient` prints response payload in debug mode.
* `BaseCRM::SyncService#fetch` method return `nil` value if there is nothing more to synchronize. Previously it returned an empty array. This change fixes an issue where the sync service can return an empty array as a valid response.

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
