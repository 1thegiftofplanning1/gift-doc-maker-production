class DocumentsController < ApplicationController

  def document
    @person = Person.where(:mask =>params[:mask]).first
    if params[:type] and params[:type] != "all"
      @docs = {params[:type].to_sym => document_list[params[:type].to_sym]}
    else
      @docs = document_list
    end
    respond_to do |format|
      format.html
      format.pdf  {
        options = {
            name: controller_name,
            document_type:  :pdf,
            strict:  "none",
            javascript: "true",
            test: "false", # ! Rails.env.production?,
        }
        options[:document_content] ||= render_to_string(template: '/documents/document.html.haml', layout: '/layouts/documents.html.haml', format: 'html')
        response = DocRaptor.create(options)
        if response.code == 200
          send_data response, :filename => "#{options[:name]}.pdf"
        else
          render :inline => response.body, :status => response.code
        end
      }
    end
  end

  def document_list
    @person = Person.where(:mask =>params[:mask]).first
  
    
              
    if @person.will?      
      document_list ={
          :signing_instructions_will => "documents/signing_instructions_will", 
          :will_simple => "documents/will_simple",
          :power_of_attorney => "documents/power_of_attorney",
          :advance_directive => "documents/advance_directive" 
      }
      
    elsif @person.single? && @person.trust?
        document_list ={            
            :signing_instructions => "documents/signing_instructions",
            :trust_single => "documents/trust_single",
            :will_single => "documents/will_single",
            :power_of_attorney => "documents/power_of_attorney", 
            :advance_directive => "documents/advance_directive",
            :certificate_of_trust => "documents/certificate_of_trust",
            :trust_amendment => "documents/trust_amendment"
                   
        }  
      
    elsif @person.trust?
      document_list ={
        :trust => "documents/trust",
        :will => "documents/will",
        :will_spouse => "documents/will_spouse",
        :power_of_attorney => "documents/power_of_attorney", 
        :power_of_attorney_spouse => "documents/power_of_attorney_spouse",  
        :advance_directive => "documents/advance_directive",
        :advance_directive_spouse => "documents/advance_directive_spouse",
        :certificate_of_trust => "documents/certificate_of_trust",
        :signing_instructions => "documents/signing_instructions", 
        :trust_amendment => "documents/trust_amendment"     
        
      }
      
    
    end
         
          
    
  end


end

=begin
:trust => "documents/trust",
        :trust => "documents/trust",
        :will => "documents/will",
        :will_spouse => "documents/will_spouse",
        :power_of_attorney => "documents/power_of_attorney", 
        :power_of_attorney_spouse => "documents/power_of_attorney_spouse",  
        :advance_directive => "documents/advance_directive",
        :advance_directive_spouse => "documents/advance_directive_spouse",
        :certificate_of_trust => "documents/certificate_of_trust",
        :signing_instructions => "documents/signing_instructions", 
        :trust_amendment => "documents/trust_amendment"
      
        :trust_janni => "documents/trust_janni" 

    if @person.single?
      document_list ={            
          :signing_instructions => "documents/signing_instructions",
          :trust_single => "documents/trust_single",
          :will_single => "documents/will_single",
          :power_of_attorney => "documents/power_of_attorney", 
          :advance_directive => "documents/advance_directive",
          :certificate_of_trust => "documents/certificate_of_trust",
          :trust_amendment => "documents/trust_amendment"
                   
      }
    elsif @person.married?    
      document_list ={
                 
          :martin_trust => "documents/martin_trust"        
        
                 
      }
    end    


=end













