## CHANGELOG
v2.0.0 (2021-10-26)
**Features and Improvements**
* Faraday updated to version > 1.0
* Optional parameters `max_retry` and `retry_statuses` to specify no. of retries on failed request and statuses to retry.

v1.3.10 (2021-06-28)
 **Features and Improvements**
 * Added possibility to set deal's 'added_on' attribute

v1.3.9 (2021-03-30)
  **Features and Improvements**

  * Fixed issue where `unqualified_reason_id` param for deals could not be updated

v1.3.8 (2019-05-11)
 **Features and Improvements**

 * Update github url references to new Zendesk organisation

v1.3.7 (2019-04-22)
 **Features and Improvements**

 * Update gemspec license and authors

v1.3.6 (2019-02-18)
 **Features and Improvements**

 * Update Contact model documentation
 * Replace deprecated `BigDecimal.new()` with `BigDecimal()`
 * Replace deprecated `FactoryGirl` gem with `FactoryBot` gem

v1.3.5 (2018-10-09)
 **Features and Improvements**

 * Added new models support: TextMessage, Visit and VisitOutcome

v1.3.4 (2018-07-04)
**Features and Improvements**

* Added new models support: Call, CallOutcome

v1.3.3 (2018-06-05)
**Features and Improvements**

* Added new models support: LeadUnqualifiedReason, DealUnqualifiedReason

v1.3.2 (2018-01-11)
**Features and Improvements**

* Fixed undefined method exception on error handling [issue #54](https://github.com/zendesk/basecrm-ruby/issues/54)

v1.3.1 (2017-12-08)
**Features and Improvements**

* Fixed issue where could not update deal without passing value

v1.3.0 (2017-10-19)
**Features and Improvements**

* Added new models support: LeadSource, DealSource, Product, Order, LineItem
* Deal model update, added estimated_close_date and customized_win_likelihood

v1.2.3 (2017-10-02)
**Features and Improvements**

* Missing source_id in Leads model
* Relax upper version boundary for JSON gem dependency

v1.2.2 (2017-04-03)
**Features and Improvements**

* Missing last_stage_change_at in Deals model [#45](https://github.com/zendesk/basecrm-ruby/pull/45)

v1.2.1 (2016-11-18)

**Features and Improvements**

* Fix deal creation with hash as argument [#39](https://github.com/zendesk/basecrm-ruby/pull/39)

## v1.2.0 (2016-07-24)

**Features and Improvements**

* Decimal deal values support [#34](https://github.com/zendesk/basecrm-ruby/pull/34)
* Deal value is now a BigDecimal [#34](https://github.com/zendesk/basecrm-ruby/pull/34)

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
