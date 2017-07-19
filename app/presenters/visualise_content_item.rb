class VisualiseContentItem
  attr_reader :flow_presenter

  def initialize(flow_presenter)
    @flow_presenter = flow_presenter
  end

  def payload
    {
      base_path: base_path,
      title: flow_presenter.title,
      details: {},
      schema_name: "generic",
      document_type: "smart_answer",
      publishing_app: "smartanswers",
      rendering_app: "smartanswers",
      locale: "en",
      public_updated_at: Time.now.iso8601,
      routes: routes
    }
  end

  def content_id
    @content_id ||= SecureRandom.uuid
  end

private

  def routes
    [
      { type: "exact", path: base_path }
    ]
  end

  def base_path
    "/#{flow_presenter.slug}/visualise"
  end
end
