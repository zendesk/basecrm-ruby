require 'json'
require 'faraday'

require 'basecrm/version'
require 'basecrm/errors'
require 'basecrm/envelope'
require 'basecrm/configuration'
require 'basecrm/http_client'

require 'basecrm/utils/coercion'

require 'basecrm/model'
require 'basecrm/models/meta'
require 'basecrm/models/account'
require 'basecrm/models/address'
require 'basecrm/models/associated_contact'
require 'basecrm/models/contact'
require 'basecrm/models/deal'
require 'basecrm/models/deal_source'
require 'basecrm/models/lead'
require 'basecrm/models/lead_source'
require 'basecrm/models/loss_reason'
require 'basecrm/models/note'
require 'basecrm/models/pipeline'
require 'basecrm/models/source'
require 'basecrm/models/stage'
require 'basecrm/models/tag'
require 'basecrm/models/task'
require 'basecrm/models/user'
require 'basecrm/models/sync_queue'
require 'basecrm/models/sync_session'
require 'basecrm/models/sync_meta'

require 'basecrm/paginated_resource'
require 'basecrm/services/accounts_service'
require 'basecrm/services/associated_contacts_service'
require 'basecrm/services/contacts_service'
require 'basecrm/services/deals_service'
require 'basecrm/services/deal_sources_service'
require 'basecrm/services/leads_service'
require 'basecrm/services/lead_sources_service'
require 'basecrm/services/loss_reasons_service'
require 'basecrm/services/notes_service'
require 'basecrm/services/pipelines_service'
require 'basecrm/services/sources_service'
require 'basecrm/services/stages_service'
require 'basecrm/services/tags_service'
require 'basecrm/services/tasks_service'
require 'basecrm/services/users_service'
require 'basecrm/services/sync_service'

require 'basecrm/sync'

module BaseCRM
  class Client
    attr_reader :config
    attr_reader :http_client

    # Instantiate a new BaseCRM API V2 client
    #
    # @param options [Hash] Client options
    # @option options [String] :access_token Personal access token
    # @option options [String] :base_url (https://api.getbase.com) Base url for the api
    # @option options [String] :use_agent (BaseCRM/v2 Ruby/{Version}) Client user agent
    # @option options [Integer] :timeout (30) Request timeout
    # @option options [Boolean] :verbose (false) Verbose/debug mode
    # @option options [Logger] :logger (STDOUT) Logged used in verbose mode
    #
    # @raise [ConfigurationError] if no access token provided
    # @raise [ConfigurationError] if provided access token is invalid - contains disallowed characters
    # @raise [ConfigurationError] if provided access token is invalid - has invalid length
    # @raise [ConfigurationError] if provided base url is invalid
    #
    # @return [Client] New client
    def initialize(options={})
      @config = Configuration.new(options)
      @config.validate!

      @http_client = HttpClient.new(@config)
    end

    # Access all Accounts related actions.
    # @see AccountsService
    # @see Account
    #
    # @return [AccountsService] Service object for  resources.
    def accounts
      @accounts ||= AccountsService.new(@http_client)
    end

    # Access all AssociatedContacts related actions.
    # @see AssociatedContactsService
    # @see AssociatedContact
    #
    # @return [AssociatedContactsService] Service object for  resources.
    def associated_contacts
      @associated_contacts ||= AssociatedContactsService.new(@http_client)
    end

    # Access all Contacts related actions.
    # @see ContactsService
    # @see Contact
    #
    # @return [ContactsService] Service object for  resources.
    def contacts
      @contacts ||= ContactsService.new(@http_client)
    end

    # Access all Deals related actions.
    # @see DealsService
    # @see Deal
    #
    # @return [DealsService] Service object for  resources.
    def deals
      @deals ||= DealsService.new(@http_client)
    end

    # Access all DealSources related actions.
    # @see DealSourcesService
    # @see DealSource
    #
    # @return [DealSourcesService] Service object for  resources.
    def deal_sources
      @deal_sources ||= DealSourcesService.new(@http_client)
    end

    # Access all Leads related actions.
    # @see LeadsService
    # @see Lead
    #
    # @return [LeadsService] Service object for  resources.
    def leads
      @leads ||= LeadsService.new(@http_client)
    end

    # Access all LeadSources related actions.
    # @see LeadSourcesService
    # @see LeadSource
    #
    # @return [LeadSourcesService] Service object for  resources.
    def lead_sources
      @lead_sources ||= LeadSourcesService.new(@http_client)
    end

    # Access all LossReasons related actions.
    # @see LossReasonsService
    # @see LossReason
    #
    # @return [LossReasonsService] Service object for  resources.
    def loss_reasons
      @loss_reasons ||= LossReasonsService.new(@http_client)
    end

    # Access all Notes related actions.
    # @see NotesService
    # @see Note
    #
    # @return [NotesService] Service object for  resources.
    def notes
      @notes ||= NotesService.new(@http_client)
    end

    # Access all Pipelines related actions.
    # @see PipelinesService
    # @see Pipeline
    #
    # @return [PipelinesService] Service object for  resources.
    def pipelines
      @pipelines ||= PipelinesService.new(@http_client)
    end

    # Access all Sources related actions.
    # @see SourcesService
    # @see Source
    #
    # @return [SourcesService] Service object for  resources.
    def sources
      @sources ||= SourcesService.new(@http_client)
    end

    # Access all Stages related actions.
    # @see StagesService
    # @see Stage
    #
    # @return [StagesService] Service object for  resources.
    def stages
      @stages ||= StagesService.new(@http_client)
    end

    # Access all Tags related actions.
    # @see TagsService
    # @see Tag
    #
    # @return [TagsService] Service object for  resources.
    def tags
      @tags ||= TagsService.new(@http_client)
    end

    # Access all Tasks related actions.
    # @see TasksService
    # @see Task
    #
    # @return [TasksService] Service object for  resources.
    def tasks
      @tasks ||= TasksService.new(@http_client)
    end

    # Access all Users related actions.
    # @see UsersService
    # @see User
    #
    # @return [UsersService] Service object for  resources.
    def users
      @users ||= UsersService.new(@http_client)
    end

    # Access Sync API related low-level actions.
    # @see SyncService
    #
    # @return [SyncService] Service object for Sync API.
    def sync
      @sync ||= SyncService.new(@http_client)
    end
  end
end
