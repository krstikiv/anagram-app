module ApplicationHelper
    def words_form_action(word)
    if word.new_record?
        @action = "/words"
        else
        @action = "/words/#{word.id}"
        end
        @action
end
    
    def words_form_method(word)
        if word.new_record?
            @method = "post"
        else
            @method = "put"
        end
        @method
    end

def words_form_id(word)
        if word.new_record?
            @form_id = "new-word"
        else 
            @form_id = "words-#{word.id}"
        end
        @form_id
    end
end