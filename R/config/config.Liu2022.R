experiment = c(); filepath = c()

release = '20240229'
filepath$pairs = '../data/Liu2022/Liu2022.stimuli.csv'
filepath$instructions = '../data/Liu2022/Liu2022.instructions.txt'
filepath$outputfile = paste0('../output/raw/Liu2022.gpt4.',release,'.rds')

# List of valid codes
codes = c('E-mat','E-part','E-prop','I-emo','S-action','S-func','S-loc',
          'S-preq','S-result','S-them','S-time','T-ant','T-cat','T-coord','T-syn')

experiment = c(
  name = 'Liu 2022 Associations',
  codes = codes,
  release = release,
  filepath = filepath,
  setSize = 100, # number of stimuli per prompt
  gpt_temperature = 0,
  gpt_model = "gpt-4-0613"
  
)

