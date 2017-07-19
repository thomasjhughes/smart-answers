require "test_helper"

module SmartAnswer
  class VisualiseContentItemTest < ActiveSupport::TestCase
    include GovukContentSchemaTestHelpers::TestUnit

    setup do
      presenter = stub("flow-registration-presenter", slug: "flow-slug", title: "flow-title")
      @visualise_content_item = VisualiseContentItem.new(presenter)
      load_path = fixture_file("smart_answer_flows")
      SmartAnswer::FlowRegistry.stubs(:instance).returns(stub("Flow registry", find: @flow, load_path: load_path))
    end

    context "#content_id" do
      should "return the visualise-content-id of the presenter" do
        SecureRandom.stubs(:uuid).returns("visualise-content-id")

        assert_equal "visualise-content-id", @visualise_content_item.content_id
      end

      should "generate content id only once" do
        SecureRandom.expects(:uuid).once.returns("visualise-content-id")

        @visualise_content_item.content_id
        @visualise_content_item.content_id
      end
    end
    context "#base_path" do
      should "return the slug of the presenter with a prepended slash and appended /visualise" do
        assert_equal "/flow-slug/visualise", @visualise_content_item.payload[:base_path]
      end
    end

    context "#payload" do
      should "have a valid content-item" do
        assert_valid_against_schema(@visualise_content_item.payload, "generic")
      end

      should "have empty details hash" do
        assert_equal Hash.new, @visualise_content_item.payload[:details]
      end


      should "have schema_name key with generic value" do
        assert_equal "generic", @visualise_content_item.payload[:schema_name]
      end

      should "have document_type key with smart_answer value" do
        assert_equal "smart_answer", @visualise_content_item.payload[:document_type]
      end

      should "have publishing_app key with smartanswers value" do
        assert_equal "smartanswers", @visualise_content_item.payload[:publishing_app]
      end

      should "have rendering_app key with smartanswers value" do
        assert_equal "smartanswers", @visualise_content_item.payload[:rendering_app]
      end

      should "have locale key with en value" do
        assert_equal "en", @visualise_content_item.payload[:locale]
      end

      should "have public_updated_at timestamp with current time value" do
        now = Time.now
        Time.stubs(:now).returns(now)

        assert_equal now.iso8601, @visualise_content_item.payload[:public_updated_at]
      end

      should "have a route type of exact and path of /slug/visualise" do
        expected_route = { type: "exact", path: "/flow-slug/visualise" }
        assert @visualise_content_item.payload[:routes].include?(expected_route)
      end
    end
  end
end
