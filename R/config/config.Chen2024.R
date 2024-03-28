experiment = c(); filepath = c()

release = '20240229'
filepath$pairs = '../data/Chen2024/Chen2024.stimuli.csv'
filepath$instructions = '../data/Chen2024/Chen2024.stimuli.csv'
filepath$outputfile = paste0('../output/raw/Chen2024.gpt4.',release,'.rds')

# List of valid codes
codes = c('E-beh','E-comp','E-prop','E-state','E-whole',
          'I-contin','I-emo','I-eval',
          'S-action','S-agent','S-context','S-function',
          'S-loc','S-obj','S-targetstate','S-time',
          'T-ant','T-coord','T-sub','T-super','T-syn')

experiment = c(
  name = 'Chen 2024 Associations',
  release = release,
  filepath = filepath,
  codes = codes,  
  setSize = 100, # number of stimuli per prompt
  gpt_temperature = 0,
  gpt_model = "gpt-4-0613"
)

