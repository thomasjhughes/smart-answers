require_relative "../../test_helper"

module SmartAnswer
  module Calculators
    class MarriageAbroadCalculatorTest < ActiveSupport::TestCase
      context '#partner_british?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if partner is british' do
          @calculator.partner_nationality = 'partner_british'
          assert @calculator.partner_british?
        end

        should 'be false if partner is not british' do
          @calculator.partner_nationality = 'not-partner_british'
          refute @calculator.partner_british?
        end
      end

      context '#partner_not_british?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if partner is not british' do
          @calculator.partner_nationality = 'not-partner_british'
          assert @calculator.partner_not_british?
        end

        should 'be false if partner is british' do
          @calculator.partner_nationality = 'partner_british'
          refute @calculator.partner_not_british?
        end
      end

      context '#partner_is_national_of_ceremony_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if partner is a national of the ceremony country' do
          @calculator.partner_nationality = 'partner_local'
          assert @calculator.partner_is_national_of_ceremony_country?
        end

        should 'be false if partner is not a national of the ceremony country' do
          @calculator.partner_nationality = 'not-partner_local'
          refute @calculator.partner_is_national_of_ceremony_country?
        end
      end

      context '#partner_is_not_national_of_ceremony_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if partner is not a national of the ceremony country' do
          @calculator.partner_nationality = 'not-partner_local'
          assert @calculator.partner_is_not_national_of_ceremony_country?
        end

        should 'be false if partner is a national of the ceremony country' do
          @calculator.partner_nationality = 'partner_local'
          refute @calculator.partner_is_not_national_of_ceremony_country?
        end
      end

      context '#partner_is_neither_british_nor_a_national_of_ceremony_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if partner is a national of a country other than britain or the ceremony country' do
          @calculator.partner_nationality = 'partner_other'
          assert @calculator.partner_is_neither_british_nor_a_national_of_ceremony_country?
        end

        should 'be false if partner is not a national of a country other than britain or the ceremony country' do
          @calculator.partner_nationality = 'not-partner_other'
          refute @calculator.partner_is_neither_british_nor_a_national_of_ceremony_country?
        end
      end

      context '#resident_of_uk?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if resident of uk' do
          @calculator.resident_of = 'uk'
          assert @calculator.resident_of_uk?
        end

        should 'be false if not a resident of uk' do
          @calculator.resident_of = 'not-uk'
          refute @calculator.resident_of_uk?
        end
      end

      context '#resident_outside_of_uk?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if not resident of uk' do
          @calculator.resident_of = 'not-uk'
          assert @calculator.resident_outside_of_uk?
        end

        should 'be false if resident of uk' do
          @calculator.resident_of = 'uk'
          refute @calculator.resident_outside_of_uk?
        end
      end

      context '#resident_of_ceremony_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if resident of ceremony country' do
          @calculator.resident_of = 'ceremony_country'
          assert @calculator.resident_of_ceremony_country?
        end

        should 'be false if not resident of ceremony country' do
          @calculator.resident_of = 'not-ceremony_country'
          refute @calculator.resident_of_ceremony_country?
        end
      end

      context '#resident_outside_of_ceremony_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if not resident of ceremony country' do
          @calculator.resident_of = 'not-ceremony_country'
          assert @calculator.resident_outside_of_ceremony_country?
        end

        should 'be false if resident of ceremony country' do
          @calculator.resident_of = 'ceremony_country'
          refute @calculator.resident_outside_of_ceremony_country?
        end
      end

      context '#resident_of_third_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if resident of third country' do
          @calculator.resident_of = 'third_country'
          assert @calculator.resident_of_third_country?
        end

        should 'be false if not resident of third country' do
          @calculator.resident_of = 'not-third_country'
          refute @calculator.resident_of_third_country?
        end
      end

      context '#resident_outside_of_third_country?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true if resident_of != "third_country"' do
          @calculator.resident_of = 'not-third_country'
          assert @calculator.resident_outside_of_third_country?
        end

        should 'be false if resident_of == "third_country"' do
          @calculator.resident_of = 'third_country'
          refute @calculator.resident_outside_of_third_country?
        end
      end

      context '#partner_is_opposite_sex?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true when partner is of the opposite sex' do
          @calculator.sex_of_your_partner = 'opposite_sex'
          assert @calculator.partner_is_opposite_sex?
        end

        should 'be false when partner is not of the opposite sex' do
          @calculator.sex_of_your_partner = 'not-opposite_sex'
          refute @calculator.partner_is_opposite_sex?
        end
      end

      context '#partner_is_same_sex?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true when partner is of the same sex' do
          @calculator.sex_of_your_partner = 'same_sex'
          assert @calculator.partner_is_same_sex?
        end

        should 'be false when partner is not of the same sex' do
          @calculator.sex_of_your_partner = 'not-same_sex'
          refute @calculator.partner_is_same_sex?
        end
      end

      context '#want_to_get_married?' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'be true when the couple want to get married' do
          @calculator.marriage_or_pacs = 'marriage'
          assert @calculator.want_to_get_married?
        end

        should "be false when the couple don't want to get married" do
          @calculator.marriage_or_pacs = 'not-marriage'
          refute @calculator.want_to_get_married?
        end
      end

      context '#world_location' do
        setup do
          @calculator = MarriageAbroadCalculator.new
          @calculator.ceremony_country = 'ceremony-country'
        end

        should 'return the world location for the given ceremony country' do
          WorldLocation.stubs(:find).with('ceremony-country').returns('world-location')

          assert_equal 'world-location', @calculator.world_location
        end

        should 'raise an InvalidResponse exception if the world location cannot be found for the ceremony country' do
          WorldLocation.stubs(:find).with('ceremony-country').returns(nil)

          assert_raise(InvalidResponse) do
            @calculator.world_location
          end
        end
      end

      context '#fco_organisation' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'return the fco organisation for the world location' do
          fco_organisation = stub.quacks_like(WorldwideOrganisation.new({}))
          world_location = stub.quacks_like(WorldLocation.new({}))
          world_location.stubs(fco_organisation: fco_organisation)
          WorldLocation.stubs(:find).with('ceremony-country-with-fco-organisation').returns(world_location)
          @calculator.ceremony_country = 'ceremony-country-with-fco-organisation'

          assert_equal fco_organisation, @calculator.fco_organisation
        end

        should "return nil if the world location doesn't have an fco organisation" do
          world_location = stub.quacks_like(WorldLocation.new({}))
          world_location.stubs(fco_organisation: nil)
          WorldLocation.stubs(:find).with('ceremony-country-without-fco-organisation').returns(world_location)
          @calculator.ceremony_country = 'ceremony-country-without-fco-organisation'

          assert_nil @calculator.fco_organisation
        end
      end

      context '#overseas_passports_embassies' do
        setup do
          @calculator = MarriageAbroadCalculator.new
        end

        should 'return the offices that offer registrations of marriage and civil partnerships' do
          world_office = stub('World Office')
          organisation = stub.quacks_like(WorldwideOrganisation.new({}))
          organisation.stubs(:offices_with_service).with('Registrations of Marriage and Civil Partnerships').returns([world_office])
          @calculator.stubs(fco_organisation: organisation)

          assert_equal [world_office], @calculator.overseas_passports_embassies
        end

        should 'return an empty array when there is no fco organisation' do
          @calculator.stubs(fco_organisation: nil)

          assert_equal [], @calculator.overseas_passports_embassies
        end
      end

      context '#marriage_and_partnership_phrases' do
        setup do
          @data_query = stub.quacks_like(MarriageAbroadDataQuery.new)
          @data_query.stubs(
            ss_marriage_countries?: false,
            ss_marriage_countries_when_couple_british?: false,
            ss_marriage_and_partnership?: false
          )
          @calculator = MarriageAbroadCalculator.new(data_query: @data_query)
        end

        should 'return ss_marriage when the ceremony country is in the list of same sex marriage countries' do
          @calculator.ceremony_country = 'same-sex-marriage-country'
          @data_query.stubs(:ss_marriage_countries?).with('same-sex-marriage-country').returns(true)

          assert_equal 'ss_marriage', @calculator.marriage_and_partnership_phrases
        end

        should 'return ss_marriage when the ceremony country is in the list of same sex marriage countries for british couples' do
          @calculator.ceremony_country = 'same-sex-marriage-country-for-british-couple'
          @data_query.stubs(:ss_marriage_countries_when_couple_british?).with('same-sex-marriage-country-for-british-couple').returns(true)

          assert_equal 'ss_marriage', @calculator.marriage_and_partnership_phrases
        end

        should 'return ss_marriage_and_partnership when the ceremony country is in the list of same sex marriage and partnership countries' do
          @calculator.ceremony_country = 'same-sex-marriage-and-partnership-country'
          @data_query.stubs(:ss_marriage_and_partnership?).with('same-sex-marriage-and-partnership-country').returns(true)

          assert_equal 'ss_marriage_and_partnership', @calculator.marriage_and_partnership_phrases
        end
      end

      context '#ceremony_country_name' do
        should 'return the name of the world location associated with the ceremony country' do
          world_location = stub.quacks_like(WorldLocation.new({}))
          world_location.stubs(name: 'world-location-name')
          calculator = MarriageAbroadCalculator.new
          calculator.stubs(world_location: world_location)

          assert_equal 'world-location-name', calculator.ceremony_country_name
        end
      end

      context '#country_name_lowercase_prefix' do
        setup do
          @country_name_formatter = stub.quacks_like(CountryNameFormatter.new)
          @calculator = MarriageAbroadCalculator.new(country_name_formatter: @country_name_formatter)
          @calculator.ceremony_country = 'country-slug'
        end

        should 'return the definitive article if ceremony country is in the list of countries with definitive article' do
          @country_name_formatter.stubs(:requires_definite_article?).with('country-slug').returns(true)
          @country_name_formatter.stubs(:definitive_article).with('country-slug').returns('the-country-name')

          assert_equal 'the-country-name', @calculator.country_name_lowercase_prefix
        end

        should 'return the friendly country name if definitive article not required and friendly country name found' do
          @country_name_formatter.stubs(:requires_definite_article?).with('country-slug').returns(false)
          @country_name_formatter.stubs(:has_friendly_name?).with('country-slug').returns(true)
          @country_name_formatter.stubs(:friendly_name).with('country-slug').returns('friendly-country-name')

          assert_equal 'friendly-country-name', @calculator.country_name_lowercase_prefix
        end

        should 'return an html safe version of the friendly country name' do
          @country_name_formatter.stubs(:requires_definite_article?).with('country-slug').returns(false)
          @country_name_formatter.stubs(:has_friendly_name?).with('country-slug').returns(true)
          @country_name_formatter.stubs(:friendly_name).with('country-slug').returns('friendly-country-name')

          assert @calculator.country_name_lowercase_prefix.html_safe?
        end

        should 'return the ceremony country name if not in the list of definitive articles or friendly country names' do
          @country_name_formatter.stubs(:requires_definite_article?).with('country-slug').returns(false)
          @country_name_formatter.stubs(:has_friendly_name?).with('country-slug').returns(false)
          @calculator.stubs(ceremony_country_name: 'country-name')

          assert_equal 'country-name', @calculator.country_name_lowercase_prefix
        end
      end

      context '#country_name_uppercase_prefix' do
        setup do
          @country_name_formatter = stub.quacks_like(CountryNameFormatter.new)
          @calculator = MarriageAbroadCalculator.new(country_name_formatter: @country_name_formatter)
          @calculator.ceremony_country = 'country-slug'
        end

        should 'return the ceremony country with upper case definite article' do
          @country_name_formatter.stubs(:definitive_article).with('country-slug', true).returns('The-country-name')

          assert_equal 'The-country-name', @calculator.country_name_uppercase_prefix
        end
      end

      context '#country_name_partner_residence' do
        setup do
          @data_query = stub.quacks_like(MarriageAbroadDataQuery.new)
          @data_query.stubs(
            british_overseas_territories?: false,
            french_overseas_territories?: false,
            dutch_caribbean_islands?: false
          )

          @calculator = MarriageAbroadCalculator.new(data_query: @data_query)
          @calculator.ceremony_country = 'country-slug'
        end

        should 'return "British (overseas territories citizen)" when ceremony country is British overseas territory' do
          @data_query.stubs(:british_overseas_territories?).with('country-slug').returns(true)

          assert_equal 'British (overseas territories citizen)', @calculator.country_name_partner_residence
        end

        should 'return "French" when ceremony country is French overseas territory' do
          @data_query.stubs(:french_overseas_territories?).with('country-slug').returns(true)

          assert_equal 'French', @calculator.country_name_partner_residence
        end

        should 'return "Dutch" when ceremony country is in the Dutch Caribbean islands' do
          @data_query.stubs(:dutch_caribbean_islands?).with('country-slug').returns(true)

          assert_equal 'Dutch', @calculator.country_name_partner_residence
        end

        should 'return "Chinese" when ceremony country is Hong Kong' do
          @calculator.ceremony_country = 'hong-kong'

          assert_equal 'Chinese', @calculator.country_name_partner_residence
        end

        should 'return "Chinese" when ceremony country is Macao' do
          @calculator.ceremony_country = 'macao'

          assert_equal 'Chinese', @calculator.country_name_partner_residence
        end

        should 'return "National of <country_name_lowercase_prefix>" in all other cases' do
          @calculator.stubs(country_name_lowercase_prefix: 'country-name-lowercase-prefix')

          assert_equal 'National of country-name-lowercase-prefix', @calculator.country_name_partner_residence
        end
      end

      context '#embassy_or_consulate_ceremony_country' do
        setup do
          @registrations_data_query = stub.quacks_like(RegistrationsDataQuery.new)
          @registrations_data_query.stubs(
            has_consulate?: false,
            has_consulate_general?: false
          )

          @calculator = MarriageAbroadCalculator.new(registrations_data_query: @registrations_data_query)
          @calculator.ceremony_country = 'country-slug'
        end

        should 'return "consulate" if ceremony country has consulate' do
          @registrations_data_query.stubs(:has_consulate?).with('country-slug').returns(true)

          assert_equal 'consulate', @calculator.embassy_or_consulate_ceremony_country
        end

        should 'return "consulate" if ceremony country has consulate general' do
          @registrations_data_query.stubs(:has_consulate_general?).with('country-slug').returns(true)

          assert_equal 'consulate', @calculator.embassy_or_consulate_ceremony_country
        end

        should 'return "embassy" if ceremony country has neither consulate nor consulate general' do
          assert_equal 'embassy', @calculator.embassy_or_consulate_ceremony_country
        end
      end
    end
  end
end