# basecrm-ruby

BaseCRM Official API V2 library client for ruby

## Installation

Make sure you have [rubygems](https://rubygems.org) installed.

The gem is available via Rubygems. To install, use the following command:

```ruby
gem install basecrm
```

If you use Bundler, put the line below in your Gemfile:

```ruby
gem 'basecrm'
```

To get the latest version, put this in your Gemfile:

```ruby
gem 'basecrm', :git => 'git://github.com/zendesk/basecrm-ruby.git'
```

## Usage

```ruby
require "basecrm"

# Then we instantiate a client (as shown below)
```

### Build a client
__Using this api without authentication gives an error__

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
```

### Client Options

The following options are available while instantiating a client:

 * __access_token__: Personal access token
 * __base_url__: Base url for the api
 * __user_agent__: Default user-agent for all requests
 * __timeout__: Request timeout
 * __verbose__: Verbose/debug mode
 * __logger__: Logger used in verbose mode
 * __max_retry__: Number of retries on failed requests. Passed to Faraday
 * __retry_statuses__: By default only timeout error will be retries. This allows to retry on specific HTTP statuses. Passed to Faraday

### Architecture

The library follows few architectural principles you should understand before digging deeper.
1. Interactions with resources are done via service objects.
2. Service objects are exposed as methods on client instances.
3. Service objects expose resource-oriented actions.
4. Actions return Plain Old Ruby Objects.

For example, to interact with deals API you will use `DealsService`, which you can get if you call:

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deals # => BaseCRM::DealsService
```

When you want to fetch **all** resources you will use `#all` method which returns paginated resource (which implements Enumerable):

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deals.all.map { |deal| deal.name } # => Array<String>
```

To retrieve list of resources and use filtering you will call `#where` method:

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deals.where(organization_id: google.id, hot: true) # => Array<BaseCRM::Deal>
```

To find a resource by it's unique identifier use `#find` method:

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deals.find(id) # => BaseCRM::Deal
```

When you'd like to create a resource, or update it's attributes you want to use either `#create` or `#update` methods. Both of them can take either Hash or a model class e.g. Deal instance. For example if you want to create a new deal you will call:

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
coffeeshop = client.contacts.where(name: "Coffee Shop")

deal = client.deals.create(name: "Website redesign", contact_id: coffeeshop.id)
deal.value = BigDecimal("1000.99")
deal.currency = "USD"

client.deals.update(deal) # => BaseCRM::Deal
```

To destroy a resource use `#destroy` method:

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deals.destroy(id) # => true
```

There other non-CRUD operations supported as well. Please contact corresponding service files for in-depth documentation.

### Full example

Create a new organization and after that change it's attributes (website).

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
lead = client.leads.create(organization_name: "Design service company")

lead.website = "http://www.designservices.com"
client.leads.update(lead)
```

## Sync API

The following sample code shows how to perform a full synchronization flow using high-level wrapper.

First of all you need an instance of `BaseCRM::Client`. High-level `BaseCRM::Sync` wrapper is using `BaseCRM::SyncService` to interact with the Sync API.
In addition to the client instance, you must provide a device’s UUID within `device_uuid` parameter. The device’s UUID must not change between synchronization sessions, otherwise the sync service will not recognize the device and will send all the data again.

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
sync = BaseCRM::Sync.new(client: client, device_uuid: "<YOUR_DEVICES_UUID>")
```

Now all you have to do is to call `#fetch` method and pass a block that you might use to store fetched data to a database.

```ruby
sync.fetch do |meta, resource|
  options = {
    table: meta.type,
    statement: meta.sync.event_type,
    properties: resource
  }

  DB.execute(options) ? meta.sync.ack : meta.sync.nack
end
```

Notice that you must call either `#ack` or `#nack` method on an instance of `BaseCRM::SyncMeta`.

## Resources and actions

Documentation for every action can be found in corresponding service files under `lib/basecrm/services` directory.

### Account

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.accounts # => BaseCRM::AccountsService
```

Actions:
* Retrieve account details - `client.accounts.self`

### AssociatedContact

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.associated_contacts # => BaseCRM::AssociatedContactsService
```

Actions:
* Retrieve deal's associated contacts - `client.associated_contacts.all`
* Create an associated contact - `client.associated_contacts.create`
* Remove an associated contact - `client.associated_contacts.destroy`

### Call

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.calls # => BaseCRM::CallsService
```

Actions:
* Retrieve all calls - `client.calls.all`
* Create a call - `client.calls.create`
* Retrieve a single call - `client.calls.find`
* Update a call - `client.calls.update`
* Delete a call - `client.calls.destroy`

### CallOutcome

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.call_outcomes # => BaseCRM::CallOutcomesService
```

Actions:
* Retrieve all call outcomes - `client.call_outcomes.all`

### Contact

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.contacts # => BaseCRM::ContactsService
```

Actions:
* Retrieve all contacts - `client.contacts.all`
* Create a contact - `client.contacts.create`
* Retrieve a single contact - `client.contacts.find`
* Update a contact - `client.contacts.update`
* Delete a contact - `client.contacts.destroy`

### Deal

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deals # => BaseCRM::DealsService
```

Actions:
* Retrieve all deals - `client.deals.all`
* Create a deal - `client.deals.create`
* Retrieve a single deal - `client.deals.find`
* Update a deal - `client.deals.update`
* Delete a deal - `client.deals.destroy`

**A note about deal value**

It is prefered to use a BigDecimal when creating or modyfing a deal value. This guarantees correct precision

```
deal.value = BigDecimal("1000.98")
```

You should not be using floats as it may result in precision loss.

```
deal.value = 1000.98
```

### DealSource

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deal_sources # => BaseCRM::DealSourcesService
```

Actions:
* Retrieve all sources - `client.deal_sources.all`
* Create a new source - `client.deal_sources.create`
* Retrieve a single source - `client.deal_sources.find`
* Update a source - `client.deal_sources.update`
* Delete a source - `client.deal_sources.destroy`

### DealUnqualifiedReason

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.deal_unqualified_reasons # => BaseCRM::DealUnqualifiedReasonsService
```

Actions:
* Retrieve all deal unqualified reasons - `client.deal_unqualified_reasons.all`
* Create a deal unqualified reason - `client.deal_unqualified_reasons.create`
* Retrieve a single deal unqualified reason - `client.deal_unqualified_reasons.find`
* Update a deal unqualified reason - `client.deal_unqualified_reasons.update`
* Delete a deal unqualified reason - `client.deal_unqualified_reasons.destroy`

### Lead

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.leads # => BaseCRM::LeadsService
```

Actions:
* Retrieve all leads - `client.leads.all`
* Create a lead - `client.leads.create`
* Retrieve a single lead - `client.leads.find`
* Update a lead - `client.leads.update`
* Delete a lead - `client.leads.destroy`

### LeadSource

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.lead_sources # => BaseCRM::LeadSourcesService
```

Actions:
* Retrieve all sources - `client.lead_sources.all`
* Create a new source - `client.lead_sources.create`
* Retrieve a single source - `client.lead_sources.find`
* Update a source - `client.lead_sources.update`
* Delete a source - `client.lead_sources.destroy`

### LeadUnqualifiedReason

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.lead_unqualified_reasons # => BaseCRM::LeadUnqualifiedReasonsService
```

Actions:
* Retrieve all lead unqualified reasons - `client.lead_unqualified_reasons.all`

### LineItem

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.line_items # => BaseCRM::LineItemsService
```

Actions:
* Retrieve order's line items - `client.line_items.all`
* Create a line item - `client.line_items.create`
* Retrieve a single line item - `client.line_items.find`
* Delete a line item - `client.line_items.destroy`

### LossReason

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.loss_reasons # => BaseCRM::LossReasonsService
```

Actions:
* Retrieve all reasons - `client.loss_reasons.all`
* Create a loss reason - `client.loss_reasons.create`
* Retrieve a single reason - `client.loss_reasons.find`
* Update a loss reason - `client.loss_reasons.update`
* Delete a reason - `client.loss_reasons.destroy`

### Note

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.notes # => BaseCRM::NotesService
```

Actions:
* Retrieve all notes - `client.notes.all`
* Create a note - `client.notes.create`
* Retrieve a single note - `client.notes.find`
* Update a note - `client.notes.update`
* Delete a note - `client.notes.destroy`

### Order

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.orders # => BaseCRM::OrdersService
```

Actions:
* Retrieve all orders - `client.orders.all`
* Create an order - `client.orders.create`
* Retrieve a single order - `client.orders.find`
* Update an order - `client.orders.update`
* Delete an order - `client.orders.destroy`

### Pipeline

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.pipelines # => BaseCRM::PipelinesService
```

Actions:
* Retrieve all pipelines - `client.pipelines.all`

### Product

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.products # => BaseCRM::ProductsService
```

Actions:
* Retrieve all products - `client.products.all`
* Create a product - `client.products.create`
* Retrieve a single product - `client.products.find`
* Update a product - `client.products.update`
* Delete a product - `client.products.destroy`

### Source (Deprecated, use LeadSource or DealSource instead)

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.sources # => BaseCRM::SourcesService
```

Actions:
* Retrieve all sources - `client.sources.all`
* Create a source - `client.sources.create`
* Retrieve a single source - `client.sources.find`
* Update a source - `client.sources.update`
* Delete a source - `client.sources.destroy`

### Stage

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.stages # => BaseCRM::StagesService
```

Actions:
* Retrieve all stages - `client.stages.all`

### Tag

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.tags # => BaseCRM::TagsService
```

Actions:
* Retrieve all tags - `client.tags.all`
* Create a tag - `client.tags.create`
* Retrieve a single tag - `client.tags.find`
* Update a tag - `client.tags.update`
* Delete a tag - `client.tags.destroy`

### Task

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.tasks # => BaseCRM::TasksService
```

Actions:
* Retrieve all tasks - `client.tasks.all`
* Create a task - `client.tasks.create`
* Retrieve a single task - `client.tasks.find`
* Update a task - `client.tasks.update`
* Delete a task - `client.tasks.destroy`

### TextMessage

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.text_messages # => BaseCRM::TextMessagesService
```

Actions:
* Retrieve text messages - `client.text_messages.all`
* Retrieve a single text message - `client.text_messages.find`

### User

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.users # => BaseCRM::UsersService
```

Actions:
* Retrieve all users - `client.users.all`
* Retrieve a single user - `client.users.find`
* Retrieve an authenticating user - `client.users.self`

### Visit

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.visits # => BaseCRM::VisitsService
```

Actions:
* Retrieve visits - `client.visits.all`

### VisitOutcome

```ruby
client = BaseCRM::Client.new(access_token: "<YOUR_PERSONAL_ACCESS_TOKEN>")
client.visit_outcomes # => BaseCRM::VisitOutcomesService
```

Actions:
* Retrieve visit outcomes - `client.visit_outcomes.all`

## Bug Reports
Report [here](https://github.com/zendesk/basecrm-ruby/issues).

## Releasing new version of gem

1. Update version [lib/basecrm/version.rb](lib/basecrm/version.rb) and [VERSION](VERSION) and push to `master`
2. Create new GitHub release with tag name starting with `v` and the version, for example `v1.0.0`
3. Gem will be automatically built and pushed to rubygems.org with GitHub Action

## Copyright and license

Copyright 2013 Zendesk

Licensed under the [Apache License, Version 2.0](LICENSE)
