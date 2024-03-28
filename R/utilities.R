# Sends a request to OpenAI API
ask_gpt = function(gpt_prompt,model,temperature = 0,api_key) {
  response = POST(
    url = "https://api.openai.com/v1/chat/completions",
    add_headers(Authorization = paste("Bearer", api_key)),
    content_type_json(),
    encode = "json",
    body = list(
      model = model,
      #seed = 20231123,
      temperature = temperature,
      max_tokens = 2000,
      messages = list(
        # list(
        #   role = "system",
        #   content = system_prompt
        # ),
        list(
          role = "user",
          content = gpt_prompt
        ))
    )
  )
  return(response)
}

# Preprocess GPT-4 response strings in the following format: 
# "{door — open: Concept properties}"
# and return as a tibble

preprocessResponses = function(responses){
  X.results = tibble()
  
  for (i in 1:length(responses)) {

    w = str_split(responses[[i]],pattern = '\n')[[1]]
    for (j in 1:length(w)){
      
      text = w[j]
      text = str_remove_all(text,'\\{|\\}')
      
      # Regular expression with named capture groups
      regex = "(?<cue>.+?)\\s*—\\s*(?<response>.+?):\\s*(?<relation>.+)"

      # Using str_match to capture groups
      matches = str_match(text, regex)
      
      # If you want to extract and see the captured groups
      if (!any(is.na(matches[1,]))) {
        cue = matches[1,"cue"]
        response = matches[1,"response"]
        relation = matches[1,"relation"]
        relation = str_remove_all(relation,'\\[|\\]')
        X.results = rbind(X.results, tibble(cue = cue, response = response, relation = relation))
      } else {
        #print("No match found")
      }
      
    }
  }
  return(X.results)
}

# Formatting a Confusion Matrix (cm)
createCM = function(X){
  cm = c()
  cm$macro_type = caret::confusionMatrix(
    X %>% pull(human1),
    X %>% pull(model1),
    mode = "prec_recall")
  
  cm$macro_token = caret::confusionMatrix(
    X %>% uncount(frequency) %>% pull(human1),
    X %>% uncount(frequency) %>% pull(model1),
    mode = "prec_recall")
  
  cm$micro_type = caret::confusionMatrix(
    X %>% pull(human2),
    X %>% pull(model2),
    mode = "prec_recall")
  
  cm$micro_token = caret::confusionMatrix(
    X %>% uncount(frequency) %>% pull(human2),
    X %>% uncount(frequency) %>% pull(model2),
    mode = "prec_recall")  
  
  return(cm)
}

# Using production frequency to apply a prevalence weight
prevalenceWeighting = function(cm,datasetName=''){
  result = tibble(
    dataset = datasetName,
    accuracy = cm$overall['Accuracy'],
    NIR = cm$overall['AccuracyNull'],
    p =  cm$overall['AccuracyPValue'],
    Kappa = cm$overall['Kappa'],
    precision = sum(cm$byClass[,'Precision'] * cm$byClass[,'Prevalence'],na.rm=T),
    recall = sum(cm$byClass[,'Recall'] * cm$byClass[,'Prevalence'],na.rm=T),
    F1 = sum(cm$byClass[,'F1'] * cm$byClass[,'Prevalence'],na.rm=T)
  )
  
  return(result)
}


# Abstracted function to ensure compatibility of factors and unify them
unifyFactors = function(data, factor_cols, unify_cols_list) {
  # Ensure specified columns are factors
  data <- data %>% mutate(across(all_of(factor_cols), ~as.factor(.x)))
  
  # Loop through the list of columns groups to unify
  for (cols in unify_cols_list) {
    # Extract the columns to unify
    cols_to_unify <- data[cols]
    
    # Apply fct_unify
    unified_factors <- fct_unify(cols_to_unify)
    
    # Reassign unified factors back to the dataframe
    for (i in seq_along(cols)) {
      col_name <- cols[i]
      # Access unified factors using the index
      data[[col_name]] <- unified_factors[[i]]
    }
  }
  
  return(data)
}

# Convert confusion table frequencies to probabilities
confProb = function(cm){
  cmp = as.data.frame(cm$table)
  cm$Prediction = factor(cm$Prediction, levels=rev(levels(cm$Prediction)))
  cmp = cmp %>% mutate(Prob = Freq / sum(cmp$Freq))
  return(cmp)
}
