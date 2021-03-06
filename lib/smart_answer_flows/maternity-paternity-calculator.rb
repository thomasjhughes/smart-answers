require 'smart_answer_flows/maternity-paternity-calculator/adoption_calculator_flow'
require 'smart_answer_flows/maternity-paternity-calculator/paternity_calculator_flow'
require 'smart_answer_flows/maternity-paternity-calculator/maternity_calculator_flow'
require 'smart_answer_flows/maternity-paternity-calculator/shared_adoption_maternity_paternity_flow'

module SmartAnswer
  class MaternityPaternityCalculatorFlow < Flow
    def define
      start_page_content_id "05d5412d-455b-485e-a570-020c9176a46e"
      flow_content_id "38c0b111-e9be-40f3-915b-ad1d9bbf3b2b"
      name 'maternity-paternity-calculator'
      status :published
      satisfies_need "100990"

      ## Q1
      multiple_choice :what_type_of_leave? do
        save_input_as :leave_type
        option :maternity
        option :paternity
        option :adoption

        calculate :leave_spp_claim_link do
          nil
        end
        calculate :notice_of_leave_deadline do
          nil
        end
        calculate :monthly_pay_method do
          nil
        end
        calculate :smp_calculation_method do
          nil
        end
        calculate :sap_calculation_method do
          nil
        end
        calculate :above_lower_earning_limit do
          nil
        end
        calculate :paternity_adoption do
          nil
        end
        calculate :spp_calculation_method do
          nil
        end
        calculate :has_contract do
          nil
        end
        calculate :paternity_employment_start do
          nil
        end

        next_node do |response|
          case response
          when 'maternity'
            question :baby_due_date_maternity?
          when 'paternity'
            question :leave_or_pay_for_adoption?
          when 'adoption'
            question :taking_paternity_or_maternity_leave_for_adoption?
          end
        end
      end

      append(AdoptionCalculatorFlow.build)
      append(PaternityCalculatorFlow.build)
      append(MaternityCalculatorFlow.build)
      append(SharedAdoptionMaternityPaternityFlow.build)
    end
  end
end
